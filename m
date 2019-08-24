From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date: Sat, 24 Aug 2019 14:51:54 +0200
Message-ID: <2544007.NTLiB2pbcT@jernej-laptop>
References: <20190820151934.3860-1-megous@megous.com> <10586215.O0B29uHg7A@jernej-laptop> <20190824124654.nqtlkam2gsaqsj77@core.my.home>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRB3PFQTVQKGQEVTLMU7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190824124654.nqtlkam2gsaqsj77-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 14:46:54 CEST je Ond=C5=99ej Jirman napisal(=
a):
> Hi,
>=20
> On Sat, Aug 24, 2019 at 02:32:32PM +0200, Jernej =C5=A0krabec wrote:
> > Hi!
> >=20
> > Dne torek, 20. avgust 2019 ob 17:19:33 CEST je megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org=20
napisal(a):
> > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > >=20
> > > RTC on H6 is mostly the same as on H5 and H3. It has slight differenc=
es
> > > mostly in features that are not yet supported by this driver.
> > >=20
> > > Some differences are already stated in the comments in existing code.
> > > One other difference is that H6 has extra bit in LOSC_CTRL_REG, calle=
d
> > > EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> > >=20
> > > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check wheth=
er
> > > external low speed oscillator is working correctly.
> > >=20
> > > This patch adds support for enabling LOSC when necessary:
> > >=20
> > > - during reparenting
> > > - when probing the clock
> > >=20
> > > H6 also has capacbility to automatically reparent RTC clock from
> > > external crystal oscillator, to internal RC oscillator, if external
> > > oscillator fails. This is enabled by default. Disable it during
> > > probe.
> > >=20
> > > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > ---
> > >=20
> > >  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++-=
-
> > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > index d50ee023b559..b0c3752bed3f 100644
> > > --- a/drivers/rtc/rtc-sun6i.c
> > > +++ b/drivers/rtc/rtc-sun6i.c
> > > @@ -32,9 +32,11 @@
> > >=20
> > >  /* Control register */
> > >  #define SUN6I_LOSC_CTRL				0x0000
> > >  #define SUN6I_LOSC_CTRL_KEY			(0x16aa << 16)
> > >=20
> > > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
> >=20
> > User manual says that above field is bit 14.
>=20
> See the previous discussion, this is from BSP.

