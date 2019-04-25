From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/3] dt-bindings: display: Add Sharp LS020B1DD01D panel documentation
Date: Fri, 26 Apr 2019 01:18:52 +0200
Message-ID: <20190425231854.24479-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The LS020B1DD01D is a 2.0" 240x160 16-bit TFT LCD panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2: New patch
    
    v3: Add Rob's Reviewed-by

 .../bindings/display/panel/sharp,ls020b1dd01d.txt    | 12 ++++++++++++
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
2.21.0.593.g511ec345e18
