From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH] ASoC: gtm601: Document GTM601 bindings
Date: Thu,  7 May 2015 21:29:31 +0200
Message-ID: <1431026971-17452-1-git-send-email-marek@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.de, lgirdwood@gmail.com, hns@goldelico.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Add small documentation for GTM601 UMTS modem audio interface.

Signed-off-by: Marek Belisko <marek@goldelico.com>
---
This one was corrupted in V2 series so sending update only.

 Documentation/devicetree/bindings/sound/gtm601.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/gtm601.txt

diff --git a/Documentation/devicetree/bindings/sound/gtm601.txt b/Documentation/devicetree/bindings/sound/gtm601.txt
new file mode 100644
index 0000000..5efc8c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/gtm601.txt
@@ -0,0 +1,13 @@
+GTM601 UMTS modem audio interface CODEC
+
+This device has no configuration interface. Sample rate is fixed - 8kHz.
+
+Required properties:
+
+  - compatible : "option,gtm601"
+
+Example:
+
+codec: gtm601_codec {
+	compatible = "option,gtm601";
+};
-- 
1.9.1
