# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Image.delete_all
Image.reset_pk_sequence
Image.create([

               {name: 'Endgame position #1', file: 'end1.jpg', theme_id: 1},
               {name: 'Endgame position #2', file: 'end2.jpg', theme_id: 1},
               {name: 'Endgame position #3', file: 'end3.jpg', theme_id: 1},
               {name: 'Endgame position #4', file: 'end4.jpg', theme_id: 1},

               {name: 'Middlegame position #1', file: 'mid1.jpg', theme_id: 2},
               {name: 'Middlegame position #2', file: 'mid2.jpg', theme_id: 2},
               {name: 'Middlegame position #3', file: 'mid3.jpg', theme_id: 2},
               {name: 'Middlegame position #4', file: 'mid4.jpg', theme_id: 2},

               {name: 'Opening position #1', file: 'op1.jpg', theme_id: 3},
               {name: 'Opening position #2', file: 'op2.jpg', theme_id: 3},
               {name: 'Opening position #3', file: 'op3.jpg', theme_id: 3},
               {name: 'Opening position #4', file: 'op4.jpg', theme_id: 3},
             ])

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([

               #{name: "-----"},      # 1 Нет темы
               {name: "Оцените позицию эндшпиля"},      # 1
               {name: "Оцените позицию миттельшпиля"},      # 2
               {name: "Оцените позицию дебюта"},      # 3
             ])

User.delete_all
User.reset_pk_sequence
User.create([

              {name: "Example User", email: "example@railstutorial.org", password: "222222", password_confirmation: "222222"},
            ])
