From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/4] dt-bindings: Document Renesas R-Car FCP power-domains usage
Date: Sat, 28 May 2016 21:03:55 +0200
Message-ID: <CAMuHMdUvRN2ysYJ9g0daOD8sD7O5XcrZkKbWr0X_L7mG25Ocww@mail.gmail.com>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
	<1464369565-12259-5-git-send-email-kieran@bingham.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464369565-12259-5-git-send-email-kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

On Fri, May 27, 2016 at 7:19 PM, Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org> wrote:
> The example misses the power-domains usage, and documentation that the
> property is used by the node.
>
> Signed-off-by: Kieran Bingham <kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>

Thanks for your patch!

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> index 1c0718b501ef..464bb7ae4b92 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -21,6 +21,8 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
>
>   - reg: the register base and size for the device registers
>   - clocks: Reference to the functional clock
> + - power-domains : power-domain property defined with a phandle
> +                           to respective power domain.

I'd write "power domain specifier" instead of "phandle". While SYSC on R-Car
Gen3 uses #power-domain-cells = 0, the FCP module may show up on another
SoC that uses a different value, needing more than just a phandle.

In fact I'm inclined to leave out the power-domains property completely:
it's not a feature of the FCP, but of the SoC the FCP is part of.
power-domains properties may appear in any device node where needed.

>  Device node example
> @@ -30,4 +32,5 @@ Device node example
>                 compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
>                 reg = <0 0xfea2f000 0 0x200>;
>                 clocks = <&cpg CPG_MOD 602>;
> +               power-domains = <&sysc R8A7795_PD_A3VP>;

Adding it to the example doesn't hurt, though.

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
