From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/3] dt-bindings: Add binding docs for V3D.
Date: Fri,  4 Mar 2016 12:32:06 -0800
Message-ID: <1457123528-13482-2-git-send-email-eric@anholt.net>
References: <1457123528-13482-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457123528-13482-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This was missed in the upstreaming process.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
index 56a961a..9f97df4 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
+++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
@@ -35,6 +35,12 @@ Optional properties for HDMI:
 		  as an interrupt/status bit in the HDMI controller
 		  itself).  See bindings/pinctrl/brcm,bcm2835-gpio.txt
 
+Required properties for V3D:
+- compatible:	Should be "brcm,bcm2835-v3d"
+- reg:		Physical base address and length of the V3D's registers
+- interrupts:	The interrupt number
+		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+
 Example:
 pixelvalve@7e807000 {
 	compatible = "brcm,bcm2835-pixelvalve2";
@@ -60,6 +66,12 @@ hdmi: hdmi@7e902000 {
 	clock-names = "pixel", "hdmi";
 };
 
+v3d: v3d@7ec00000 {
+	compatible = "brcm,bcm2835-v3d";
+	reg = <0x7ec00000 0x1000>;
+	interrupts = <1 10>;
+};
+
 vc4: gpu {
 	compatible = "brcm,bcm2835-vc4";
 };
-- 
2.7.0
