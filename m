From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: renesas,h8300-bsc
Date: Mon, 29 Jun 2015 11:51:13 +0200
Message-ID: <CAMuHMdUUt6pgYqz35MyxSEnOds3Ji9CpQMU4m4ihqS_PO6ei=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Cc: uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sato-san,

Documentation/devicetree/bindings/memory-controllers/renesas,h8300-bsc.txt says:

+Required properties:
+  - compatible: Must be "renesas,h8300-bsc".
+  - reg: Base address and length of BSC registers.

But the example uses another compatible value, which is not documented,
in addition to the one above:

+Example.
+       bsc: memory-controller@fee01e {
+               compatible = "renesas,h8300h-bsc", "renesas,h8300-bsc";
+               reg = <0xfee01e 8>;
+       };

The example matches the simulator's dts:

h8300h_sim.dts: compatible = "renesas,h8300h-bsc", "renesas,h8300-bsc";

But the dtses for real hardware use yet another undocumented value:

edosk2674.dts: compatible = "renesas,h8s-bsc", "renesas,h8300-bsc";
h8s_sim.dts: compatible = "renesas,h8s-bsc", "renesas,h8300-bsc";

Can you please fix this?

BTW, scripts/checkpatch.pl should have told you about some of the
discrepancies.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
