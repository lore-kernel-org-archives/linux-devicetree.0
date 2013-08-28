Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55835 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab3H1XBQ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 28 Aug 2013 19:01:16 -0400
Subject: patch "devicetree: serial: Document msm_serial bindings" added to tty tree
From: <gregkh@linuxfoundation.org>
Date: Wed, 28 Aug 2013 16:03:37 -0700
Message-ID: <13777310172462@kroah.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: sboyd@codeaurora.org, davidb@codeaurora.org, devicetree@vger.kernel.org, galak@codeaurora.org, gregkh@linuxfoundation.org
List-ID: <devicetree@vger.kernel.org>


This is a note to let you know that I've just added the patch titled

    devicetree: serial: Document msm_serial bindings

to my tty git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
in the tty-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


>From 6e01365c469f3cfe96a1b428bade1a3628896929 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <sboyd@codeaurora.org>
Date: Wed, 28 Aug 2013 13:32:40 -0700
Subject: devicetree: serial: Document msm_serial bindings

Let's fix up the msm serial device bindings so that it's clearer
what hardware is supported. Instead of using hsuart (for high
speed uart) let's use uartdm because that matches the actual name
of the hardware. Also, let's add the version information in case
we need to differentiate between different versions of the
hardware in the future. Finally, lets specify that clocks are
required (the clock bindings didn't exist when the original
binding was written) and also specify dma bindings just in case
we want to use it in software. We split the binding into two
files to make it clearer what's required and not required.

Cc: David Brown <davidb@codeaurora.org>
Cc: <devicetree@vger.kernel.org>
Acked-by: Kumar Gala <galak@codeaurora.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../devicetree/bindings/serial/qcom,msm-uart.txt   | 25 ++++++++++
 .../devicetree/bindings/serial/qcom,msm-uartdm.txt | 53 ++++++++++++++++++++++
 .../devicetree/bindings/tty/serial/msm_serial.txt  | 27 -----------
 3 files changed, 78 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
 delete mode 100644 Documentation/devicetree/bindings/tty/serial/msm_serial.txt

diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uart.txt b/Documentation/devicetree/bindings/serial/qcom,msm-uart.txt
new file mode 100644
index 0000000..ce8c901
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,msm-uart.txt
@@ -0,0 +1,25 @@
+* MSM Serial UART
+
+The MSM serial UART hardware is designed for low-speed use cases where a
+dma-engine isn't needed. From a software perspective it's mostly compatible
+with the MSM serial UARTDM except that it only supports reading and writing one
+character at a time.
+
+Required properties:
+- compatible: Should contain "qcom,msm-uart"
+- reg: Should contain UART register location and length.
+- interrupts: Should contain UART interrupt.
+- clocks: Should contain the core clock.
+- clock-names: Should be "core".
+
+Example:
+
+A uart device at 0xa9c00000 with interrupt 11.
+
+serial@a9c00000 {
+	compatible = "qcom,msm-uart";
+	reg = <0xa9c00000 0x1000>;
+	interrupts = <11>;
+	clocks = <&uart_cxc>;
+	clock-names = "core";
+};
diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
new file mode 100644
index 0000000..ffa5b78
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
@@ -0,0 +1,53 @@
+* MSM Serial UARTDM
+
+The MSM serial UARTDM hardware is designed for high-speed use cases where the
+transmit and/or receive channels can be offloaded to a dma-engine. From a
+software perspective it's mostly compatible with the MSM serial UART except
+that it supports reading and writing multiple characters at a time.
+
+Required properties:
+- compatible: Should contain at least "qcom,msm-uartdm".
+              A more specific property should be specified as follows depending
+	      on the version:
+		"qcom,msm-uartdm-v1.1"
+		"qcom,msm-uartdm-v1.2"
+		"qcom,msm-uartdm-v1.3"
+		"qcom,msm-uartdm-v1.4"
+- reg: Should contain UART register locations and lengths. The first
+       register shall specify the main control registers. An optional second
+       register location shall specify the GSBI control region.
+       "qcom,msm-uartdm-v1.3" is the only compatible value that might
+       need the GSBI control region.
+- interrupts: Should contain UART interrupt.
+- clocks: Should contain the core clock and the AHB clock.
+- clock-names: Should be "core" for the core clock and "iface" for the
+	       AHB clock.
+
+Optional properties:
+- dmas: Should contain dma specifiers for transmit and receive channels
+- dma-names: Should contain "tx" for transmit and "rx" for receive channels
+
+Examples:
+
+A uartdm v1.4 device with dma capabilities.
+
+serial@f991e000 {
+	compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+	reg = <0xf991e000 0x1000>;
+	interrupts = <0 108 0x0>;
+	clocks = <&blsp1_uart2_apps_cxc>, <&blsp1_ahb_cxc>;
+	clock-names = "core", "iface";
+	dmas = <&dma0 0>, <&dma0 1>;
+	dma-names = "tx", "rx";
+};
+
+A uartdm v1.3 device without dma capabilities and part of a GSBI complex.
+
+serial@19c40000 {
+	compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+	reg = <0x19c40000 0x1000>,
+	      <0x19c00000 0x1000>;
+	interrupts = <0 195 0x0>;
+	clocks = <&gsbi5_uart_cxc>, <&gsbi5_ahb_cxc>;
+	clock-names = "core", "iface";
+};
diff --git a/Documentation/devicetree/bindings/tty/serial/msm_serial.txt b/Documentation/devicetree/bindings/tty/serial/msm_serial.txt
deleted file mode 100644
index aef383e..0000000
--- a/Documentation/devicetree/bindings/tty/serial/msm_serial.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Qualcomm MSM UART
-
-Required properties:
-- compatible :
-	- "qcom,msm-uart", and one of "qcom,msm-hsuart" or
-	  "qcom,msm-lsuart".
-- reg : offset and length of the register set for the device
-	for the hsuart operating in compatible mode, there should be a
-	second pair describing the gsbi registers.
-- interrupts : should contain the uart interrupt.
-
-There are two different UART blocks used in MSM devices,
-"qcom,msm-hsuart" and "qcom,msm-lsuart".  The msm-serial driver is
-able to handle both of these, and matches against the "qcom,msm-uart"
-as the compatibility.
-
-The registers for the "qcom,msm-hsuart" device need to specify both
-register blocks, even for the common driver.
-
-Example:
-
-	uart@19c400000 {
-		compatible = "qcom,msm-hsuart", "qcom,msm-uart";
-		reg = <0x19c40000 0x1000>,
-		      <0x19c00000 0x1000>;
-		interrupts = <195>;
-	};
-- 
1.8.4.6.g82e253f.dirty


