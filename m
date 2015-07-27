From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] ARM64: zynqmp: Enable spi flashes on ep108
Date: Mon, 27 Jul 2015 11:50:26 +0200
Message-ID: <1ab9d1360f86aec30fcecf49ac0b52b10766f3fc.1437990621.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Suneel Garapati <suneel.garapati@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Enable spi flashes on ep108.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 47debdcbefbf..279a992ce70e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -81,6 +81,40 @@
 	status = "okay";
 };
 
+&spi0 {
+	status = "okay";
+	num-cs = <1>;
+	spi0_flash0: spi0_flash0@0 {
+		compatible = "m25p80";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+		reg = <0>;
+
+		spi0_flash0@00000000 {
+			label = "spi0_flash0";
+			reg = <0x0 0x100000>;
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+	num-cs = <1>;
+	spi1_flash0: spi1_flash0@0 {
+		compatible = "m25p80";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+		reg = <0>;
+
+		spi1_flash0@00000000 {
+			label = "spi1_flash0";
+			reg = <0x0 0x100000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.3.5
