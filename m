From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
Date: Tue, 2 Feb 2016 10:39:31 +0000
Message-ID: <TY1PR06MB0928C88377A9640546246763D8DF0@TY1PR06MB0928.apcprd06.prod.outlook.com>
References: <1454322540-5608-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUEUDkB3=jHAwXDozpdgFCimGS=LXsrxSVWac5xW2bg+A@mail.gmail.com>
 <20160202102959.GG15554@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160202102959.GG15554-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> Sent: Tuesday, February 02, 2016 7:30 PM
> 
> On Tue, Feb 02, 2016 at 11:10:00AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Feb 1, 2016 at 11:29 AM, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> > > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > @@ -880,5 +880,31 @@
> > >                         power-domains = <&cpg>;
> > >                         status = "disabled";
> > >                 };
> > > +
> > > +               usb_dmac0: dma-controller@e65a0000 {
> > > +                       compatible = "renesas,r8a7795-usb-dmac",
> > > +                                    "renesas,usb-dmac";
> > > +                       reg = <0 0xe65a0000 0 0x100>;
> > > +                       interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
> > > +                                     0 109 IRQ_TYPE_LEVEL_HIGH>;
> >
> > Sorry, I missed you're not using the GIC_SPI defines.
> 
> Thanks, I fixed that and queued up the following

Thank you very much for the fix!

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Date: Mon, 1 Feb 2016 19:29:00 +0900
> Subject: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 119549e6502d..95967b72db35 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -880,5 +880,31 @@
>  			power-domains = <&cpg>;
>  			status = "disabled";
>  		};
> +
> +		usb_dmac0: dma-controller@e65a0000 {
> +			compatible = "renesas,r8a7795-usb-dmac",
> +				     "renesas,usb-dmac";
> +			reg = <0 0xe65a0000 0 0x100>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1";
> +			clocks = <&cpg CPG_MOD 330>;
> +			power-domains = <&cpg>;
> +			#dma-cells = <1>;
> +			dma-channels = <2>;
> +		};
> +
> +		usb_dmac1: dma-controller@e65b0000 {
> +			compatible = "renesas,r8a7795-usb-dmac",
> +				     "renesas,usb-dmac";
> +			reg = <0 0xe65b0000 0 0x100>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1";
> +			clocks = <&cpg CPG_MOD 331>;
> +			power-domains = <&cpg>;
> +			#dma-cells = <1>;
> +			dma-channels = <2>;
> +		};
>  	};
>  };
> --
> 2.7.0.rc3.207.g0ac5344

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
