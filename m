Return-Path: <SRS0=12eG=TK=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Date: Fri, 10 May 2019 04:17:21 +0000
Message-ID: 
 <OSBPR01MB3174905587AC3953FD2063EBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-4-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-4-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris=1B$B$5$s=1B(B

Thank you for the patch!

> From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
>=20
> The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> If a clock node named 'usb_x1' exists and set to non-zero, then we can
> assume we want it use it.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
<snip>
> @@ -582,10 +587,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform=
_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct rcar_gen3_chan *channel;
> +	struct device_node *usb_x1_clk;
>  	struct phy_provider *provider;
>  	struct resource *res;
>  	const struct phy_ops *phy_usb2_ops;
>  	int irq, ret =3D 0, i;
> +	u32 freq_usb =3D 0;
>=20
>  	if (!dev->of_node) {
>  		dev_err(dev, "This driver needs device tree\n");
> @@ -630,6 +637,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_=
device *pdev)
>  		}
>  	}
>=20
> +	usb_x1_clk =3D of_find_node_by_name(NULL, "usb_x1");
> +	if (usb_x1_clk) {
> +		of_property_read_u32(usb_x1_clk, "clock-frequency", &freq_usb);
> +		if (freq_usb)
> +			channel->uses_usb_x1 =3D true;
> +	}
> +

We need to call of_node_put(usb_x1_clk); here.

By the way, we can also use devm_clk_get() for it like the following driver=
:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/renesas/rcar-usb2-clock-sel.c#n135

Best regards,
Yoshihiro Shimoda
>  	/*
>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>  	 * And then, phy-core will manage runtime pm for this device.
> --
> 2.16.1
