From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: shmobile: r8a7791: Enable DMA for HSUSB
Date: Tue, 7 Apr 2015 15:34:40 +0200
Message-ID: <CAMuHMdXu46NK37gcweCz_XTABUJw6kN0fnyxmmGeL9cGRWdJdg@mail.gmail.com>
References: <1428393231-5272-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1428393231-5272-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428393231-5272-3-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Tue, Apr 7, 2015 at 9:53 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds DMA properties to the HSUSB node.

Thank you for your patch!

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/r8a7791.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index db3772e..5f20ad4 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -722,6 +722,9 @@
>                 renesas,buswait = <4>;
>                 phys = <&usb0 1>;
>                 phy-names = "usb";
> +               dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
> +                      <&usb_dmac1 0>, <&usb_dmac1 1>;
> +               dma-names = "rx0", "tx1", "rx2", "tx3";

The numbering looks a bit strange, given the code looks up both tx and rx
DMA channels for each channel index. Is it correct?

The binding documentation (which lacks on example) states:

  - dma-names : Must contain a list of DMA names:
   - tx0 ... tx<n>
   - rx0 ... rx<n>
    - This <n> means DnFIFO in USBHS module.

As there are 4 DnFIFOs, I'd expect tx0..tx3 and rx0..rx3.

Can you please clarify?
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
