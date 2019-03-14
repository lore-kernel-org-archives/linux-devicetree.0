From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/5] dt-bindings: display: Add Sharp LS020B1DD01D panel documentation
Date: Thu, 14 Mar 2019 13:26:18 +0100
Message-ID: <20190314122622.7597-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The LS020B1DD01D is a 2.0" 240x160 16-bit TFT LCD panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 .../devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
new file mode 100644
index 000000000000..e45edbc565a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
@@ -0,0 +1,12 @@
+Sharp 2.0" (240x160 pixels) 16-bit TFT LCD panel
+
+Required properties:
+- compatible: should be "sharp,ls020b1dd01d"
+- power-supply: as specified in the base binding
+
+Optional properties:
+- backlight: as specified in the base binding
+- enable-gpios: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.11.0
