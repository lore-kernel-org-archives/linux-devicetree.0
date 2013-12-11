From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: zynq: add gem support
Date: Wed, 11 Dec 2013 09:29:49 -0800
Message-ID: <1386782989-2720-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The zynq includes a Cadence GEM IP core. This is compatible with the ma=
cb driver.
Add it to the zynq-7000 DT.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>
[soren: rebased to current Linus tree, added zc706 + zed support, moved=
 phy-mode property to board level dtses]
Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
This has a soft dependency on the net-next tree which has some patches =
for the
macb driver which are required for full functionality. But adding this =
patch to
any tree without net-next shouldn't do any harm, network might be
non-operational at the worst - I think.

	S=C3=B6ren

 arch/arm/boot/dts/zynq-7000.dtsi | 18 ++++++++++++++++++
 arch/arm/boot/dts/zynq-zc702.dts |  5 +++++
 arch/arm/boot/dts/zynq-zc706.dts |  5 +++++
 arch/arm/boot/dts/zynq-zed.dts   |  5 +++++
 4 files changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
index e7f73b2e4550..aebc48d8c397 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -65,6 +65,24 @@
 			interrupts =3D <0 50 4>;
 		};
=20
+		gem0: ethernet@e000b000 {
+			compatible =3D "cdns,gem";
+			reg =3D <0xe000b000 0x4000>;
+			status =3D "disabled";
+			interrupts =3D <0 22 4>;
+			clocks =3D <&clkc 30>, <&clkc 30>, <&clkc 13>;
+			clock-names =3D "pclk", "hclk", "tx_clk";
+		};
+
+		gem1: ethernet@e000c000 {
+			compatible =3D "cdns,gem";
+			reg =3D <0xe000c000 0x4000>;
+			status =3D "disabled";
+			interrupts =3D <0 45 4>;
+			clocks =3D <&clkc 31>, <&clkc 31>, <&clkc 14>;
+			clock-names =3D "pclk", "hclk", "tx_clk";
+		};
+
 		slcr: slcr@f8000000 {
 			compatible =3D "xlnx,zynq-slcr";
 			reg =3D <0xF8000000 0x1000>;
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
index 21aea99a067b..34d680a46b7e 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -29,6 +29,11 @@
=20
 };
=20
+&gem0 {
+	status =3D "okay";
+	phy-mode =3D "rgmii";
+};
+
 &uart1 {
 	status =3D "okay";
 };
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-=
zc706.dts
index 79009e0b74b9..b2835d5fc09a 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -30,6 +30,11 @@
=20
 };
=20
+&gem0 {
+	status =3D "okay";
+	phy-mode =3D "rgmii";
+};
+
 &uart1 {
 	status =3D "okay";
 };
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-ze=
d.dts
index d6acf2b1cdf4..2eda06889dfc 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -30,6 +30,11 @@
=20
 };
=20
+&gem0 {
+	status =3D "okay";
+	phy-mode =3D "rgmii";
+};
+
 &uart1 {
 	status =3D "okay";
 };
--=20
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
