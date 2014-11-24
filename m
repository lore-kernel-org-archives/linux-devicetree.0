From: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH 3/4] rtc: ds1307: add device tree bindings documentation
Date: Mon, 24 Nov 2014 16:49:23 +0100
Message-ID: <1416844164-16782-4-git-send-email-tomas@novotny.cz>
References: <1416844164-16782-1-git-send-email-tomas@novotny.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416844164-16782-1-git-send-email-tomas@novotny.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Novotny <tomas@novotny.cz>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tomas Novotny <tomas@novotny.cz>
---
 .../devicetree/bindings/rtc/maxim,ds1307.txt       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds1307.txt

diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds1307.txt b/Documentation/devicetree/bindings/rtc/maxim,ds1307.txt
new file mode 100644
index 0000000..eb6164c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/maxim,ds1307.txt
@@ -0,0 +1,23 @@
+* Maxim (Dallas) DS1307 and compatible Real Time Clock
+
+For example, compatible chips are Maxim DS1337, Microchip MCP794xx,
+STMicroelectronics M41T00 and Epson RX-8025.
+
+Required properties:
+- compatible: For example "maxim,ds1307" (see rtc-ds1307.c driver for a full
+  list).
+- reg: i2c address
+
+Example for DS1307:
+
+ds1307: rtc@68 {
+	compatible = "maxim,ds1307";
+	reg = <0x68>;
+};
+
+Example for MCP79401:
+
+mcp7940x: rtc@6f {
+	compatible = "microchip,mcp7940x";
+	reg = <0x6f>;
+};
-- 
2.1.2
