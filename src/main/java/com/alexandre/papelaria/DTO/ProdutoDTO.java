package com.alexandre.papelaria.DTO;

public class ProdutoDTO {

	private Integer barcode;

	private String nome;

	private String descricao;

	private Integer quantidade;

	private Integer CatId;

	private String CatDesc;

	public ProdutoDTO() {

	}

	public Integer getBarcode() {
		return barcode;
	}

	public void setBarcode(Integer barcode) {
		this.barcode = barcode;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Integer getCatId() {
		return CatId;
	}

	public void setCatId(Integer catId) {
		CatId = catId;
	}

	public String getCatDesc() {
		return CatDesc;
	}

	public void setCatDesc(String catDesc) {
		CatDesc = catDesc;
	}

}
