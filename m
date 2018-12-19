From: Peter Rosin <peda@lysator.liu.se>
Subject: [PATCH v2 2/3] dt-bindings: display: bridge: lvds-transmitter: cleanup example
Date: Wed, 19 Dec 2018 14:04:48 +0100
Message-ID: <20181219130449.31641-3-peda@lysator.liu.se>
References: <20181219130449.31641-1-peda@lysator.liu.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219130449.31641-1-peda@lysator.liu.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Peter Rosin <peda@axentia.se>

Drop #address-cells and #size-cells from the root node in the
example, they are unused.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
index fd39ad34c383..36ce07c8d8e6 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -38,8 +38,6 @@ Example
 
 lvds-encoder {
 	compatible = "lvds-encoder";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
 	ports {
 		#address-cells = <1>;
-- 
2.11.0
