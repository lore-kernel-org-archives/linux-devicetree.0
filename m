From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] arm64: allwinner: h6: orangepi-one-plus:
 Add Ethernet support
Date: Tue, 07 Aug 2018 15:19:33 +0800
Message-ID: <2D1B8773-0019-458A-8C7E-20077AA27AD4@aosc.io>
References: <20180807071839.25305-1-jagan@amarulasolutions.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHUQUXNQKGQEKM6J6OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180807071839.25305-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B48=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:1=
8:39, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> =E5=86=99=E5=88=B0:
>Add Ethernet support for orangepi-one-plus board,
>- Ethernet port connected via RTL8211E PHY
>- GMAC_EN is connected via PD6
>- GMAC-3V supplied from ALDO2 regulator

Is the prequisite patchset merged?

>
>Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>---
> .../allwinner/sun50i-h6-orangepi-one-plus.dts | 29 +++++++++++++++++++
> 1 file changed, 29 insertions(+)
>
>diff --git
>a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
>b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
>index 0612c19cd994..eca5b7ea0d6d 100644
>--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
>+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
>@@ -21,6 +21,35 @@
> 	chosen {
> 		stdout-path =3D "serial0:115200n8";
> 	};
>+
>+	reg_gmac_3v3: gmac-3v3 {
>+		compatible =3D "regulator-fixed";
>+		regulator-name =3D "vcc-gmac-3v3";
>+		regulator-min-microvolt =3D <3300000>;
>+		regulator-max-microvolt =3D <3300000>;
>+		startup-delay-us =3D <100000>;
>+		enable-active-high;
>+		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>+		vin-supply =3D <&reg_aldo2>;
>+	};
>+};
>+
>+&emac {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&ext_rgmii_pins>;
>+	phy-mode =3D "rgmii";
>+	phy-handle =3D <&ext_rgmii_phy>;
>+	phy-supply =3D <&reg_gmac_3v3>;
>+	allwinner,rx-delay-ps =3D <200>;
>+	allwinner,tx-delay-ps =3D <200>;
>+	status =3D "okay";
>+};
>+
>+&mdio {
>+	ext_rgmii_phy: ethernet-phy@1 {
>+		compatible =3D "ethernet-phy-ieee802.3-c22";
>+		reg =3D <1>;
>+	};
> };
>=20
> &mmc0 {

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
