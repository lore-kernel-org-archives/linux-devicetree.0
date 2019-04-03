From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Use pdev's device
 pointer on dev_vdbg()
Date: Wed, 3 Apr 2019 10:36:57 +0000
Message-ID: <TY1PR01MB1770A0BBFF5253357A15AA61C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554120083-29990-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Hello Yoshihiro-san,

Thank you for your patch!

> From: linux-kernel-owner@vger.kernel.org <linux-kernel-owner@vger.kernel.=
org> On Behalf Of Yoshihiro Shimoda
> Sent: 01 April 2019 13:01
> Subject: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Use pdev's device poin=
ter on dev_vdbg()
>=20
> To implement multiple phy instances in the future, this patch uses
> pdev's device pointer on dev_vdbg() instead of the phy's device
> pointer.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 0a34782..4bdb2ed 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -80,6 +80,7 @@
>=20
>  struct rcar_gen3_chan {
>  	void __iomem *base;
> +	struct device *dev;	/* platform_device's device */
>  	struct extcon_dev *extcon;
>  	struct phy *phy;
>  	struct regulator *vbus;
> @@ -120,7 +121,7 @@ static void rcar_gen3_set_host_mode(struct rcar_gen3_=
chan *ch, int host)
>  	void __iomem *usb2_base =3D ch->base;
>  	u32 val =3D readl(usb2_base + USB2_COMMCTRL);
>=20
> -	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, host);
> +	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, host);
>  	if (host)
>  		val &=3D ~USB2_COMMCTRL_OTG_PERI;
>  	else
> @@ -133,7 +134,7 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_c=
han *ch, int dp, int dm)
>  	void __iomem *usb2_base =3D ch->base;
>  	u32 val =3D readl(usb2_base + USB2_LINECTRL1);
>=20
> -	dev_vdbg(&ch->phy->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
> +	dev_vdbg(ch->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
>  	val &=3D ~(USB2_LINECTRL1_DP_RPD | USB2_LINECTRL1_DM_RPD);
>  	if (dp)
>  		val |=3D USB2_LINECTRL1_DP_RPD;
> @@ -147,7 +148,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_ge=
n3_chan *ch, int vbus)
>  	void __iomem *usb2_base =3D ch->base;
>  	u32 val =3D readl(usb2_base + USB2_ADPCTRL);
>=20
> -	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, vbus);
> +	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
>  	if (vbus)
>  		val |=3D USB2_ADPCTRL_DRVVBUS;
>  	else
> @@ -401,7 +402,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, vo=
id *_ch)
>  	irqreturn_t ret =3D IRQ_NONE;
>=20
>  	if (status & USB2_OBINT_BITS) {
> -		dev_vdbg(&ch->phy->dev, "%s: %08x\n", __func__, status);
> +		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
>  		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
>  		rcar_gen3_device_recognition(ch);
>  		ret =3D IRQ_HANDLED;
> @@ -499,6 +500,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>=20
>  	platform_set_drvdata(pdev, channel);
>  	phy_set_drvdata(channel->phy, channel);
> +	channel->dev =3D dev;
>=20
>  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(provider)) {
> --
> 2.7.4
