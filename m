From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] irqchip: Supply new driver for STi based devices
Date: Fri, 26 Sep 2014 10:34:33 +0100
Message-ID: <20140926093433.GC4097@lee--X1>
References: <1406642744-22589-1-git-send-email-lee.jones@linaro.org>
 <1406642744-22589-3-git-send-email-lee.jones@linaro.org>
 <20140818123208.GR12769@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140818123208.GR12769-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Aug 2014, Jason Cooper wrote:
> On Tue, Jul 29, 2014 at 03:05:40PM +0100, Lee Jones wrote:
> > This driver is used to enable System Configuration Register control=
led
> > External, CTI (Core Sight), PMU (Performance Management), and PL310=
 L2
> > Cache IRQs prior to use.
> >=20
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/irqchip/Kconfig  |   7 ++
> >  drivers/irqchip/Makefile |   1 +
> >  drivers/irqchip/irq-st.c | 206 +++++++++++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 214 insertions(+)
> >  create mode 100644 drivers/irqchip/irq-st.c

Wow, I forgot all about this!

I'll fixup and resubmit after the merge window.

> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index bbb746e..7252de9 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -91,3 +91,10 @@ config IRQ_CROSSBAR
> >  	  The primary irqchip invokes the crossbar's callback which intur=
n allocates
> >  	  a free irq and configures the IP. Thus the peripheral interrupt=
s are
> >  	  routed to one of the free irqchip interrupt lines.
> > +
> > +config ST_IRQCHIP
> > +	bool
> > +	select REGMAP
> > +	select MFD_SYSCON
> > +	help
> > +	  Enables SysCfg Controlled IRQs on STi based platforms.
>=20
> Now that I have my head above water (a bit) wrt irqchip, I really don=
't
> like the hot mess that this file has become...

What does that mean?

> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 62a13e5..f859c14 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -30,3 +30,4 @@ obj-$(CONFIG_XTENSA)			+=3D irq-xtensa-pic.o
> >  obj-$(CONFIG_XTENSA_MX)			+=3D irq-xtensa-mx.o
> >  obj-$(CONFIG_IRQ_CROSSBAR)		+=3D irq-crossbar.o
> >  obj-$(CONFIG_BRCMSTB_L2_IRQ)		+=3D irq-brcmstb-l2.o
> > +obj-$(CONFIG_ST_IRQCHIP)		+=3D irq-st.o
> > diff --git a/drivers/irqchip/irq-st.c b/drivers/irqchip/irq-st.c
> > new file mode 100644
> > index 0000000..f31126f
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-st.c

[...]

> > +#define ST_A9_IRQ_EN_pl310_L2		BIT(4)
>=20
> PL310

Good spot.

[...]

> > +	/* Set the device enable bit. */
> > +	switch (device) {
> > +	case ST_IRQ_SYSCFG_EXT_0 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_EXT_0;
> > +		break;
> > +	case ST_IRQ_SYSCFG_EXT_1 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_EXT_1;
> > +		break;
> > +	case ST_IRQ_SYSCFG_EXT_2 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_EXT_2;
> > +		break;
> > +	case ST_IRQ_SYSCFG_CTI_0 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_CTI_0;
> > +		break;
> > +	case ST_IRQ_SYSCFG_CTI_1 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_CTI_1;
> > +		break;
> > +	case ST_IRQ_SYSCFG_PMU_0 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_PMU_0;
> > +		break;
> > +	case ST_IRQ_SYSCFG_PMU_1 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_PMU_1;
> > +		break;
> > +	case ST_IRQ_SYSCFG_pl310_L2 :
> > +		ddata->result |=3D ST_A9_IRQ_EN_pl310_L2;
> > +		break;
> > +	case ST_IRQ_SYSCFG_DISABLED :
> > +		return 0;
> > +	default :
> > +		dev_err(&pdev->dev, "Unrecognised device %d\n", device);
>=20
> dev_dbg

I believe dev_err() to be correct here, as this is an error
condition.

[...]

> > +	channels =3D of_property_count_u32_elems(np, "st,irq-device");
> > +	if (channels !=3D ST_A9_IRQ_MAX_CHANS) {
> > +		dev_err(&pdev->dev, "st,enable-irq-device must have 2 elems\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	channels =3D of_property_count_u32_elems(np, "st,fiq-device");
> > +	if (channels !=3D ST_A9_IRQ_MAX_CHANS) {
> > +		dev_err(&pdev->dev, "st,enable-fiq-device must have 2 elems\n");
> > +		return -EINVAL;
> > +	}
>=20
> I would drop these two blocks,
>=20
> > +
> > +	for (i =3D 0; i < channels; i++) {
>=20
> then use ST_A9_IRQ_MAX_CHANS here
>=20
> > +		of_property_read_u32_index(np,"st,irq-device", i, &device);
>=20
> and dev_dbg() if of_property_read_u32_index() returns an error

But what if less than ST_A9_IRQ_MAX_CHANS channels are found?
of_property_read_u32_index() will not return an error and we will have
the incorrect number of channels?  I'm not sure that it's okay to have
less than ST_A9_IRQ_MAX_CHANS.

And I think you mean dev_err().  dev_dbg() is for code used to debug
the driver/kernel.  Useful error messages such as these should be
printed in the system log at lower printk levels.

> > +
> > +		ret =3D st_irq_xlate(pdev, device, i, true);
> > +		if (ret)
> > +			return ret;
> > +
> > +		of_property_read_u32_index(np,"st,fiq-device", i, &device);
>=20
> for both of these.
>=20
> > +
> > +		ret =3D st_irq_xlate(pdev, device, i, false);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	/* External IRQs may be inverted. */
> > +	of_property_read_u32(np, "st,invert-ext", &invert);
> > +	ddata->result |=3D ST_A9_EXTIRQ_INV_SEL(invert);
> > +
> > +	return regmap_update_bits(ddata->regmap, ddata->syscfg,
> > +				  ST_A9_IRQ_MASK, ddata->result);
> > +}
> > +
> > +int st_irq_syscfg_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	const struct of_device_id *match;
> > +	struct st_irq_syscfg *ddata;
> > +
> > +	match =3D of_match_device(st_irq_syscfg_match, &pdev->dev);
> > +	if (!np)
>=20
> if (!match) ?

Whoah!  Yes, absolutely.

Actually, the match information isn't even used.  I need to take a
closer look at this.

> > +		return -ENODEV;
> > +
> > +	ddata =3D devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
> > +	if (!ddata)
> > +		return -ENOMEM;
> > +
> > +	ddata->regmap =3D syscon_regmap_lookup_by_phandle(np, "st,syscfg"=
);
> > +	if (IS_ERR(ddata->regmap)) {
> > +		dev_err(&pdev->dev, "syscfg phandle missing\n");
>=20
> dev_dbg

No.  What makes you think that?

When the driver fails, to inform the user dev_err() should always be
used.  If something odd happens, but the driver can still continue
then dev_warn() should be used.  dev_dbg() should only be used for
debug information that is useful for the developer, but not for the
end user.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
