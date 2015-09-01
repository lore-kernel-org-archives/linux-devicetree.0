From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: nand: pxa3xx: add optional dma for pxa architecture
Date: Tue, 1 Sep 2015 08:16:27 -0500
Message-ID: <CAL_JsqKpMZMWKxtn2rUeKQQY9v8sfzmGnLaaP77hGqU1ek=_aA@mail.gmail.com>
References: <1440963852-17936-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440963852-17936-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 30, 2015 at 2:44 PM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
> The PXA architecture provides a DMA to pump data from the nand
> controller to memory and the other way around. Add it to the binding
> description.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> index 4f833e3c4f51..d9b655f11048 100644
> --- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> @@ -11,6 +11,7 @@ Required properties:
>
>  Optional properties:
>
> + - dmas:                       dma data channel, see dma.txt binding doc
>   - marvell,nand-enable-arbiter:        Set to enable the bus arbiter
>   - marvell,nand-keep-config:   Set to keep the NAND controller config as set
>                                 by the bootloader
> @@ -32,6 +33,8 @@ Example:
>                 compatible = "marvell,pxa3xx-nand";
>                 reg = <0x43100000 90>;
>                 interrupts = <45>;
> +               dmas = <&pdma 97 0>;
> +               dma-names = "data";
>                 #address-cells = <1>;
>
>                 marvell,nand-enable-arbiter;
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
