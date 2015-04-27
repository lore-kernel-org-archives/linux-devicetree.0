From: Gigi Joseph <gigi.joseph@gmail.com>
Subject: [PATCH 1/1] Documentation: Add dt-binding for TI-btwilink driver
Date: Mon, 27 Apr 2015 03:47:13 +0000
Message-ID: <1430106433-7132-1-git-send-email-gigi.joseph@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Gigi Joseph <gigi.joseph@ti.com>
List-Id: devicetree@vger.kernel.org

btwilink binds bluetooth hci0 interface with the shared transport driver

Signed-off-by: Gigi Joseph <gigi.joseph@ti.com>
---
 Documentation/devicetree/bindings/btwilink.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/btwilink.txt

diff --git a/Documentation/devicetree/bindings/btwilink.txt b/Documentation/devicetree/bindings/btwilink.txt
new file mode 100644
index 0000000..d286aea
--- /dev/null
+++ b/Documentation/devicetree/bindings/btwilink.txt
@@ -0,0 +1,15 @@
+btwilink
+--------
+
+Required properties:
+
+	- compatible : must be "ti,btwilink"
+
+Example:
+
+Enable the btwilink driver to bind the bluetooth hci0 interface with
+ti-st shared transport driver
+
+btwilink {
+	compatible = "ti,btwilink";
+};
-- 
1.9.1
