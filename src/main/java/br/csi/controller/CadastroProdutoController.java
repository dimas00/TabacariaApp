package br.csi.controller;

import br.csi.dao.ProdutoDao;
import br.csi.model.Produto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/produto")
public class CadastroProdutoController {

    @GetMapping("/cadastrar")
    public String addproduto(Model model){

        model.addAttribute("produto", new Produto());

        return "produto";
    }

    @PostMapping("")
    public String cadastrar(@RequestParam String nome, @RequestParam  String quantidade, @RequestParam  String preco, @RequestParam  String img, @RequestParam  String descricao, HttpServletRequest req, Model model ) {


        RequestDispatcher rd;

        Produto produto = new Produto();

        produto.setNome(nome);
        produto.setQuantidade(Integer.parseInt(quantidade));
        produto.setPreco(Float.parseFloat(preco));
        produto.setDescricao(descricao);

        if(new ProdutoDao().Cadastrar(produto)) {
            System.out.println("cadastrou");
            req.setAttribute("retorno", "Cadastro feito com sucesso");

            return "produto";

        }else {

            System.out.println("deu ruim");
            req.setAttribute("retorno", "Erro no cadastro");

            return "produto";
        }



    }
}
