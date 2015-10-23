From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 1/3] DT binding: gpio-zynq: Document interrupt-controller
Date: Fri, 23 Oct 2015 09:25:30 -0700
Message-ID: <1445617532-10228-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

HW and driver support the GPIO as interrupt-controller. Document that in
the DT binding.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 Documentation/devicetree/bindings/gpio/gpio-zynq.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
index db4c6a663c03..7b542657f259 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
@@ -12,6 +12,13 @@ Required properties:
 - interrupts		: Interrupt specifier (see interrupt bindings for
 			  details)
 - interrupt-parent	: Must be core interrupt controller
+- interrupt-controller	: Marks the device node as an interrupt controller.
+- #interrupt-cells 	: Should be 2.  The first cell is the GPIO number.
+			  The second cell bits[3:0] is used to specify trigger type and level flags:
+			      1 = low-to-high edge triggered.
+			      2 = high-to-low edge triggered.
+			      4 = active high level-sensitive.
+			      8 = active low level-sensitive.
 - reg			: Address and length of the register set for the device
 
 Example:
@@ -22,5 +29,7 @@ Example:
 		gpio-controller;
 		interrupt-parent = <&intc>;
 		interrupts = <0 20 4>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		reg = <0xe000a000 0x1000>;
 	};
-- 
2.6.2.3.ga463a5b
