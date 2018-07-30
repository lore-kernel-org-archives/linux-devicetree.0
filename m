From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 3/5] dt-bindings: Add CDTech S070WV95-CT16 panel bindings
Date: Tue, 31 Jul 2018 01:11:15 +0200
Message-ID: <20180730231117.5631-4-giulio.benetti@micronovasrl.com>
References: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

Add documentation for S070WV95-CT16 panel

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../bindings/display/panel/cdtech,s070wv95-ct16.txt  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt

diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
new file mode 100644
index 000000000000..505615dfa0df
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
@@ -0,0 +1,12 @@
+CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
+
+Required properties:
+- compatible: should be "cdtech,s070wv95-ct16"
+- power-supply: as specified in the base binding
+
+Optional properties:
+- backlight: as specified in the base binding
+- enable-gpios: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.17.1
