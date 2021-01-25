# Ruby on Rails学習用Todoアプリ（バックエンド）

## わかったこと
### Controllerでの'@'について
* '@'はインスタンス変数を指すもので、そのクラスであればどこからでもアクセスができるもの
* Controlleについてるもの、ついてないものが存在するが、before_actionのOnlyで書かれたものはついている。理由としてはメソッドに取得した内容を渡しているのではなく、そのクラスで保持しているだけだから。

### routesについて
* 基本的にController名にresourcesをつけておけば、以下の基本的なCRUDはroutesに追加される
    * index
    * show
    * create
    * delete
    * update
* 基本的なCRUD以外を追加したいときは下記のようにresources doで囲む
    * memberで/task/:id/show_tag
    * collectionで/task/show_tag

'''
resources :tasks do
    member do
        get :show_tag
    end
end
'''

