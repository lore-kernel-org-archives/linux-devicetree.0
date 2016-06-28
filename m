From: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/7] dt-bindings: arm: Update bindings for LS2088A targets
Date: Tue, 28 Jun 2016 20:18:55 +0530
Message-ID: <1467125341-2380-2-git-send-email-abhimanyu.saini@nxp.com>
References: <1467125341-2380-1-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467125341-2380-1-git-send-email-abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatible strings for LS2088A RDB and QDS board.

Signed-off-by: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index dbbc095..4dfae81 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -151,3 +151,10 @@ LS2080A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls2080a-rdb", "fsl,ls2080a";
 
+LS2088A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls2088a-qds", "fsl,ls2088a"
+
+LS2088A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls2088a-rdb", "fsl,ls2088a"
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
