From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [RFC PATCH 4/5] arm64: dts: sunxi: add SCPI driven
 clocks and nodes for A64 MMC
Date: Wed, 10 Aug 2016 23:01:48 +0800
Message-ID: <1241311470841308@web22g.yandex.ru>
References: <20160809115303.17032-1-andre.przywara@arm.com> <20160809115303.17032-5-andre.przywara@arm.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBX4DVW6QKGQESXNAYBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160809115303.17032-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



09.08.2016, 19:58, "Andre Przywara" <andre.przywara-5wv7dgnIgG8@public.gmane.org>:
> =C2=A0The MMC controllers in the Allwinner A64 SoC are somewhat compatibl=
e
> =C2=A0with the versions used in other Allwinner SoCs.
> =C2=A0Tell Linux about the three MMC clocks that the firmware implements =
and
> =C2=A0add nodes to represent the MMC controllers.
> =C2=A0The actual hardware is capable of new transfer modes, which the dri=
ver
> =C2=A0does not fully support yet, also the clock part has changed, but it
> =C2=A0works like this at least for SD card accesses.
>
> =C2=A0Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> =C2=A0---
> =C2=A0=C2=A0arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 61 ++++++++++=
+++++++++++++++++
> =C2=A0=C2=A01 file changed, 61 insertions(+)
>
> =C2=A0diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64.dtsi
> =C2=A0index 9fc540e..0f6044b 100644
> =C2=A0--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> =C2=A0+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> =C2=A0@@ -157,6 +157,19 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "arm,scpi";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mboxes =3D <&mailbox 0>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shmem =3D <&cpu_scp_mem>;
> =C2=A0+
> =C2=A0+ clocks {
> =C2=A0+ compatible =3D "arm,scpi-clocks";
> =C2=A0+
> =C2=A0+ scpi_clk: scpi_clocks {
> =C2=A0+ compatible =3D "arm,scpi-variable-clocks";
> =C2=A0+ #clock-cells =3D <1>;
> =C2=A0+ clock-indices =3D <0>, <1>,


I found a problem of the "standardize" process.
There cannot be an authority to keep the clock ID standardized, in both=20

> =C2=A0+ <2>;
> =C2=A0+ clock-output-names =3D "mmc0_clk", "mmc1_clk",
> =C2=A0+ "mmc2_clk";
> =C2=A0+ };
> =C2=A0+ };
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0soc {
> =C2=A0@@ -165,6 +178,54 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ranges;
>
> =C2=A0+ mmc0: mmc@1c0f000 {
> =C2=A0+ compatible =3D "allwinner,sun50i-a64-mmc",
> =C2=A0+ "allwinner,sun5i-a13-mmc";
> =C2=A0+ reg =3D <0x01c0f000 0x1000>;
> =C2=A0+ clocks =3D <&bus_gates 8>, <&scpi_clk 0>,
> =C2=A0+ <&scpi_clk 0>, <&scpi_clk 0>;
> =C2=A0+ clock-names =3D "ahb", "mmc",
> =C2=A0+ "output", "sample";
> =C2=A0+ resets =3D <&ahb_rst 8>;
> =C2=A0+ reset-names =3D "ahb";
> =C2=A0+ interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> =C2=A0+ status =3D "disabled";
> =C2=A0+ #address-cells =3D <1>;
> =C2=A0+ #size-cells =3D <0>;
> =C2=A0+ };
> =C2=A0+
> =C2=A0+ mmc1: mmc@1c10000 {
> =C2=A0+ compatible =3D "allwinner,sun50i-a64-mmc",
> =C2=A0+ "allwinner,sun5i-a13-mmc";
> =C2=A0+ reg =3D <0x01c10000 0x1000>;
> =C2=A0+ clocks =3D <&bus_gates 9>, <&scpi_clk 1>,
> =C2=A0+ <&scpi_clk 1>, <&scpi_clk 1>;
> =C2=A0+ clock-names =3D "ahb", "mmc",
> =C2=A0+ "output", "sample";
> =C2=A0+ resets =3D <&ahb_rst 9>;
> =C2=A0+ reset-names =3D "ahb";
> =C2=A0+ interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> =C2=A0+ status =3D "disabled";
> =C2=A0+ #address-cells =3D <1>;
> =C2=A0+ #size-cells =3D <0>;
> =C2=A0+ };
> =C2=A0+
> =C2=A0+ mmc2: mmc@1c11000 {
> =C2=A0+ compatible =3D "allwinner,sun50i-a64-mmc",
> =C2=A0+ "allwinner,sun5i-a13-mmc";
> =C2=A0+ reg =3D <0x01c11000 0x1000>;
> =C2=A0+ clocks =3D <&bus_gates 10>, <&scpi_clk 2>,
> =C2=A0+ <&scpi_clk 2>, <&scpi_clk 2>;
> =C2=A0+ clock-names =3D "ahb", "mmc",
> =C2=A0+ "output", "sample";
> =C2=A0+ resets =3D <&ahb_rst 10>;
> =C2=A0+ reset-names =3D "ahb";
> =C2=A0+ interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> =C2=A0+ status =3D "disabled";
> =C2=A0+ #address-cells =3D <1>;
> =C2=A0+ #size-cells =3D <0>;
> =C2=A0+ };
> =C2=A0+
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pio: pinctrl@1c20800 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0compatible =3D "allwinner,sun50i-a64-pinctrl";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0reg =3D <0x01c20800 0x400>;
> =C2=A0--
> =C2=A02.9.0
>
> =C2=A0_______________________________________________
> =C2=A0linux-arm-kernel mailing list
> =C2=A0linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> =C2=A0http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
