Return-Path: <SRS0=cxpq=TJ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Date: Thu, 9 May 2019 07:14:02 +0000
Message-ID: 
 <OSBPR01MB3174708A983E7148D0F2F7CCD8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-4-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris=1B$B$5$s=1B(B

Thank you for the patch!

> From: Chris Brandt, Sent: Tuesday, May 7, 2019 8:46 AM
>=20
> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 218b32e458cb..4eaa228ebd30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  		if (rcar_gen3_needs_init_otg(channel))
>  			rcar_gen3_init_otg(channel);
>  		rphy->otg_initialized =3D true;
> -	}
> +	} else

As Sergei-san said, this should be "} else {"

> +		/* Not OTG, so dr_mode should be set in PHY node */
> +		if (usb_get_dr_mode(channel->dev) =3D=3D USB_DR_MODE_PERIPHERAL)
> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> +		else

I would like to add "else if usb_get_dr_mode(channel->dev) =3D=3D USB_DR_MO=
DE_HOST)"
for a PHY node without "dr_mode" property. In other words, if the PHY node
doesn't have dr_mode property like R-Car, this condition can be the same be=
havior as previous.

> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
>  	rphy->initialized =3D true;
>=20
> @@ -638,6 +643,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
>  		channel->uses_usb_x1 =3D true;
>=20
> +

As Sergei-san said, this is not needed :)

Best regards,
Yoshihiro Shimoda
