From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFCv3 2/4] dts: zynq: Add devicetree entry for Xilinx Zynq reset controller.
Date: Thu, 30 Jul 2015 18:13:55 -0700
Message-ID: <1438305237-18497-3-git-send-email-moritz.fischer@ettus.com>
References: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 arch/arm/boot/dts/zynq-7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 0691508..6bebf02 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -1,5 +1,6 @@
 /*
  *  Copyright (C) 2011 - 2014 Xilinx
+ *  Copyright (C) 2015 National Instruments Corp.
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
@@ -258,6 +259,13 @@
 				reg = <0x100 0x100>;
 			};
 
+			rstc: rstc@200 {
+				compatible = "xlnx,zynq-reset";
+				reg = <0x200 0x48>;
+				#reset-cells = <1>;
+				syscon = <&slcr>;
+			};
+
 			pinctrl0: pinctrl@700 {
 				compatible = "xlnx,pinctrl-zynq";
 				reg = <0x700 0x200>;
-- 
2.4.3
