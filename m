From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] ARM: dts: zynq: Add OCM node
Date: Thu, 12 Feb 2015 11:22:07 +0100
Message-ID: <135fba212abd740584a2547903cc8d175417344c.1423736523.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add OCM node for all zynq boards. OCM location
can changed but for all current boards this
is the location where OCM is.`

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

This patch is done based on discussion here.
https://lkml.org/lkml/2014/12/1/396

There are some ways how to do it.
OCM location can be changed but board DTS files
can easily rewrite it.
The problem which there is that node has address
in it but maybe someone can suggest better solution.
---
 arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index a5cd2eda3edf..d55a8b365a6c 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -150,6 +150,11 @@
 			reg = <0xf8006000 0x1000>;
 		};
 
+		ocm: sram@fffc0000 {
+			compatible = "mmio-sram";
+			reg = <0xfffc0000 0x10000>;
+		};
+
 		uart0: serial@e0000000 {
 			compatible = "xlnx,xuartps", "cdns,uart-r1p8";
 			status = "disabled";
-- 
1.8.2.3
