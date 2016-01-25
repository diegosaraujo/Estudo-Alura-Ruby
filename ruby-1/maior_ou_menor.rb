def da_boas_vindas
    puts "Olá bem vindo ao jogo de adivinhação"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n"
    puts "Começaremos um novo jogo para você, #{nome}"
    puts "\n\n"
end

def pede_dificuldade
   puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
   dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
   if dificuldade == 1
     maximo = 30
 else
      if dificuldade == 2
         maximo = 60
      else
         if dificuldade == 3
            maximo = 100
         else
            if dificuldade == 4
               maximo = 150
            else
               maximo = 200
            end
         end
      end
   end

    puts "Escolhendo um número entre 0 e #{maximo - 1}"
    puts "Número secreto escolhido...Que tal adivinhar nosso número secreto?"
    sorteado = rand (maximo)
    return sorteado
end

def pede_um_numero(chutes, tentativas, limite_tentativas)
    puts "Tentativa #{tentativas} de #{limite_tentativas}"
    puts "Tentativas já realizadas: #{chutes}"
    puts "Entre com um número"
    chute = gets.strip
    return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute
    if acertou
     puts "Acertou!"
     return true
    end
     maior = numero_secreto > chute
     if maior
      puts "O número secreto é maior"
     else
      puts "O número secreto é menor"
     end
    return false
end

da_boas_vindas
dificuldade = pede_dificuldade
numero_secreto = sorteia_numero_secreto(dificuldade)

pontos_ate_agora = 1000
limite_tentativas = 5
chutes = []
#total_de_chutes = 0

for tentativas in 1..limite_tentativas
    chute = pede_um_numero chutes, tentativas, limite_tentativas
    chutes << chute

    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder

    if verifica_se_acertou numero_secreto, chute
       break
    end
end

puts "Você ganhou #{pontos_ate_agora} pontos"
