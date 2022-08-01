package br.csi.controller;

import br.csi.dao.ProdutoDao;
import br.csi.model.Produto;
import br.csi.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/compra")
public class CompraController {

    @GetMapping("/produto")
    public String comprar(@RequestParam int id_produto, int id_usuario,  Model model) {

        System.out.println(id_produto);
        System.out.println(id_usuario);
        boolean compra = new ProdutoDao().Comprar(id_usuario, id_produto);

        model.addAttribute("id_usuario", id_usuario);

        return "redirect:editar?id="+id_usuario;
    }

    @GetMapping("editar")
    public Object exibirCompra(@RequestParam("id") int id,  Model model) {

        Produto produto = new ProdutoDao().getCompra(id);

            model.addAttribute("produto", produto);

            return "compras";


    }
}


