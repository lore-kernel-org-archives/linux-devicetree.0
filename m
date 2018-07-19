Return-Path: <SRS0=Hazi=KD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690052.outbound.protection.outlook.com ([40.107.69.52]:5920
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730273AbeGSK5k (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Jul 2018 06:57:40 -0400
From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH 4/4] arm64: zynqmp: Add DDRC node
Date: Thu, 19 Jul 2018 15:44:50 +0530
Message-ID: <1531995290-15643-5-git-send-email-manish.narani@xilinx.com>
In-Reply-To: <1531995290-15643-1-git-send-email-manish.narani@xilinx.com>
References: <1531995290-15643-1-git-send-email-manish.narani@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, mdf@kernel.org, willw@xilinx.com, naga.sureshkumar.relli@xilinx.com, edgar.iglesias@xilinx.com, bharat.kumar.gogada@xilinx.com, shubhrajyoti.datta@xilinx.com, stefan.krsmanovic@aggios.com
Cc: anirudh@xilinx.com, sgoud@xilinx.com, Manish Narani <manish.narani@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

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

