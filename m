From: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 3/7] dt-bindings: mtd: fsl-quadspi: Update qspi bindings for LS2088A
Date: Tue, 28 Jun 2016 20:18:57 +0530
Message-ID: <1467125341-2380-4-git-send-email-abhimanyu.saini@nxp.com>
References: <1467125341-2380-1-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467125341-2380-1-git-send-email-abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index c34aa6f..2f95a8f 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -5,8 +5,8 @@ Required properties:
 		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
 		 "fsl,ls1021a-qspi"
 		 or
-		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
-		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
+		 "fsl,<chip>-qspi", "fsl,ls1021a-qspi"
+		 <chip> can be: ls2080a, ls2088a, ls1043a
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
