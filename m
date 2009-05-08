From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH] powerpc/fsl: Update FSL esdhc binding
Date: Fri,  8 May 2009 08:51:05 -0500
Message-ID: <1241790665-3680-1-git-send-email-galak@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Updated the binding spec to use "fsl,eshdc" as the base compatible
rather than the first chip in the family.

Signed-off-by: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 Documentation/powerpc/dts-bindings/fsl/esdhc.txt |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
index 6008465..421897d 100644
--- a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
+++ b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
@@ -5,8 +5,7 @@ for MMC, SD, and SDIO types of memory cards.
 
 Required properties:
   - compatible : should be
-    "fsl,<chip>-esdhc", "fsl,mpc8379-esdhc" for MPC83xx processors.
-    "fsl,<chip>-esdhc", "fsl,mpc8536-esdhc" for MPC85xx processors.
+    "fsl,<chip>-esdhc", "fsl,esdhc"
   - reg : should contain eSDHC registers location and length.
   - interrupts : should contain eSDHC interrupt.
   - interrupt-parent : interrupt source phandle.
@@ -15,7 +14,7 @@ Required properties:
 Example:
 
 sdhci@2e000 {
-	compatible = "fsl,mpc8378-esdhc", "fsl,mpc8379-esdhc";
+	compatible = "fsl,mpc8378-esdhc", "fsl,mpc8379-esdhc", "fsl,esdhc";
 	reg = <0x2e000 0x1000>;
 	interrupts = <42 0x8>;
 	interrupt-parent = <&ipic>;
-- 
1.6.0.6
