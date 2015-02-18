From: Niklas Cassel <nks@flawful.org>
Subject: [PATCH RESEND 2/2] serial: add device tree binding documentation for ETRAX FS UART
Date: Wed, 18 Feb 2015 23:29:38 +0100
Message-ID: <1424298578-6833-1-git-send-email-nks@flawful.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Niklas Cassel <nks@flawful.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Niklas Cassel <nks@flawful.org>
---
[PATCH 1/2] of this patch series has already reached its way into mainline.
It would be nice if someone picked up [PATCH 2/2] (this commit) before the merge window closes.

 .../devicetree/bindings/serial/axis,etraxfs-uart.txt  | 19 +++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt b/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt
new file mode 100644
index 0000000..ebcbb62
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt
@@ -0,0 +1,19 @@
+ETRAX FS UART
+
+Required properties:
+- compatible : "axis,etraxfs-uart"
+- reg: offset and length of the register set for the device.
+- interrupts: device interrupt
+
+Optional properties:
+- {dtr,dsr,ri,cd}-gpios: specify a GPIO for DTR/DSR/RI/CD
+  line respectively.
+
+Example:
+
+serial@b00260000 {
+	compatible = "axis,etraxfs-uart";
+	reg = <0xb0026000 0x1000>;
+	interrupts = <68>;
+	status = "disabled";
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d6bad12..f8d088e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -27,6 +27,7 @@ atmel	Atmel Corporation
 auo	AU Optronics Corporation
 avago	Avago Technologies
 avic	Shanghai AVIC Optoelectronics Co., Ltd.
+axis	Axis Communications AB
 bosch	Bosch Sensortec GmbH
 brcm	Broadcom Corporation
 buffalo	Buffalo, Inc.
-- 
2.2.2
