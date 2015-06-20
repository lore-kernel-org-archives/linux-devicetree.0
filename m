From: Philippe Reynes <tremyfr@gmail.com>
Subject: [PATCH v3 5/6] dt-binding: document the binding for mxc rtc
Date: Sat, 20 Jun 2015 19:12:39 +0200
Message-ID: <1434820360-21935-6-git-send-email-tremyfr@gmail.com>
References: <1434820360-21935-1-git-send-email-tremyfr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434820360-21935-1-git-send-email-tremyfr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@free-electrons.com, shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, Philippe Reynes <tremyfr@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the
mxc rtc.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
---
 Documentation/devicetree/bindings/rtc/rtc-mxc.txt |   27 +++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.txt b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
new file mode 100644
index 0000000..5505493
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
@@ -0,0 +1,27 @@
+* Real Time Clock of the i.MX SoCs
+
+RTC controller for the i.MX SoCs
+
+Required properties:
+- compatible: Should be "fsl,imx1-rtc" or "fsl,imx21-rtc".
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: IRQ line for the RTC.
+- clocks: should contain two entries:
+  * one for the input reference
+  * one for the the SoC RTC
+- clock-names: should contain:
+  * "rtc" for the input reference clock
+  * "ipg" for the SoC RTC clock
+
+Example:
+
+rtc@10007000 {
+	compatible = "fsl,imx21-rtc";
+	reg = <0x10007000 0x1000>;
+	interrupts = <22>;
+	clocks = <&clks IMX27_CLK_CKIL>,
+	       	 <&clks IMX27_CLK_RTC_IPG_GATE>;
+	clock-names = "rtc, "ipg";
+	status = "disabled";
+};
-- 
1.7.4.4
