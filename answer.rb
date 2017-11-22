def question_answers
  question_answers = [
    { question1:
      { title: "user_id 1のuserが注文した件数",
        answers: [ "user = User.find(1)",]
      }
    },
    { question2:
      { title: "最後に注文したuserの名前",
        answers: ["max_order_date = Order.maximum(:order_date); last_order = Order.find_by(order_date: max_order_date)", ]
      }
    },
    { question3:
      { title: "cityの名称一覧(id, nameのみ出力)",
        answers: ["cities = Area.pluck(:prefecture, :city).uniq"]
      }
    },
    { question4:
      { title: "渋谷区のshop一覧取得",
        answers: ["shops = Shop.includes(:areas).where(areas: {city: '渋谷区'})", ]
      }
    },
    { question5:
      { title: "1のuserが注文した料理一覧を取得",
        answers: ["user = User.find(1); details = OrderDetail.where(order_id: user.orders.ids); dishes = Dish.where(id: details.pluck(:dish_id))"]
      }
    },
    { question6:
      { title: "1のuserが注文した料理一覧を取得",
        answers: ["user = User.find(1); details = OrderDetail.where(order_id: user.orders.ids); amount = details.inject(0){|result, detail| result += detail.dish.price * detail.quantity}"]
      }
    },
  ]
end

puts answers
