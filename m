From: Niklas Cassel <nks-l8MkAr6ANHBAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 2/2] serial: add device tree binding documentation for ETRAX FS UART
Date: Sun,  8 Feb 2015 09:31:52 +0100
Message-ID: <1423384312-6185-1-git-send-email-nks@flawful.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Niklas Cassel <nks-l8MkAr6ANHBAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Niklas Cassel <nks-l8MkAr6ANHBAfugRpC6u6w@public.gmane.org>
---
[PATCH 1/2] of this patch series has been applied to gregkh's tty-testing branch.
However he expected someone else to pick up [PATCH 2/2] (this commit).

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
