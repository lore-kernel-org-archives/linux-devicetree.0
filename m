From: <y@lvd4224.freescale.com>
Subject: [PATCH v5 1/3] dt-bindings: Add compatible for LS2088A QDS and RDB board
Date: Wed, 1 Feb 2017 11:46:57 +0530
Message-ID: <36098.475175868$1505297205@news.gmane.org>
References: <1485929819-17171-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485929819-17171-1-git-send-email-y>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: scott.wood-3arQi8VN3Tc@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>, Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>

Signed-off-by: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index c9c567a..645e8ff 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -195,3 +195,14 @@ LS2080A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls2080a-rdb", "fsl,ls2080a";
 
+LS2088A SoC
+Required root node properties:
+    - compatible = "fsl,ls2088a";
+
+LS2088A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls2088a-qds", "fsl,ls2088a";
+
+LS2088A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls2088a-rdb", "fsl,ls2088a";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
