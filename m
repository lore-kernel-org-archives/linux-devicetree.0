From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] ARM: dts: zynq: Add missing alias node for zybo and parallella
Date: Wed, 11 Feb 2015 13:29:01 +0100
Message-ID: <0a0e0579fb6e2794d2c0c6fb9186c5b43618f448.1423657710.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: monstr@monstr.eu, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add missing alias node.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-parallella.dts | 5 +++++
 arch/arm/boot/dts/zynq-zybo.dts       | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
index ab1dc0a56cdd..6a5f51daa708 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -23,6 +23,11 @@
 	model = "Adapteva Parallella Board";
 	compatible = "adapteva,parallella", "xlnx,zynq-7000";
 
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x0 0x40000000>;
diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
index a9a12ce5023b..935a561f6aa6 100644
--- a/arch/arm/boot/dts/zynq-zybo.dts
+++ b/arch/arm/boot/dts/zynq-zybo.dts
@@ -18,6 +18,11 @@
 	model = "Zynq ZYBO Development Board";
 	compatible = "digilent,zynq-zybo", "xlnx,zynq-7000";
 
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x0 0x20000000>;
-- 
1.8.2.3
