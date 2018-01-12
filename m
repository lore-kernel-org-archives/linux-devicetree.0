From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
Date: Fri, 12 Jan 2018 10:45:56 +0100
Message-ID: <CAMuHMdWMgst-1evod+0hZujU2xPtO3UmO9c2CPPrTg=gpHpTbw@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -0,0 +1,54 @@
> +Renesas R-Car LVDS Encoder
> +==========================
> +
> +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car Gen2
> +and Gen3 SoCs.
> +
> +Required properties:
> +
> +- compatible : Shall contain one of
> +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS encoders
> +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS encoders
> +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS encoders
> +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS encoders
> +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS encoders
> +
> +- reg: Base address and length for the memory-mapped registers
> +- clocks: A phandle + clock-specifier pair for the functional clock

Please document the "resets" property, too, and add it to the example.
According to the rcar-3.6.0 BSP, reset support is needed desperately.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
