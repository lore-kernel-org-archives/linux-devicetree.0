From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v3 3/3] mailbox: Add support for i.MX7D messaging unit
Date: Tue, 17 Jul 2018 08:42:32 +0200
Message-ID: <bce150b3-0243-b7f5-f9d7-27c072170687@pengutronix.de>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-4-o.rempel@pengutronix.de>
 <AM0PR04MB42117528ACC1D9572C4D5C8A805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1398976109733856537=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42117528ACC1D9572C4D5C8A805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1398976109733856537==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mZybuBPMRj2EdYvoFxHGkc2HSpBpRY6i7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mZybuBPMRj2EdYvoFxHGkc2HSpBpRY6i7
Content-Type: multipart/mixed; boundary="xjH1Mlae9zXvylBaXdC74J9adSlB5zv43";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "A.s. Dong" <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Message-ID: <bce150b3-0243-b7f5-f9d7-27c072170687@pengutronix.de>
Subject: Re: [PATCH v3 3/3] mailbox: Add support for i.MX7D messaging unit
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-4-o.rempel@pengutronix.de>
 <AM0PR04MB42117528ACC1D9572C4D5C8A805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42117528ACC1D9572C4D5C8A805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>

--xjH1Mlae9zXvylBaXdC74J9adSlB5zv43
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 17.07.2018 08:21, A.s. Dong wrote:
>> -----Original Message-----
>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>> Sent: Monday, July 16, 2018 7:42 PM
>> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
>> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
>> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
>> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-l=
inux-
>> imx <linux-imx@nxp.com>
>> Subject: [PATCH v3 3/3] mailbox: Add support for i.MX7D messaging unit=

>>
>> The Mailbox controller is able to send messages (up to 4 32 bit words)=

>> between the endpoints.
>>
>> This driver was tested using the mailbox-test driver sending messages
>> between the Cortex-A7 and the Cortex-M4.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  drivers/mailbox/Kconfig       |   6 +
>>  drivers/mailbox/Makefile      |   2 +
>>  drivers/mailbox/imx-mailbox.c | 294
>> ++++++++++++++++++++++++++++++++++
>>  3 files changed, 302 insertions(+)
>>  create mode 100644 drivers/mailbox/imx-mailbox.c
>>
>=20
> Generally it looks good to me, a few minor comments:
>=20
>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig index
>> a2bb27446dce..79060ddc380d 100644
>> --- a/drivers/mailbox/Kconfig
>> +++ b/drivers/mailbox/Kconfig
>> @@ -15,6 +15,12 @@ config ARM_MHU
>>  	  The controller has 3 mailbox channels, the last of which can be
>>  	  used in Secure mode only.
>>
>> +config IMX_MBOX
>> +	tristate "i.MX Mailbox"
>> +	depends on ARCH_MXC || COMPILE_TEST
>> +	help
>> +	  Mailbox implementation for i.MX Messaging Unit (MU).
>> +
>>  config PLATFORM_MHU
>>  	tristate "Platform MHU Mailbox"
>>  	depends on OF
>> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile index=

