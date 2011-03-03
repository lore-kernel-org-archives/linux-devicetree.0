From: Dirk Eibach <eibach@gdsys.de>
Subject: [PATCH] hwmon: (ads1015) Add devicetree documentation
Date: Thu,  3 Mar 2011 10:16:45 +0100
Message-ID: <1299143805-13133-1-git-send-email-eibach@gdsys.de>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, rdunlap@xenotime.net, devicetree-discuss@lists.ozlabs.org, w.sang@pengutronix.de, khali@linux-fr.org, Dirk Eibach <eibach@gdsys.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Dirk Eibach <eibach@gdsys.de>
---
 Documentation/devicetree/bindings/i2c/ads1015.txt |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/ads1015.txt

diff --git a/Documentation/devicetree/bindings/i2c/ads1015.txt b/Documentation/devicetree/bindings/i2c/ads1015.txt
new file mode 100644
index 0000000..3a7d67a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ads1015.txt
@@ -0,0 +1,15 @@
+ADS1015 (I2C)
+
+Optional properties:
+
+ - exported-channels : exported_channels is a bitmask that specifies which
+		       inputs should be exported to sysfs.
+
+Example:
+ads1015@49 {
+	compatible = "ti,ads1015";
+	reg = <0x49>;
+	exported-channels = <0x14>;
+};
+
+In this example only in2_input and in4_input would be created.
-- 
1.5.6.5

