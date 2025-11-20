require 'telegram/bot'

TOKEN = '8173451784:AAHhyOv8QztU4bszEigth_Kv6k_BFoT8wvE'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message
    when Telegram::Bot::Types::Message
      if message.text == '/start'
        bot.api.send_message(
          chat_id: message.chat.id,
          text: "Привіт! 👋 Я бот, який повторює твої повідомлення."
        )
      else
        # Ехо-функція — повторюємо текст користувача
        bot.api.send_message(
          chat_id: message.chat.id,
          text: "Ти написав: #{message.text}"
        )
      end
    end
  end
end