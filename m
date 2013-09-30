From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM i.MX53: dts: Add TVE to i.MX53-QSB device tree
Date: Mon, 30 Sep 2013 16:40:08 +0200
Message-ID: <1380552008.3959.29.camel@pizza.hi.pengutronix.de>
References: <1380192374-9531-1-git-send-email-p.zabel@pengutronix.de>
	 <1380192374-9531-2-git-send-email-p.zabel@pengutronix.de>
	 <20130927011643.GB25146@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130927011643.GB25146-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 27.09.2013, 09:16 +0800 schrieb Shawn Guo:
> On Thu, Sep 26, 2013 at 12:46:14PM +0200, Philipp Zabel wrote:
> > This patch enables the TVE which is driving the VGA connector on i.MX53-QSB.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx53-qsb.dts | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx53-qsb.dts b/arch/arm/boot/dts/imx53-qsb.dts
> > index cf1aef7..3bbedf7 100644
> > --- a/arch/arm/boot/dts/imx53-qsb.dts
> > +++ b/arch/arm/boot/dts/imx53-qsb.dts
> > @@ -173,6 +173,15 @@ memgpu: /memreserve/ 0xb0000000 0x04000000;
> >  		};
> >  	};
> >  
> > +	tve {
> > +		pinctrl_vga_sync_1: vgasync-grp1 {
> > +			fsl,pins = <
> > +				/* VGA_HSYNC, VSYNC with max drive strength */
> > +				MX53_PAD_EIM_OE__IPU_DI1_PIN7 0xe6
> > +				MX53_PAD_EIM_RW__IPU_DI1_PIN8 0xe6
> > +			>;
> > +		};
> > +	};
> >  };
> >  
> >  &uart1 {
> > @@ -280,8 +289,8 @@ memgpu: /memreserve/ 0xb0000000 0x04000000;
> >  			};
> >  
> >  			ldo8_reg: ldo8 {
> > -				regulator-min-microvolt = <1200000>;
> > -				regulator-max-microvolt = <3600000>;
> > +				regulator-min-microvolt = <2750000>;
> > +				regulator-max-microvolt = <2750000>;
> 
> Why this change?

According to the reference manual, the TVDAC supply should be 2.75 V. If
there are no ill effects if this ldo is actually set to 3.6 V, this
change could be dropped.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
