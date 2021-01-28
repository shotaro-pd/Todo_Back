class Api::TasksController < ApplicationController
    before_action :set_task, only: [:show,:update, :destroy]

    def index
        task = Task.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'タスクのリストを取得', data: task }
    end

    def show
        render json: { status: 'SUCCESS', message: '特定のタスクを取得', data: @task }
    end

    def show_tag
        task = Task.where(tag: params[:id]).order(created_at: :desc)
        render json: { status: 'SUCCESS', message: '特定のタグリストを取得', data: task }
    end

    def create
        task = Task.new(task_params)
        if task.save
            render json: { status: 'SUCCESS',message: 'タスクの作成成功', data: task }
        else
            render json: { status: 'ERROR',message: 'タグ、タスクの入力エラー', data: task.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        if @task.destroy
            render json: { status: 'SUCCESS', message: 'タスクの削除完了', data: @task }
        else
            render json: { status: 'SUCCESS', message: 'タスクの削除失敗', data: @task.errors }
        end
    end

    def update
        if @task.update(task_params)
            render json: { status: 'SUCCESS', message: 'タスクの更新完了', data: @task }
        else
            render json: { status: 'SUCCESS', message: 'タスクの更新失敗', data: @task.errors }
        end
    end

    # before_actionに呼び出されることにより、特定のメソッド実行より前に必ず呼び出される
    private
    def set_task
        @task = Task.find(params[:id])
    end

    #Headerに格納された値を取得、格納
    def task_params
        params.require(:task).permit(:text, :tag)
    end
end

