From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH v6 2/7] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Tue, 20 Aug 2019 14:03:39 +0200
Message-ID: <20190820120345.22593-2-poeschel@lemonage.de>
References: <20190820120345.22593-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820120345.22593-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "GitAuthor: Lars Poeschel" <poeschel@lemonage.de>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add a simple binding doc for the pn532.

Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
Changes in v6:
- Rebased the patch series on v5.3-rc5
- Picked up Rob's Reviewed-By

Changes in v4:
- Add documentation about reg property in case of i2c

Changes in v3:
- seperate binding doc instead of entry in trivial-devices.txt

 .../devicetree/bindings/nfc/pn532.txt         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nfc/pn532.txt

diff --git a/Documentation/devicetree/bindings/nfc/pn532.txt b/Documentation/devicetree/bindings/nfc/pn532.txt
new file mode 100644
index 000000000000..d5aaa588073d
--- /dev/null
+++ b/Documentation/devicetree/bindings/nfc/pn532.txt
@@ -0,0 +1,33 @@
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
+Required properties if connected on i2c:
+- reg: for the i2c bus address. This is fixed at 0x48 for the PN532.
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
+                reg = <0x48>;
+        };
+};
-- 
2.23.0.rc1
