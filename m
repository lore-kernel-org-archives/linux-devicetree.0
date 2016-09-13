From: <shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/10] [v3] Documentation: DT: Add entry for QorIQ LS1046A-QDS board
Date: Tue, 13 Sep 2016 16:10:02 +0800
Message-ID: <1473754203-22970-10-git-send-email-shh.xie@gmail.com>
References: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473754203-22970-1-git-send-email-shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>

Signed-off-by: Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
changes from V1 to V3:
1. none.

 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index d6acdb3..d6ee9c6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -155,6 +155,10 @@ LS1046A SoC
 Required root node properties:
     - compatible = "fsl,ls1046a";
 
+LS1046A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1046a-qds", "fsl,ls1046a";
+
 LS1046A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
