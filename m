From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v4 1/2] dt-bindings: display/panel: Add KOE tx14d24vm1bpa display description
Date: Wed, 15 May 2019 18:04:28 +0200
Message-ID: <20190515160428.6114-1-lukma@denx.de>
References: <20180412143715.6828-1-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412143715.6828-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

This commit adds documentation entry description for KOE's 5.7" display.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Previous discussion (and Rob's Reviewed-by) about this patch
https://patchwork.kernel.org/patch/10339595/

Changes for v4:
- Rebase on top of newest mainline
SHA1: 5ac94332248ee017964ba368cdda4ce647e3aba7

Changes for v3 :
- New patch
---
 .../bindings/display/panel/koe,tx14d24vm1bpa.txt   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt

diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
new file mode 100644
index 000000000000..be7ac666807b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
@@ -0,0 +1,42 @@
+Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
+
+Required properties:
+- compatible: should be "koe,tx14d24vm1bpa"
+- backlight: phandle of the backlight device attached to the panel
+- power-supply: single regulator to provide the supply voltage
+
+Required nodes:
+- port: Parallel port mapping to connect this display
+
+This panel needs single power supply voltage. Its backlight is conntrolled
+via PWM signal.
+
+Example:
+--------
+
+Example device-tree definition when connected to iMX53 based board
+
+	lcd_panel: lcd-panel {
+		compatible = "koe,tx14d24vm1bpa";
+		backlight = <&backlight_lcd>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			lcd_panel_in: endpoint {
+				remote-endpoint = <&lcd_display_out>;
+			};
+		};
+	};
+
+Then one needs to extend the dispX node:
+
+	lcd_display: disp1 {
+
+		port@1 {
+			reg = <1>;
+
+			lcd_display_out: endpoint {
+				remote-endpoint = <&lcd_panel_in>;
+			};
+		};
+	};
-- 
2.11.0
