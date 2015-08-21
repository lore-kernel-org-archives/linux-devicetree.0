From: Zhao Qiang <qiang.zhao@freescale.com>
Subject: [PATCH] t104xd4rdb: add DS26522 nodes to device tree
Date: Fri, 21 Aug 2015 10:48:56 +0800
Message-ID: <1440125336-11313-1-git-send-email-qiang.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: scottwood@freescale.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org, pawel.moll@arm.com, X.xie@freescale.com, Zhao Qiang <qiang.zhao@freescale.com>
List-Id: devicetree@vger.kernel.org

DS26522 is used for tdm, configured by SPI bus.
Add nodes under spi node to t104xd4rdb.dtsi.

Signed-off-by: Zhao Qiang <qiang.zhao@freescale.com>
---
 Documentation/devicetree/bindings/net/maxim,ds26522.txt | 13 +++++++++++++
 arch/powerpc/boot/dts/t104xd4rdb.dtsi                   | 10 ++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/maxim,ds26522.txt

diff --git a/Documentation/devicetree/bindings/net/maxim,ds26522.txt b/Documentation/devicetree/bindings/net/maxim,ds26522.txt
new file mode 100644
index 0000000..ee8bb72
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/maxim,ds26522.txt
@@ -0,0 +1,13 @@
+* Maxim (Dallas) DS26522 Dual T1/E1/J1 Transceiver
+
+Required properties:
+- compatible: Should contain "maxim,ds26522".
+- reg: SPI CS.
+- spi-max-frequency: SPI clock.
+
+Example:
+	slic@1 {
+		compatible = "maxim,ds26522";
+		reg = <1>;
+		spi-max-frequency = <2000000>; /* input clock */
+	};
diff --git a/arch/powerpc/boot/dts/t104xd4rdb.dtsi b/arch/powerpc/boot/dts/t104xd4rdb.dtsi
index 491367b..3f6d7c6 100644
--- a/arch/powerpc/boot/dts/t104xd4rdb.dtsi
+++ b/arch/powerpc/boot/dts/t104xd4rdb.dtsi
@@ -109,6 +109,16 @@
 				/* input clock */
 				spi-max-frequency = <10000000>;
 			};
+			slic@1 {
+				compatible = "maxim,ds26522";
+				reg = <1>;
+				spi-max-frequency = <2000000>; /* input clock */
+			};
+			slic@2 {
+				compatible = "maxim,ds26522";
+				reg = <2>;
+				spi-max-frequency = <2000000>; /* input clock */
+			};
 		};
 		i2c@118000 {
 			hwmon@4c {
-- 
2.1.0.27.g96db324
