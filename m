From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] phy: rcar-gen3-usb3: add support for R-Car Gen3 USB 3.0
 PHY
Date: Wed, 24 May 2017 12:12:03 +0000
Message-ID: <TY1PR06MB099205242691A3A64BD663FBD8FE0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495627443-28057-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495627443-28057-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> From: Yoshihiro Shimoda
> Sent: Wednesday, May 24, 2017 9:04 PM
>=20
> The USB 3.0 PHY modules of R-Car Gen3 SoCs have:
>  - Spread spectrum clock (ssc).
>  - Using USB 2.0 EXTAL clock instead of USB 3.0 clock.
>  - Enabling VBUS detection for usb3.0 peripheral.
>=20
> So, this driver supports these features.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
<snip>
> +static int rcar_gen3_phy_usb3_init(struct phy *p)
> +{
> +	struct rcar_gen3_usb3 *r =3D phy_get_drvdata(p);
> +
> +	dev_info(&r->phy->dev, "%s: enter (%d, %d, %d)\n", __func__,
> +		 r->usb3s_clk, r->usb_extal, r->ssc_range);

Oops, I should change this to dev_vdbg...
I will submit v2 patch later.

Best regards,
Yoshihiro Shimoda
