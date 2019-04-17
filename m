From: Florent TOMASIN <tomasin.florent@gmail.com>
Subject: [PATCH 1/2] dt-bindings: Add CDTech S050WV43-CT5 panel bindings
Date: Thu, 18 Apr 2019 00:38:44 +0100
Message-ID: <20190417233846.11880-1-tomasin.florent@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: tomasin.florent@gmail.com, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for S050WV43-CT5 panel

Signed-off-by: Florent TOMASIN <tomasin.florent@gmail.com>
---
 .../bindings/display/panel/cdtech,s050wv43-ct5.txt   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s050wv43-ct5.txt

diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s050wv43-ct5.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s050wv43-ct5.txt
new file mode 100644
index 000000000000..0e3313b68d9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/cdtech,s050wv43-ct5.txt
@@ -0,0 +1,12 @@
+CDTech(H.K.) Electronics Limited 5" 800x480 color TFT-LCD panel
+
+Required properties:
+- compatible: should be "cdtech,s050wv43-ct5"
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
