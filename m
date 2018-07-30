From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 5/5] dt-bindings: Add CDTech S043WQ26H-CT7 panel bindings
Date: Tue, 31 Jul 2018 01:11:17 +0200
Message-ID: <20180730231117.5631-6-giulio.benetti@micronovasrl.com>
References: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

Add documentation for S043WQ26H-CT7 panel

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../bindings/display/panel/cdtech,s043wq26h-ct7.txt  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt

diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
new file mode 100644
index 000000000000..057f7f3f6dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
@@ -0,0 +1,12 @@
+CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
+
+Required properties:
+- compatible: should be "cdtech,s043wq26h-ct7"
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
