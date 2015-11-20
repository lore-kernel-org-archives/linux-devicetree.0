From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 2/5] phy-sun4i-usb: Add support for the host
 usb-phys found on the H3 SoC
Date: Fri, 20 Nov 2015 21:49:11 +0200
Message-ID: <1448048951.1560.5.camel@plaes.org>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
	 <1447616777-24660-2-git-send-email-hdegoede@redhat.com>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBWHSXWZAKGQECM7LPHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1447616777-24660-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2015-11-15 at 20:46 +0100, Hans de Goede wrote:
> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>=20
> Note this commit only adds support for phys 1-3, phy 0, the otg phy,
> is
> not yet (fully) supported after this commit.


This patch seems to be causing following compile warning:

In file included from include/linux/io.h:25:0,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0from drivers/phy/phy-sun4i-usb.c:28:
drivers/phy/phy-sun4i-usb.c: In function 'sun4i_usb_phy_write': ./arch/arm/=
include/asm/io.h:94:2: warning: 'phyctl' may be used uninitialized in this =
function [-Wmaybe-uni
nitialized]
=C2=A0 asm volatile("strb %1, %0"
=C2=A0 ^
drivers/phy/phy-sun4i-usb.c:172:8: note: 'phyctl' was declared here
=C2=A0 void *phyctl;

>=20
> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> =C2=A0.../devicetree/bindings/phy/sun4i-usb-phy.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
> =C2=A0drivers/phy/phy-sun4i-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 67
> +++++++++++++++++-----
> =C2=A02 files changed, 53 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 0cebf74..95736d7 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -9,6 +9,7 @@ Required properties:
> =C2=A0=C2=A0=C2=A0* allwinner,sun7i-a20-usb-phy
> =C2=A0=C2=A0=C2=A0* allwinner,sun8i-a23-usb-phy
> =C2=A0=C2=A0=C2=A0* allwinner,sun8i-a33-usb-phy
> +=C2=A0=C2=A0* allwinner,sun8i-h3-usb-phy
> =C2=A0- reg : a list of offset + length pairs
> =C2=A0- reg-names :
> =C2=A0=C2=A0=C2=A0* "phy_ctrl"
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-
> usb.c
> index b12964b..17f97ab 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -46,6 +46,9 @@
> =C2=A0#define REG_PHYBIST			0x08
> =C2=A0#define REG_PHYTUNE			0x0c
> =C2=A0#define REG_PHYCTL_A33			0x10
> +#define REG_PHY_UNK_H3			0x20
> +
> +#define REG_PMU_UNK_H3			0x10
> =C2=A0
> =C2=A0#define PHYCTL_DATA			BIT(7)
> =C2=A0
> @@ -79,7 +82,7 @@
> =C2=A0#define PHY_DISCON_TH_SEL		0x2a
> =C2=A0#define PHY_SQUELCH_DETECT		0x3c
> =C2=A0
> -#define MAX_PHYS			3
> +#define MAX_PHYS			4
> =C2=A0
> =C2=A0/*
> =C2=A0 * Note do not raise the debounce time, we must report Vusb high
> within 100ms
> @@ -88,12 +91,19 @@
> =C2=A0#define DEBOUNCE_TIME			msecs_to_jiffies(50)
> =C2=A0#define POLL_TIME			msecs_to_jiffies(250)
> =C2=A0
> +enum sun4i_usb_phy_type {
> +	sun4i_a10_phy,
> +	sun8i_a33_phy,
> +	sun8i_h3_phy
> +};
> +
> =C2=A0struct sun4i_usb_phy_data {
> +	struct device *dev;
> =C2=A0	void __iomem *base;
> =C2=A0	struct mutex mutex;
> =C2=A0	int num_phys;
> =C2=A0	u32 disc_thresh;
> -	bool has_a33_phyctl;
> +	enum sun4i_usb_phy_type type;
> =C2=A0	struct sun4i_usb_phy {
> =C2=A0		struct phy *phy;
> =C2=A0		void __iomem *pmu;
> @@ -164,12 +174,18 @@ static void sun4i_usb_phy_write(struct
> sun4i_usb_phy *phy, u32 addr, u32 data,
> =C2=A0
> =C2=A0	mutex_lock(&phy_data->mutex);
> =C2=A0
> -	if (phy_data->has_a33_phyctl) {
> +	switch (phy_data->type) {
> +	case sun4i_a10_phy:
> +		phyctl =3D phy_data->base + REG_PHYCTL_A10;
> +		break;
> +	case sun8i_a33_phy:
> =C2=A0		phyctl =3D phy_data->base + REG_PHYCTL_A33;
> =C2=A0		/* A33 needs us to set phyctl to 0 explicitly */
> =C2=A0		writel(0, phyctl);
> -	} else {
> -		phyctl =3D phy_data->base + REG_PHYCTL_A10;
> +		break;
> +	case sun8i_h3_phy:
> +		dev_err(phy_data->dev, "H3 usb_phy_write is not
> supported\n");
> +		break;
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < len; i++) {
> @@ -230,6 +246,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
> =C2=A0	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
> =C2=A0	struct sun4i_usb_phy_data *data =3D
> to_sun4i_usb_phy_data(phy);
> =C2=A0	int ret;
> +	u32 val;
> =C2=A0
> =C2=A0	ret =3D clk_prepare_enable(phy->clk);
> =C2=A0	if (ret)
> @@ -241,15 +258,26 @@ static int sun4i_usb_phy_init(struct phy *_phy)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	/* Enable USB 45 Ohm resistor calibration */
> -	if (phy->index =3D=3D 0)
> -		sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
> +	if (data->type =3D=3D sun8i_h3_phy) {
> +		if (phy->index =3D=3D 0) {
> +			val =3D readl(data->base + REG_PHY_UNK_H3);
> +			writel(val & ~1, data->base +
> REG_PHY_UNK_H3);
> +		}
> +
> +		val =3D readl(phy->pmu + REG_PMU_UNK_H3);
> +		writel(val & ~2, phy->pmu + REG_PMU_UNK_H3);
> +	} else {
> +		/* Enable USB 45 Ohm resistor calibration */
> +		if (phy->index =3D=3D 0)
> +			sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN,
> 0x01, 1);
> =C2=A0
> -	/* Adjust PHY's magnitude and rate */
> -	sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
> +		/* Adjust PHY's magnitude and rate */
> +		sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE,
> 0x14, 5);
> =C2=A0
> -	/* Disconnect threshold adjustment */
> -	sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL, data-
> >disc_thresh, 2);
> +		/* Disconnect threshold adjustment */
> +		sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0data->disc_thresh, 2);
> +	}
> =C2=A0
> =C2=A0	sun4i_usb_phy_passby(phy, 1);
> =C2=A0
> @@ -522,11 +550,14 @@ static int sun4i_usb_phy_probe(struct
> platform_device *pdev)
> =C2=A0	mutex_init(&data->mutex);
> =C2=A0	INIT_DELAYED_WORK(&data->detect,
> sun4i_usb_phy0_id_vbus_det_scan);
> =C2=A0	dev_set_drvdata(dev, data);
> +	data->dev =3D dev;
> =C2=A0
> =C2=A0	if (of_device_is_compatible(np, "allwinner,sun5i-a13-usb-
> phy") ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0of_device_is_compatible(np, "allwinner,sun=
8i-a23-usb-
> phy") ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0of_device_is_compatible(np, "allwinner,sun=
8i-a33-usb-
> phy"))
> =C2=A0		data->num_phys =3D 2;
> +	else if (of_device_is_compatible(np, "allwinner,sun8i-h3-
> usb-phy"))
> +		data->num_phys =3D 4;
> =C2=A0	else
> =C2=A0		data->num_phys =3D 3;
> =C2=A0
> @@ -538,13 +569,18 @@ static int sun4i_usb_phy_probe(struct
> platform_device *pdev)
> =C2=A0
> =C2=A0	if (of_device_is_compatible(np, "allwinner,sun6i-a31-usb-
> phy") ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0of_device_is_compatible(np, "allwinner,sun=
8i-a23-usb-
> phy") ||
> -	=C2=A0=C2=A0=C2=A0=C2=A0of_device_is_compatible(np, "allwinner,sun8i-a3=
3-usb-
> phy"))
> +	=C2=A0=C2=A0=C2=A0=C2=A0of_device_is_compatible(np, "allwinner,sun8i-a3=
3-usb-
> phy") ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0of_device_is_compatible(np, "allwinner,sun8i-h3=
-usb-
> phy"))
> =C2=A0		dedicated_clocks =3D true;
> =C2=A0	else
> =C2=A0		dedicated_clocks =3D false;
> =C2=A0
> =C2=A0	if (of_device_is_compatible(np, "allwinner,sun8i-a33-usb-
> phy"))
> -		data->has_a33_phyctl =3D true;
> +		data->type =3D sun8i_a33_phy;
> +	else if (of_device_is_compatible(np, "allwinner,sun8i-h3-
> usb-phy"))
> +		data->type =3D sun8i_h3_phy;
> +	else
> +		data->type =3D sun4i_a10_phy;
> =C2=A0
> =C2=A0	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "phy_ctrl");
> =C2=A0	data->base =3D devm_ioremap_resource(dev, res);
> @@ -620,7 +656,7 @@ static int sun4i_usb_phy_probe(struct
> platform_device *pdev)
> =C2=A0			return PTR_ERR(phy->reset);
> =C2=A0		}
> =C2=A0
> -		if (i) { /* No pmu for usbc0 */
> +		if (data->type =3D=3D sun8i_h3_phy || i !=3D 0) {
> =C2=A0			snprintf(name, sizeof(name), "pmu%d", i);
> =C2=A0			res =3D platform_get_resource_byname(pdev,
> =C2=A0							IORESOURCE_M
> EM, name);
> @@ -696,6 +732,7 @@ static const struct of_device_id
> sun4i_usb_phy_of_match[] =3D {
> =C2=A0	{ .compatible =3D "allwinner,sun7i-a20-usb-phy" },
> =C2=A0	{ .compatible =3D "allwinner,sun8i-a23-usb-phy" },
> =C2=A0	{ .compatible =3D "allwinner,sun8i-a33-usb-phy" },
> +	{ .compatible =3D "allwinner,sun8i-h3-usb-phy" },
> =C2=A0	{ },
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
> --=20
> 2.5.0
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
