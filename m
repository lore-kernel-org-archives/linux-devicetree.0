From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: salvator-common: add dr_mode
 property for USB2.0 channel 0
Date: Thu, 19 Oct 2017 04:36:51 +0000
Message-ID: <TY1PR06MB0992CA7C57C49DC0FB7B134BD8420@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1507800210-13403-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507800210-13403-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: "horms@verge.net.au" <horms@verge.net.au>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Yoshihiro Shimoda, Sent: Thursday, October 12, 2017 6:24 PM
>=20
> Since Salvator-X[S] have a USB2.0 dual-role channel (CN9), this patch
> adds dr_mode property for USB2.0 channel 0 (EHCI/OHCI and HS-USB)
> as "otg".
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch based on the renesas.git / renesas-devel-20171011-v4.14-rc4 t=
ag.
>=20
>  Using dual-role channel (or not) is related to the type of USB receptor =
on
>  board specification. So, I added the property into the salvator-common.d=
tsi.
>=20
>  This property will be used by phy-rcar-gen3-usb2 driver in the future [1=
].
>  However, adding this property without the [1] patch will not cause any
>  side-effects.
>=20
>  [1] : https://patchwork.kernel.org/patch/10001113/

Would you apply this patch for v4.15?
I got ack from the PHY maintainer:

https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg19494.htm=
l

Best regards,
Yoshihiro Shimoda

>=20
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index 3dcb26b..9bd409b 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -282,6 +282,7 @@
>  };
>=20
>  &ehci0 {
> +	dr_mode =3D "otg";
>  	status =3D "okay";
>  };
>=20
> @@ -294,6 +295,7 @@
>  };
>=20
>  &hsusb {
> +	dr_mode =3D "otg";
>  	status =3D "okay";
>  };
>=20
> @@ -356,6 +358,7 @@
>  };
>=20
>  &ohci0 {
> +	dr_mode =3D "otg";
>  	status =3D "okay";
>  };
>=20
> --
> 1.9.1
