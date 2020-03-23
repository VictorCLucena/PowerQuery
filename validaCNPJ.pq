// https://www.geradorcnpj.com/algoritmo_do_cnpj.htm

let validaCNPJ = (CNPJ as text) =>
    if 
                Text.Length(CNPJ) = 14
                and
                ( List.Contains(
                {
                "00000000000000",
                "11111111111111",
                "22222222222222",
                "33333333333333",
                "44444444444444",
                "55555555555555",
                "66666666666666",
                "77777777777777",
                "88888888888888",
                "99999999999999"
                }, CNPJ) = false)
            then
                let

                validador1 =

                Number.Mod(
                    (Number.From(Text.ToList(CNPJ){0}) * 5 +
                    Number.From(Text.ToList(CNPJ){1}) * 4 +
                    Number.From(Text.ToList(CNPJ){2}) * 3 +
                    Number.From(Text.ToList(CNPJ){3}) * 2 +
                    Number.From(Text.ToList(CNPJ){4}) * 9 +
                    Number.From(Text.ToList(CNPJ){5}) * 8 +
                    Number.From(Text.ToList(CNPJ){6}) * 7 +
                    Number.From(Text.ToList(CNPJ){7}) * 6 +
                    Number.From(Text.ToList(CNPJ){8}) * 5 +
                    Number.From(Text.ToList(CNPJ){9}) * 4 +
                    Number.From(Text.ToList(CNPJ){10}) * 3 +
                    Number.From(Text.ToList(CNPJ){11}) * 2
                ), 11),

                validador2 =

                Number.Mod(
                    (Number.From(Text.ToList(CNPJ){0}) * 6 +
                    Number.From(Text.ToList(CNPJ){1}) * 5 +
                    Number.From(Text.ToList(CNPJ){2}) * 4 +
                    Number.From(Text.ToList(CNPJ){3}) * 3 +
                    Number.From(Text.ToList(CNPJ){4}) * 2 +
                    Number.From(Text.ToList(CNPJ){5}) * 9 +
                    Number.From(Text.ToList(CNPJ){6}) * 8 +
                    Number.From(Text.ToList(CNPJ){7}) * 7 +
                    Number.From(Text.ToList(CNPJ){8}) * 6 +
                    Number.From(Text.ToList(CNPJ){9}) * 5 +
                    Number.From(Text.ToList(CNPJ){10}) * 4 +
                    Number.From(Text.ToList(CNPJ){11}) * 3 +
                    Number.From(Text.ToList(CNPJ){12}) * 2
                ), 11),

                validador1n = if validador1 < 2 then 0 else 11 - validador1,

                validador2n = if validador2 < 2 then 0 else 11 - validador2,

                CNPJvalido = if 
                                (validador1n = Number.From(Text.ToList(CNPJ){12}) and validador2n = Number.From(Text.ToList(CNPJ){13}) )
                                then "CNPJ Válido"
                                else "DOC Inválido"

                in

                CNPJvalido



            else "DOC Inválido"


in
validaCNPJ