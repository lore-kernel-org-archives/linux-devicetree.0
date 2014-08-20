From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 2/3] ARM: zynq: DT: Move size/address properties to dtsi
Date: Wed, 20 Aug 2014 08:56:58 -0700
Message-ID: <1408550219-19825-2-git-send-email-soren.brinkmann@xilinx.com>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Soren Brinkmann <soren.brinkmann@xilinx.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Move the GEM's size and address cells properties to the common
dtsi file.

Cc: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 arch/arm/boot/dts/zynq-7000.dtsi      | 4 ++++
 arch/arm/boot/dts/zynq-parallella.dts | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
index 6cc83d4c6c76..4e6e96ef7bd0 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -195,6 +195,8 @@
 			interrupts =3D <0 22 4>;
 			clocks =3D <&clkc 30>, <&clkc 30>, <&clkc 13>;
 			clock-names =3D "pclk", "hclk", "tx_clk";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
 		};
=20
 		gem1: ethernet@e000c000 {
@@ -204,6 +206,8 @@
 			interrupts =3D <0 45 4>;
 			clocks =3D <&clkc 31>, <&clkc 31>, <&clkc 14>;
 			clock-names =3D "pclk", "hclk", "tx_clk";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
 		};
=20
 		sdhci0: sdhci@e0100000 {
diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index 41afd9da6876..690e6206beac 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -38,8 +38,6 @@
 	status =3D "okay";
 	phy-mode =3D "rgmii-id";
 	phy-handle =3D <&ethernet_phy>;
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
=20
 	ethernet_phy: ethernet-phy@0 {
 		/* Marvell 88E1318 */
--=20
2.0.1.1.gfbfc394
