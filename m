From: Suneel Garapati <suneel.garapati@xilinx.com>
Subject: [PATCH] devicetree: xilinx: add rtc node to zynqmp dtsi
Date: Thu, 23 Jul 2015 16:22:20 +0530
Message-ID: <1437648740-7587-1-git-send-email-suneel.garapati@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@vger.kernel.org
Cc: michals@xilinx.com, sorenb@xilinx.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Suneel Garapati <suneel.garapati@xilinx.com>
List-Id: devicetree@vger.kernel.org

adds rtc controller node to zynqmp devicetree.

Signed-off-by: Suneel Garapati <suneel.garapati@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 4 ++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 0a3f40e..b48ce47 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -45,3 +45,7 @@
 &uart0 {
	status = "okay";
 };
+
+&rtc {
+	status = "okay";
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 11e0b00..b76ede1 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -220,6 +220,15 @@
			#size-cells = <0>;
		};

+		rtc: rtc@ffa60000 {
+			compatible = "xlnx,zynqmp-rtc";
+			status = "disabled";
+			reg = <0x0 0xffa60000 0x100>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 26 4>, <0 27 4>;
+			interrupt-names = "alm", "sec";
+		};
+
		spi0: spi@ff040000 {
			compatible = "cdns,spi-r1p6";
			status = "disabled";
--
2.1.2