>> cc23c3a43fcd..ba2fe1b6dd62 100644
>> --- a/drivers/mailbox/Makefile
>> +++ b/drivers/mailbox/Makefile
>> @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
>>
>>  obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
>>
>> +obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
>> +
>>  obj-$(CONFIG_PLATFORM_MHU)	+=3D platform_mhu.o
>>
>>  obj-$(CONFIG_PL320_MBOX)	+=3D pl320-ipc.o
>> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailb=
ox.c
>> new file mode 100644 index 000000000000..31353366a007
>> --- /dev/null
>> +++ b/drivers/mailbox/imx-mailbox.c
>> @@ -0,0 +1,294 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018 Pengutronix, Oleksij Rempel
>> +<o.rempel@pengutronix.de>  */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +
>> +/* Transmit Register */
>> +#define IMX_MU_xTRn(x)		(0x00 + 4 * (x))
>> +/* Receive Register */
>> +#define IMX_MU_xRRn(x)		(0x10 + 4 * (x))
>> +/* Status Register */
>> +#define IMX_MU_xSR		0x20
>> +#define IMX_MU_xSR_TEn(x)	BIT(20 + (3 - (x)))
>> +#define IMX_MU_xSR_RFn(x)	BIT(24 + (3 - (x)))
>> +#define IMX_MU_xSR_BRDIP	BIT(9)
>> +
>> +/* Control Register */
>> +#define IMX_MU_xCR		0x24
>> +/* Transmit Interrupt Enable */
>> +#define IMX_MU_xCR_TIEn(x)	BIT(20 + (3 - (x)))
>> +/* Receive Interrupt Enable */
>> +#define IMX_MU_xCR_RIEn(x)	BIT(24 + (3 - (x)))
>> +
>> +#define IMX_MU_MAX_CHANS	4u
>> +
>> +struct imx_mu_priv;
>> +
>> +struct imx_mu_cfg {
>> +	unsigned int		chans;
>> +	void (*init_hw)(struct imx_mu_priv *priv); };
>> +
>> +struct imx_mu_con_priv {
>> +	int			irq;
>> +	unsigned int		idx;
>> +};
>> +
>> +struct imx_mu_priv {
>> +	struct device		*dev;
>> +	const struct imx_mu_cfg	*dcfg;
>> +	void __iomem		*base;
>> +
>> +	struct mbox_controller	mbox;
>> +	struct mbox_chan	mbox_chans[IMX_MU_MAX_CHANS];
>> +
>> +	struct imx_mu_con_priv  con_priv[IMX_MU_MAX_CHANS];
>> +	struct clk		*clk;
>> +
>> +	bool			side_a;
>> +};
>> +
>> +static struct imx_mu_priv *to_imx_mu_priv(struct mbox_controller *mbo=
x)
>> +{
>> +	return container_of(mbox, struct imx_mu_priv, mbox); }
>> +
>> +static void imx_mu_write(struct imx_mu_priv *priv, u32 val, u32 offs)=
 {
>> +	iowrite32(val, priv->base + offs);
>> +}
>> +
>> +static u32 imx_mu_read(struct imx_mu_priv *priv, u32 offs) {
>> +	return ioread32(priv->base + offs);
>> +}
>> +
>> +static u32 imx_mu_rmw(struct imx_mu_priv *priv, u32 offs, u32 set, u3=
2
>> +clr) {
>> +	u32 val;
>> +
>> +	val =3D imx_mu_read(priv, offs);
>> +	val &=3D ~clr;
>> +	val |=3D set;
>> +	imx_mu_write(priv, val, offs);
>> +
>> +	return val;
>> +}
>> +
>> +static irqreturn_t imx_mu_isr(int irq, void *p) {
>> +	struct mbox_chan *chan =3D p;
>=20
> Better re-order from long to short.

"chis" is used by by following declarations. It make no sense to reorder =
it.

>=20
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +
>=20
> Unnecessary blank line?

ok,

>> +	u32 val, ctrl, dat;
>> +
>> +	ctrl =3D imx_mu_read(priv, IMX_MU_xCR);
>> +	val =3D imx_mu_read(priv, IMX_MU_xSR);
>> +	val &=3D IMX_MU_xSR_TEn(cp->idx) | IMX_MU_xSR_RFn(cp->idx);
>> +	val &=3D ctrl & (IMX_MU_xCR_TIEn(cp->idx) | IMX_MU_xCR_RIEn(cp-
>>> idx));
>> +	if (!val)
>> +		return IRQ_NONE;
>> +
>> +	if (val & IMX_MU_xSR_TEn(cp->idx)) {
>> +		imx_mu_rmw(priv, IMX_MU_xCR, 0, IMX_MU_xCR_TIEn(cp-
>>> idx));
>> +		mbox_chan_txdone(chan, 0);
>> +	}
>> +
>> +	if (val & IMX_MU_xSR_RFn(cp->idx)) {
>> +		dat =3D imx_mu_read(priv, IMX_MU_xRRn(cp->idx));
>> +		mbox_chan_received_data(chan, (void *)&dat);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static bool imx_mu_last_tx_done(struct mbox_chan *chan) {
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +	u32 val;
>> +
>> +	val =3D imx_mu_read(priv, IMX_MU_xSR);
>> +	/* test if transmit register is empty */
>> +	return (!!(val & IMX_MU_xSR_TEn(cp->idx))); }
>> +
>> +static int imx_mu_send_data(struct mbox_chan *chan, void *data) {
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +	u32 *arg =3D data;
>> +
>> +	if (!imx_mu_last_tx_done(chan))
>> +		return -EBUSY;
>> +
>> +	imx_mu_write(priv, *arg, IMX_MU_xTRn(cp->idx));
>> +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xSR_TEn(cp->idx), 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx_mu_startup(struct mbox_chan *chan) {
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +	char *irq_desc;
>> +	int ret;
>> +
>> +	irq_desc =3D devm_kasprintf(priv->dev, GFP_KERNEL,
>> "imx_mu_chan[%i]",
>> +				  cp->idx);
>=20
> I like the name differentiation, just wondering whether this could
> cause memory leak if users repeatly open/close MU channels due to
> I see no free.

good point.

>=20
>> +	if (!irq_desc)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_request_irq(priv->dev, cp->irq, imx_mu_isr,
>> +			       IRQF_SHARED, irq_desc, chan);
>> +	if (ret) {
>> +		dev_err(priv->dev,
>> +			"Unable to acquire IRQ %d\n", cp->irq);
>> +		return ret;
>> +	}
>> +
>> +	imx_mu_rmw(priv, IMX_MU_xCR, IMX_MU_xCR_RIEn(cp->idx), 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static void imx_mu_shutdown(struct mbox_chan *chan) {
>> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
>> +
>> +	imx_mu_rmw(priv, IMX_MU_xCR, 0,
>> +		   IMX_MU_xCR_TIEn(cp->idx) | IMX_MU_xCR_RIEn(cp-
>>> idx));
>> +
>> +	devm_free_irq(priv->dev, cp->irq, chan); }
>> +
>> +static const struct mbox_chan_ops imx_mu_ops =3D {
>> +	.send_data =3D imx_mu_send_data,
>> +	.startup =3D imx_mu_startup,
>> +	.shutdown =3D imx_mu_shutdown,
>> +};
>> +
>> +static int imx_mu_probe(struct platform_device *pdev) {
>> +	struct device *dev =3D &pdev->dev;
>> +	struct device_node *np =3D dev->of_node;
>> +	struct resource *iomem;
>> +	struct imx_mu_priv *priv;
>> +	const struct imx_mu_cfg *dcfg;
>> +	unsigned int i, chans;
>> +	int irq, ret;
>> +
>> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dcfg =3D of_device_get_match_data(dev);
>> +	if (!dcfg)
>> +		return -EINVAL;
>> +
>> +	priv->dcfg =3D dcfg;
>> +	priv->dev =3D dev;
>> +
>> +	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	priv->base =3D devm_ioremap_resource(&pdev->dev, iomem);
>> +	if (IS_ERR(priv->base))
>> +		return PTR_ERR(priv->base);
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq <=3D 0)
>> +		return irq < 0 ? irq : -EINVAL;
>> +
>> +	priv->clk =3D devm_clk_get(dev, NULL);
>> +	if (IS_ERR(priv->clk)) {
>> +		if (PTR_ERR(priv->clk) !=3D -ENOENT)
>> +			return PTR_ERR(priv->clk);
>> +
>> +		priv->clk =3D NULL;
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(priv->clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable clock\n");
>> +		return ret;
>> +	}
>> +
>> +	chans =3D min(dcfg->chans, IMX_MU_MAX_CHANS);
>> +	/* Initialize channel identifiers */
>> +	for (i =3D 0; i < chans; i++) {
>> +		struct imx_mu_con_priv *cp =3D &priv->con_priv[i];
>> +
>> +		cp->idx =3D i;
>> +		cp->irq =3D irq;
>> +		priv->mbox_chans[i].con_priv =3D cp;
>> +	}
>> +
>> +	if (of_property_read_bool(np, "fsl,mu-side-a"))
>> +		priv->side_a =3D true;
>=20
> See property comments in former emails.

ok.

>> +
>> +	priv->mbox.dev =3D dev;
>> +	priv->mbox.ops =3D &imx_mu_ops;
>> +	priv->mbox.chans =3D priv->mbox_chans;
>> +	priv->mbox.num_chans =3D chans;
>> +	priv->mbox.txdone_irq =3D true;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +
>> +	if (priv->dcfg->init_hw)
>> +		priv->dcfg->init_hw(priv);
>> +
>> +	return mbox_controller_register(&priv->mbox);
>> +}
>> +
>> +static int imx_mu_remove(struct platform_device *pdev) {
>> +	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
>> +
>> +	mbox_controller_unregister(&priv->mbox);
>> +	clk_disable_unprepare(priv->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static void imx_mu_init_imx7d(struct imx_mu_priv *priv) {
>=20
> I guess we could remove the soc postfix now.

ok.

>=20
>> +	/* Set default config */
>> +	if (priv->side_a)
>> +		imx_mu_write(priv, 0, IMX_MU_xCR);
>> +}
>> +
>> +static const struct imx_mu_cfg imx_mu_cfg_imx7d =3D {
>> +	.chans =3D IMX_MU_MAX_CHANS,
>=20
> What's point of another chans here?
> This can also be controlled by IMX_MU_MAX_CHANS.

SCU has one channel configuration.
It is possible to exctend this driver with existing MU to provide 8
channels: 4 channels with FIFO (can be used stand alone) + 4 channes
based on General purpose interrupt and should be used with shared memory.=


>> +	.init_hw =3D imx_mu_init_imx7d,
>=20
> Can we imagine a diferent .init_hw callback for another SoC?

yes, for example SCU case, or any other case where A side is used on
slave system.

> If no, how about make it default as I see the implementation
> is quite simple and seems not SoC specific. Then we probably
> can totally remove struct imx_mu_cfg.

i prefer not to do it.

>> +};
>> +
>> +static const struct of_device_id imx_mu_dt_ids[] =3D {
>> +	{ .compatible =3D "fsl,imx7s-mu", .data =3D &imx_mu_cfg_imx7d },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, imx_mu_dt_ids);
>> +
>> +static struct platform_driver imx_mu_driver =3D {
>> +	.probe		=3D imx_mu_probe,
>> +	.remove		=3D imx_mu_remove,
>> +	.driver =3D {
>> +		.name	=3D "imx_mu",
>> +		.of_match_table =3D imx_mu_dt_ids,
>> +	},
>> +};
>> +module_platform_driver(imx_mu_driver);
>=20
> Do you think if we can escalated it a bit earlier as it's used by SCU?
> e.g. core_initcall ?

Some more testing shoukld be done. Same MU driver is on master side a
clock consumer on slave side it is clock provider. It is valid for my
R&D project as well.
Let us concentrate on generic part first and then extend it as needed.


--xjH1Mlae9zXvylBaXdC74J9adSlB5zv43--

--mZybuBPMRj2EdYvoFxHGkc2HSpBpRY6i7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltNj9gACgkQdQOiSHVI
77QjEQgAmHDXzwUwXOaMm90yDeMKof1LH66KSPyuWR4lcyrSyoBLXkU20MWlM1uV
fgDvwOeDYoHg1PLiBgFxR5/te6Lpx1gGBKYEbtC10hIRxeePKssNsEgEFb47Cm16
HsXkmjqJVeqBGmk6zfyip/cXck5O2Jv1VwLF6LsKvY0SM8TuvlQ+5FulrnEUgzki
8uka6lb/T3X0qGmOyXpLpToDNbZGRmWlbVQV722Feu6T9TI08TSeiNM66u1a7TIf
QgHIsW4aUHqWobyM7jQ4wIeRs9H0xOkw7A0QZAuENo9GvCe4tM1PqxKaXYRKHN1l
PNb+jYeyT4PHB48kCwJA5wU0p3vM3Q==
=NqNP
-----END PGP SIGNATURE-----

--mZybuBPMRj2EdYvoFxHGkc2HSpBpRY6i7--


--===============1398976109733856537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1398976109733856537==--
