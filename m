From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm64: zynqmp: Use serdev for zcu100 BT
Date: Wed, 11 Apr 2018 15:16:16 +0200
Message-ID: <0ce3b4f588f1d9a83cfe99b93af3514f4d893273.1523452571.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: monstr@monstr.eu, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Mainline started to use serdev interface for uart attached devices.
Change description to reflect it.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
index 3e862a9faf26..c7f713c8e69e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
@@ -89,12 +89,6 @@
 			gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
-
-		bt_power {
-			label = "bt_power";
-			gpios = <&gpio 8 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
-		};
 	};
 
 	wmmcsdio_fixed: fixedregulator-mmcsdio {
@@ -267,6 +261,10 @@
 
 &uart0 {
 	status = "okay";
+	bluetooth {
+		compatible = "ti,wl1831-st";
+		enable-gpios = <&gpio 8 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart1 {
-- 
2.17.0