I have two versions of BSP (don't ask me which) which have this set as bit =
14=20
and changing this to 14 actually solves all my problems with LOSC (no more=
=20
issues with setting RTC and HDMI-CEC works now - it uses LOSC as parent) on=
=20
Tanix TX6 box.

Best regards,
Jernej

>=20
> regards,
> 	o.
>=20
> > Best regards,
> > Jernej
> >=20
> > >  #define SUN6I_LOSC_CTRL_ALM_DHMS_ACC		BIT(9)
> > >  #define SUN6I_LOSC_CTRL_RTC_HMS_ACC		BIT(8)
> > >  #define SUN6I_LOSC_CTRL_RTC_YMD_ACC		BIT(7)
> > >=20
> > > +#define SUN6I_LOSC_CTRL_EXT_LOSC_EN		BIT(4)
> > >=20
> > >  #define SUN6I_LOSC_CTRL_EXT_OSC			BIT(0)
> > >  #define SUN6I_LOSC_CTRL_ACC_MASK		GENMASK(9, 7)
> > >=20
> > > @@ -128,6 +130,8 @@ struct sun6i_rtc_clk_data {
> > >=20
> > >  	unsigned int has_prescaler : 1;
> > >  	unsigned int has_out_clk : 1;
> > >  	unsigned int export_iosc : 1;
> > >=20
> > > +	unsigned int has_losc_en : 1;
> > > +	unsigned int has_auto_swt : 1;
> > >=20
> > >  };
> > > =20
> > >  struct sun6i_rtc_dev {
> > >=20
> > > @@ -190,6 +194,10 @@ static int sun6i_rtc_osc_set_parent(struct clk_h=
w
> > > *hw,
> > > u8 index) val &=3D ~SUN6I_LOSC_CTRL_EXT_OSC;
> > >=20
> > >  	val |=3D SUN6I_LOSC_CTRL_KEY;
> > >  	val |=3D index ? SUN6I_LOSC_CTRL_EXT_OSC : 0;
> > >=20
> > > +	if (rtc->data->has_losc_en) {
> > > +		val &=3D ~SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > > +		val |=3D index ? SUN6I_LOSC_CTRL_EXT_LOSC_EN : 0;
> > > +	}
> > >=20
> > >  	writel(val, rtc->base + SUN6I_LOSC_CTRL);
> > >  	spin_unlock_irqrestore(&rtc->lock, flags);
> > >=20
> > > @@ -215,6 +223,7 @@ static void __init sun6i_rtc_clk_init(struct
> > > device_node *node, const char *iosc_name =3D "rtc-int-osc";
> > >=20
> > >  	const char *clkout_name =3D "osc32k-out";
> > >  	const char *parents[2];
> > >=20
> > > +	u32 reg;
> > >=20
> > >  	rtc =3D kzalloc(sizeof(*rtc), GFP_KERNEL);
> > >  	if (!rtc)
> > >=20
> > > @@ -235,9 +244,18 @@ static void __init sun6i_rtc_clk_init(struct
> > > device_node *node, goto err;
> > >=20
> > >  	}
> > >=20
> > > +	reg =3D SUN6I_LOSC_CTRL_KEY;
> > > +	if (rtc->data->has_auto_swt) {
> > > +		/* Bypass auto-switch to int osc, on ext losc failure=20
*/
> > > +		reg |=3D SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS;
> > > +		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > > +	}
> > > +
> > >=20
> > >  	/* Switch to the external, more precise, oscillator */
> > >=20
> > > -	writel(SUN6I_LOSC_CTRL_KEY | SUN6I_LOSC_CTRL_EXT_OSC,
> > > -	       rtc->base + SUN6I_LOSC_CTRL);
> > > +	reg |=3D SUN6I_LOSC_CTRL_EXT_OSC;
> > > +	if (rtc->data->has_losc_en)
> > > +		reg |=3D SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > > +	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > >=20
> > >  	/* Yes, I know, this is ugly. */
> > >  	sun6i_rtc =3D rtc;
> > >=20
> > > @@ -345,6 +363,23 @@ CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk,
> > > "allwinner,sun8i-h3-rtc", CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk,
> > > "allwinner,sun50i-h5-rtc", sun8i_h3_rtc_clk_init);
> > >=20
> > > +static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data =3D {
> > > +	.rc_osc_rate =3D 16000000,
> > > +	.fixed_prescaler =3D 32,
> > > +	.has_prescaler =3D 1,
> > > +	.has_out_clk =3D 1,
> > > +	.export_iosc =3D 1,
> > > +	.has_losc_en =3D 1,
> > > +	.has_auto_swt =3D 1,
> > > +};
> > > +
> > > +static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
> > > +{
> > > +	sun6i_rtc_clk_init(node, &sun50i_h6_rtc_data);
> > > +}
> > > +CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
> > > +		      sun50i_h6_rtc_clk_init);
> > > +
> > >=20
> > >  static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data =3D {
> > > =20
> > >  	.rc_osc_rate =3D 32000,
> > >  	.has_out_clk =3D 1,
> > >=20
> > > @@ -675,6 +710,7 @@ static const struct of_device_id sun6i_rtc_dt_ids=
[]
> > > =3D {
> > >=20
> > >  	{ .compatible =3D "allwinner,sun8i-r40-rtc" },
> > >  	{ .compatible =3D "allwinner,sun8i-v3-rtc" },
> > >  	{ .compatible =3D "allwinner,sun50i-h5-rtc" },
> > >=20
> > > +	{ .compatible =3D "allwinner,sun50i-h6-rtc" },
> > >=20
> > >  	{ /* sentinel */ },
> > > =20
> > >  };
> > >  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/2544007.NTLiB2pbcT%40jernej-laptop.
