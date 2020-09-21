Delimiter &&
	create procedure sp_bind_notes(
		in nota1out int,
        in nota2out int,
        in nota3out int,
        in id int
    )
    begin
		Declare mediaout int unsigned;
        set mediaout = fn_return_media(nota1out,nota2out,nota3out);
        start transaction;
				update tbl_notas set nota1 = nota1out,nota2 = nota2out,nota3 = nota3out, media = mediaout
                where idNotas = id;
			commit;               
    end&&
Delimiter ;


create function fn_return_media(
	 nota1 int,
	 nota2 int,
	 nota3 int
) returns int
return (nota1+nota2+nota3)/3;

#create trigger tr_inserted_notes after update
#on tbl_notas
#for each Row
#select 'Dados inseridos com sucesso!';


select fn_return_media(10,10,10);