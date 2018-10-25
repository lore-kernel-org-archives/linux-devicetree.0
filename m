From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH v3 2/5] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Thu, 25 Oct 2018 15:29:33 +0200
Message-ID: <20181025132937.24405-2-poeschel@lemonage.de>
References: <20181025132937.24405-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025132937.24405-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "GitAuthor: Lars Poeschel" <poeschel@lemonage.de>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a simple binding doc for the pn532.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
Changes in v3:
- seperate binding doc instead of entry in trivial-devices.txt

 .../devicetree/bindings/nfc/pn532.txt         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nfc/pn532.txt

diff --git a/Documentation/devicetree/bindings/nfc/pn532.txt b/Documentation/devicetree/bindings/nfc/pn532.txt
new file mode 100644
index 000000000000..a2df72a5f504
--- /dev/null
+++ b/Documentation/devicetree/bindings/nfc/pn532.txt
@@ -0,0 +1,31 @@
+NXP PN532 NFC Chip
+
+Required properties:
+- compatible: Should be
+    - "nxp,pn532" Place a node with this inside the devicetree node of the bus
+                  where the NFC chip is connected to.
+                  Currently the kernel has phy bindings for uart and i2c.
+    - "nxp,pn532-i2c" (DEPRECATED) only works for the i2c binding.
+    - "nxp,pn533-i2c" (DEPRECATED) only works for the i2c binding.
+
+There are no additional properties provided by the driver at the moment.
+
+Example uart:
+
+uart4: serial@49042000 {
+        compatible = "ti,omap3-uart";
+
+        pn532: nfc {
+                compatible = "nxp,pn532";
+        };
+};
+
+Example i2c:
+
+i2c1: i2c@0 {
+        compatible = "ti,omap3-i2c";
+
+        pn532: nfc {
+                compatible = "nxp,pn532";
+        };
+};
-- 
2.19.1
