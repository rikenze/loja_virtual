class Movel {

  String titulo;
  String foto;
  String descricao;
  int preco;

  Movel(this.titulo, this.preco, this.foto, this.descricao);

  Movel.fromJson(Map<String, dynamic> json){
    titulo = json["titulo"];
    foto = json["foto"];
    descricao = json["descricao"];
    preco = json["preco"];
  }

}