From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH v3 4/4] arm64: zynqmp: Add DDRC node
Date: Thu, 2 Aug 2018 18:21:22 +0530
Message-ID: <1533214282-9977-5-git-send-email-manish.narani@xilinx.com>
References: <1533214282-9977-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533214282-9977-1-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, mdf@kernel.org, edgar.iglesias@xilinx.com, shubhrajyoti.datta@xilinx.com, naga.sureshkumar.relli@xilinx.com, bharat.kumar.gogada@xilinx.com, stefan.krsmanovic@aggios.com
Cc: sgoud@xilinx.com, anirudh@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, Manish Narani <manish.narani@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch adds ddrc memory controller node in dts. The size mentioned
in dts is 0x30000, because we need to access DDR_QOS INTR registers
located at fd090208 from this driver.

Signed-off-by: Manish Narani <manish.narani@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index a091e6f..7d6a3cf 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -355,6 +355,13 @@
 			xlnx,bus-width = <64>;
 		};
 
+		mc: memory-controller@fd070000 {
+			compatible = "xlnx,zynqmp-ddrc-2.40a";
+			reg = <0x0 0xfd070000 0x0 0x30000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 112 4>;
+		};
+
 		gem0: ethernet@ff0b0000 {
 			compatible = "cdns,zynqmp-gem", "cdns,gem";
 			status = "disabled";
-- 
2.1.1
