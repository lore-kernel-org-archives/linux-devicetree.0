From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 11/12] ARM: dts: berlin: add BG2CD nodes for USB support
Date: Wed, 16 Jul 2014 10:26:05 +0200
Message-ID: <1405499166-6726-12-git-send-email-antoine.tenart@free-electrons.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405499166-6726-1-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Adds nodes describing the Marvell Berlin BG2CD USB PHY and USB. The BG2=
CD
SoC has 2 USB ChipIdea controllers, with usb0 host-only and usb1 dual-r=
ole
capable.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/berlin2cd.dtsi | 34 ++++++++++++++++++++++++++++++++=
++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berli=
n2cd.dtsi
index 68f7032b4686..5c6950531327 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -66,6 +66,22 @@
 			clocks =3D <&chip CLKID_TWD>;
 		};
=20
+		usb_phy0: usb-phy@b74000 {
+			compatible =3D "marvell,berlin2cd-usb-phy";
+			reg =3D <0xb74000 0x128>;
+			#phy-cells =3D <0>;
+			resets =3D <&chip 0x178 23>;
+			status =3D "disabled";
+		};
+
+		usb_phy1: usb-phy@b78000 {
+			compatible =3D "marvell,berlin2cd-usb-phy";
+			reg =3D <0xb78000 0x128>;
+			#phy-cells =3D <0>;
+			resets =3D <&chip 0x178 24>;
+			status =3D "disabled";
+		};
+
 		apb@e80000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -242,6 +258,24 @@
 			};
 		};
=20
+		usb0: usb@ed0000 {
+			compatible =3D "chipidea,usb2";
+			reg =3D <0xed0000 0x200>;
+			interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&chip CLKID_USB0>;
+			usb-phy =3D <&usb_phy0>;
+			status =3D "disabled";
+		};
+
+		usb1: usb@ee0000 {
+			compatible =3D "chipidea,usb2";
+			reg =3D <0xee0000 0x200>;
+			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&chip CLKID_USB1>;
+			usb-phy =3D <&usb_phy1>;
+			status =3D "disabled";
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
