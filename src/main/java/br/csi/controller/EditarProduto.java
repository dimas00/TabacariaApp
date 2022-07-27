package br.csi.controller;


import br.csi.dao.ProdutoDao;
import br.csi.model.Produto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/produto")
public class EditarProduto {
    @GetMapping("/editar")
    public String editar( @RequestParam int id, Model model ){

        Produto produto = new ProdutoDao().getProduto1(id);

        model.addAttribute("produto", produto);

        return "editar";


    }

    @PostMapping("editar")
    public String editar_produto(@ModelAttribute("produto") Produto produto, RedirectAttributes attributes) {

        RedirectView redirect = new RedirectView("/livro/adicionar", true);
        new LivroService().addLivro(livro);

        attributes.addFlashAttribute("addSucesso",true);


        return redirect;






    }

}
