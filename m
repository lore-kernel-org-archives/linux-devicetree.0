From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Update Renesas R-Car FCP DT binding
Date: Sat, 28 May 2016 21:06:10 +0200
Message-ID: <CAMuHMdUhv24QWE44k-nHTAkfy_EnDv76toUuOoD46pKNNR3r3w@mail.gmail.com>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
	<1464369565-12259-4-git-send-email-kieran@bingham.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464369565-12259-4-git-send-email-kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

On Fri, May 27, 2016 at 7:19 PM, Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org> wrote:
> The FCP driver, can also support the FCPF variant for FDP1 compatible
> processing.
>
> Signed-off-by: Kieran Bingham <kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>

Thanks for your patch!

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> index 6a12960609d8..1c0718b501ef 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -7,11 +7,12 @@ conversion of AXI transactions in order to reduce the memory bandwidth.
>
>  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
>  for FDP (FCPF). Their configuration and behaviour depend on the module they
> -are paired with. These DT bindings currently support the FCPV only.
> +are paired with. These DT bindings currently support the FCPV and FCPF.
>
>   - compatible: Must be one or more of the following
>
>     - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
> +   - "renesas,r8a7795-fcpf" for R8A7795 (R-Car H3) compatible 'FCP for FDP'
>     - "renesas,fcpv" for generic compatible 'FCP for VSP'

I guess checkpatch complained about your dtsi additions because you forgot
to add  "renesas,fcpf" here?

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
