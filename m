From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 1/3] dt-bindings: display: Add GiantPlus GPM940B0 panel documentation
Date: Thu,  6 Jun 2019 00:22:45 +0200
Message-ID: <20190605222247.25657-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The GPM940B0 is a 3.0" 320x240 24-bit TFT LCD panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2: New patch
    
    v3: Add Rob's ack
    
    v4-v5: No change

 .../bindings/display/panel/giantplus,gpm940b0.txt    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt

diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
new file mode 100644
index 000000000000..3dab52f92c26
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
@@ -0,0 +1,12 @@
+GiantPlus 3.0" (320x240 pixels) 24-bit TFT LCD panel
+
+Required properties:
+- compatible: should be "giantplus,gpm940b0"
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
