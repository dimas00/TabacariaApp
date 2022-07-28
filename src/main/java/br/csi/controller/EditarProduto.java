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
    public Object editar_produto(@ModelAttribute("produto") Produto produto, RedirectAttributes attributes) {

        if(new ProdutoDao().Editar(produto)) {
            System.out.println("cadastrou");
            attributes.addFlashAttribute("retorno","Edição feita com sucesso");
            RedirectView redirect = new RedirectView("/produto/listar", true);
            return redirect;
        }else {

            System.out.println("deu ruim");

            attributes.addFlashAttribute("retorno",true);
        }
        return false;
    }

    @GetMapping("/excluir")
    public Object excluir(@RequestParam int id, Model model, RedirectAttributes attributes ){

        Produto produto = new ProdutoDao().getProduto1(id);

        if(new ProdutoDao().Editar(produto)) {
            System.out.println("excluiu");
            attributes.addFlashAttribute("retorno","Exclusão realizada com sucesso");
            RedirectView redirect = new RedirectView("/produto/listar", true);
            return redirect;

        }else {

            System.out.println("deu ruim");

            attributes.addFlashAttribute("retorno","Erro ao excluir");
            RedirectView redirect = new RedirectView("/produto/listar", true);
            return redirect;
        }

    }

}
