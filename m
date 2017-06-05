From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 5/5] ARM: dts: imx6: RIoTboard provide Standby to
 PowerOff option
Date: Mon, 5 Jun 2017 10:13:27 +0800
Message-ID: <20170605021326.GA18669@dragon>
References: <20170529170924.25488-1-o.rempel@pengutronix.de>
 <20170529170924.25488-5-o.rempel@pengutronix.de>
 <20170605015027.GE4094@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170605015027.GE4094@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-Q5frsOzIlS7zxQdaRaTXBw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 05, 2017 at 09:50:29AM +0800, Shawn Guo wrote:
> On Mon, May 29, 2017 at 07:09:24PM +0200, Oleksij Rempel wrote:
> > This board, as well as some other boards with i.MX6 and a PMIC, uses a
> > "MPIC_STBY_REQ" line to notify the PMIC about a state change.
> > The PMIC is programmed for a specific state change before triggering the
> > line.
> > In this case, PMIC_STBY_REQ can be used for Stand by, Sleep
> > and Power off modes.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  arch/arm/boot/dts/imx6dl-riotboard.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
> > index 2cb72824e800..b5f25fe7b809 100644
> > --- a/arch/arm/boot/dts/imx6dl-riotboard.dts
> > +++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
> > @@ -90,6 +90,10 @@
> >  	status = "okay";
> >  };
> >  
> > +&clks {
> > +	fsl,pmic_stby_poweroff;
> > +};
> > +
> >  &fec {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_enet>;
> > @@ -125,6 +129,7 @@
> >  		reg = <0x08>;
> >  		interrupt-parent = <&gpio5>;
> >  		interrupts = <16 8>;
> > +		fsl,pmic_stby_poweroff;
> 
> Is this property supported by upstream kernel?

Okay, just noticed that it's the last patch of series adding
fsl,pmic_stby_poweroff support.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
