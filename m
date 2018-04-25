From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: panel: lvds: Fix path to display timing bindings
Date: Wed, 25 Apr 2018 09:49:38 +0200
Message-ID: <1524642578-2885-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Fixes: 14da3ed8dd08c581 ("devicetree/bindings: display: Document common
panel properties")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/display/panel/panel-common.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
index 557fa765adcb9450..5d2519af4bb5ca5e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
@@ -38,7 +38,7 @@ Display Timings
   require specific display timings. The panel-timing subnode expresses those
   timings as specified in the timing subnode section of the display timing
   bindings defined in
-  Documentation/devicetree/bindings/display/display-timing.txt.
+  Documentation/devicetree/bindings/display/panel/display-timing.txt.
 
 
 Connectivity
-- 
2.7.4
