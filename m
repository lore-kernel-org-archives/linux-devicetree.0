From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v3 1/7] dt-bindings: display: bridge: lvds-transmitter: add ti,ds90c185
Date: Thu, 19 Apr 2018 18:27:45 +0200
Message-ID: <20180419162751.25223-2-peda@axentia.se>
References: <20180419162751.25223-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419162751.25223-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, Russell King <linux@armlinux.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Start list of actual chips compatible with "lvds-encoder".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 .../devicetree/bindings/display/bridge/lvds-transmitter.txt       | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
index fd39ad34c383..50220190c203 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -22,7 +22,13 @@ among others.
 
 Required properties:
 
-- compatible: Must be "lvds-encoder"
+- compatible: Must be one or more of the following
+  - "ti,ds90c185" for the TI DS90C185 FPD-Link Serializer
+  - "lvds-encoder" for a generic LVDS encoder device
+
+  When compatible with the generic version, nodes must list the
+  device-specific version corresponding to the device first
+  followed by the generic version.
 
 Required nodes:
 
-- 
2.11.0
