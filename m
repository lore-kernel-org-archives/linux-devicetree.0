From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH v2 1/2] ARM: dts: berlin: add the SDHCI nodes for the BG2Q
Date: Tue, 22 Apr 2014 10:27:27 +0200
Message-ID: <1398155248-1659-2-git-send-email-antoine.tenart@free-electrons.com>
References: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the SDHCI nodes for the Marvell Berlin BG2Q, using the mrvl,pxav3-m=
mc
driver.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin=
2q.dtsi
index 5925e6a16749..85d0ca5cc47a 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -67,6 +67,14 @@
 		clock-div =3D <3>;
 	};
=20
+	sdio1clk: sdio1clk {
+		compatible =3D "fixed-factor-clock";
+		#clock-cells =3D <0>;
+		clocks =3D <&syspll>;
+		clock-mult =3D <1>;
+		clock-div =3D <4>;
+	};
+
 	soc {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
@@ -75,6 +83,30 @@
 		ranges =3D <0 0xf7000000 0x1000000>;
 		interrupt-parent =3D <&gic>;
=20
+		sdhci0: sdhci@ab0000 {
+			compatible =3D "mrvl,pxav3-mmc";
+			reg =3D <0xab0000 0x200>;
+			clocks =3D <&sdio1clk>;
+			interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			status =3D "disabled";
+		};
+
+		sdhci1: sdhci@ab0800 {
+			compatible =3D "mrvl,pxav3-mmc";
+			reg =3D <0xab0800 0x200>;
+			clocks =3D <&sdio1clk>;
+			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			status =3D "disabled";
+		};
+
+		sdhci2: sdhci@ab1000 {
+			compatible =3D "mrvl,pxav3-mmc";
+			reg =3D <0xab1000 0x200>;
+			interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&sdio1clk>;
+			status =3D "disabled";
+		};
+
 		l2: l2-cache-controller@ac0000 {
 			compatible =3D "arm,pl310-cache";
 			reg =3D <0xac0000 0x1000>;
--=20
1.8.3.2
