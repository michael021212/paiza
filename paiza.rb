total_wage = 0 #給与の合計

wage_per_hour_array = gets.chomp.split(" ") #時給の配列(入力の1行目)
normal_wage = wage_per_hour_array[0].to_i #通常時給
night_wage = wage_per_hour_array[1].to_i #夜時給
midnight_wage = wage_per_hour_array[2].to_i #深夜時給

days = gets.to_i #勤務日数(入力の2行目)
days.times do #勤務日数分ループする
  work_time_array = gets.chomp.split(" ") #その日の出勤時間と退勤時間の配列(ループ内なので、3行目、4行目、5行目...と代入される値は変わっていく)
  begin_time = work_time_array[0].to_i #その日の出勤時間
  finish_time = work_time_array[1].to_i #その日の退勤時間
  work_time_per_day = finish_time - begin_time #その日の勤務時間

  current_time = begin_time + 1 #現在の時間(仮にbegin_timeが2でcurrent_timeが3だとすると、２時〜３時までの勤務ということ)

  work_time_per_day.times do #その日の勤務時間分繰り返す
    case current_time
    when 0..9, 23
      total_wage += midnight_wage
    when 10..17
      total_wage += normal_wage
    when 18..22
      total_wage += night_wage
    end
    current_time += 1 #次のループにいく前に1プラスして次の時間にする
  end
end

puts total_wage