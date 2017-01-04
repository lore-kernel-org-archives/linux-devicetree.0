From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] dt-bindings: qman: Remove pool channel node
Date: Wed, 4 Jan 2017 13:03:49 +0200
Message-ID: <1483527829-8369-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>

No device tree has these, nor does any driver look for them.

Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
---
 .../devicetree/bindings/soc/fsl/qman-portals.txt     | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt b/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
index 47e46cc..5a34f3a 100644
--- a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
@@ -5,7 +5,6 @@ Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
 CONTENTS
 
 	- QMan Portal
-	- QMan Pool Channel
 	- Example
 
 QMan Portal Node
@@ -82,25 +81,6 @@ These subnodes should have the following properties:
 	Definition:	The phandle to the particular hardware device that this
 			portal is connected to.
 
-DPAA QMan Pool Channel Nodes
-
-Pool Channels are defined with the following properties.
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,qman-pool-channel"
-			May include "fsl,<SoC>-qman-pool-channel"
-
-- fsl,qman-channel-id
-	Usage:		Required
-	Value type:	<u32>
-	Definition:	The hardware index of the channel. This can also be
-			determined by dividing any of the channel's 8 work queue
-			IDs by 8
-
 EXAMPLE
 
 The example below shows a (P4080) QMan portals container/bus node with two portals
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
