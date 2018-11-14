Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:36192
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726823AbeKNUxP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 15:53:15 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Wed, 14 Nov 2018 10:50:24 +0000
Message-ID: <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-3-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Thursday, November 8, 2018 2:36 AM
>=20
> The RZ/A2 has the same USB2 host controller as R-Car Gen3 with only some
> minor differences.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/phy/renesas/Kconfig              |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index e340a925bbb1..beebeba31e84 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on ARCH_RENESAS
> -	depends on EXTCON
> +	depends on EXTCON || ARCH_R7S9210

Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?

>  	depends on USB_SUPPORT
>  	select GENERIC_PHY
>  	select USB_COMMON
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index d0f412c25981..96ac75ba40ea 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -34,6 +34,7 @@
>  #define USB2_VBCTRL		0x60c
>  #define USB2_LINECTRL1		0x610
>  #define USB2_ADPCTRL		0x630
> +#define USB2_PHYCLK_CTRL	0x644
>=20
>  /* INT_ENABLE */
>  #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
> @@ -88,6 +89,7 @@ struct rcar_gen3_chan {
>  	bool extcon_host;
>  	bool is_otg_channel;
>  	bool uses_otg_pins;
> +	bool uses_usb_x1;
>  };
>=20
>  /*
> @@ -326,6 +328,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  	struct rcar_gen3_chan *channel =3D phy_get_drvdata(p);
>  	void __iomem *usb2_base =3D channel->base;
>=20
> +	if (channel->uses_usb_x1)
> +		writel(0x00000001, usb2_base + USB2_PHYCLK_CTRL);
> +
>  	/* Initialize USB2 part */
>  	writel(USB2_INT_ENABLE_INIT, usb2_base + USB2_INT_ENABLE);
>  	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
> @@ -334,6 +339,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  	/* Initialize otg part */
>  	if (channel->is_otg_channel)
>  		rcar_gen3_init_otg(channel);
> +	else
> +		/* No otg, so default to host mode */
> +		writel(0x00000000, usb2_base + USB2_COMMCTRL);

This "else" code will run on R-Car H3 USB port1(host only) for instance.
I think adding this code is possible, but I'd like to separate patch from
this adding R7S9210 support. What do you think?

>  	return 0;
>  }
> @@ -406,6 +414,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, vo=
id *_ch)
>  }
>=20
>  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] =3D {
> +	{ .compatible =3D "renesas,usb2-phy-r7s9210" },

According to the PATCH 3/3, R7S9210 will use "renesas,rcar-gen3-usb2-phy".
So, you can remove this line.

>  	{ .compatible =3D "renesas,usb2-phy-r8a7795" },
>  	{ .compatible =3D "renesas,usb2-phy-r8a7796" },
>  	{ .compatible =3D "renesas,usb2-phy-r8a77965" },
> @@ -471,6 +480,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  		}
>  	}
>=20
> +	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
> +		channel->uses_usb_x1 =3D true;
> +

I'll reply the PATCH 3/3 though, we have to describe the new property into =
the dt-bindings doc.

Best regards,
Yoshihiro Shimoda

>  	/*
>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>  	 * And then, phy-core will manage runtime pm for this device.
> --
> 2.16.1
