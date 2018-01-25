From: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/2] Documentation: binding: Update fsl-quadspi binding
Date: Thu, 25 Jan 2018 12:51:56 +0530
Message-ID: <1516864917-31969-2-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1516864917-31969-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516864917-31969-1-git-send-email-yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

QuadSPI controller supports Single, dual, quad modes of operation.
Mode is controlled via either RCW or the on-board connection to flash.

spi-tx-bus-width, spi-rx-bus-width binding added to define mode
of operation. Definition of these binding are standard as defined
in Documentation/devicetree/bindings/spi/spi-bus.txt.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index c34aa6f..13a903e 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -23,6 +23,10 @@ Optional properties:
 			      bus, you should enable this property.
 			      (Please check the board's schematic.)
   - big-endian : That means the IP register is big endian
+  - spi-tx-bus-width - Definition as per
+                     Documentation/devicetree/bindings/spi/spi-bus.txt
+  - spi-rx-bus-width - Definition as per
+                     Documentation/devicetree/bindings/spi/spi-bus.txt
 
 Example:
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
