From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] OMAPDSS: Correct video ports description file path in DT binding doc
Date: Sat,  7 Mar 2015 17:08:03 +0100
Message-ID: <1425744483-13188-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

The doc refers to Documentation/devicetree/bindings/video/video-ports.txt
which does not exist. The documentation seems to be outdated and wants to
refer to Documentation/devicetree/bindings/graph.txt instead.

Suggested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 Documentation/devicetree/bindings/video/ti,omap-dss.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/ti,omap-dss.txt b/Documentation/devicetree/bindings/video/ti,omap-dss.txt
index d5f1a3fe3109..e1ef29569338 100644
--- a/Documentation/devicetree/bindings/video/ti,omap-dss.txt
+++ b/Documentation/devicetree/bindings/video/ti,omap-dss.txt
@@ -25,8 +25,8 @@ Video Ports
 -----------
 
 The DSS Core and the encoders have video port outputs. The structure of the
-video ports is described in Documentation/devicetree/bindings/video/video-
-ports.txt, and the properties for the ports and endpoints for each encoder are
+video ports is described in Documentation/devicetree/bindings/graph.txt,
+and the properties for the ports and endpoints for each encoder are
 described in the SoC's DSS binding documentation.
 
 The video ports are used to describe the connections to external hardware, like
-- 
2.1.4
