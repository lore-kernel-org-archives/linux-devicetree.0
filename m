From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] dt/bindings: remove users of device_type "mdio"
Date: Wed, 11 Dec 2013 11:15:53 +0000
Message-ID: <1386760555-22732-4-git-send-email-grant.likely@linaro.org>
References: <1386760555-22732-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386760555-22732-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

device_type is a deprecated property, but some MDIO bus nodes still have
it. Except for a couple of old binding (compatible="gianfar" and
compatible="ucc_geth_phy") the kernel doesn't look for
device_type="mdio" at all.

This patch removes all instances of device_type="mdio" from the binding
documentation and the .dts files.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 Documentation/devicetree/bindings/marvell.txt                    | 2 --
 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt | 1 -
 arch/powerpc/boot/dts/ep8248e.dts                                | 1 -
 arch/powerpc/boot/dts/holly.dts                                  | 1 -
 arch/powerpc/boot/dts/mpc7448hpc2.dts                            | 1 -
 arch/powerpc/boot/dts/mpc8272ads.dts                             | 1 -
 arch/powerpc/boot/dts/pq2fads.dts                                | 1 -
 arch/powerpc/boot/dts/prpmc2800.dts                              | 1 -
 8 files changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/marvell.txt b/Documentation/devicetree/bindings/marvell.txt
index 73a3d251acb1..a5409ca27bc2 100644
--- a/Documentation/devicetree/bindings/marvell.txt
+++ b/Documentation/devicetree/bindings/marvell.txt
@@ -79,7 +79,6 @@ prefixed with the string "marvell,", for Marvell Technology Group Ltd.
    Required properties:
      - #address-cells : Should be <1>
      - #size-cells : Should be <0>
-     - device_type : Should be "mdio"
      - compatible : Should be "marvell,mv64360-mdio"
 
    Example:
@@ -87,7 +86,6 @@ prefixed with the string "marvell,", for Marvell Technology Group Ltd.
      mdio {
 	     #address-cells = <1>;
 	     #size-cells = <0>;
-	     device_type = "mdio";
 	     compatible = "marvell,mv64360-mdio";
 
 	     ethernet-phy@0 {
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
index 0e4269446580..38cc6c9849ec 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
@@ -33,7 +33,6 @@ fsl,mdc-pin : pin of port C controlling mdio clock
 
 Example:
 	mdio@10d40 {
-		device_type = "mdio";
 		compatible = "fsl,mpc8272ads-mdio-bitbang",
 			     "fsl,mpc8272-mdio-bitbang",
 			     "fsl,cpm2-mdio-bitbang";
diff --git a/arch/powerpc/boot/dts/ep8248e.dts b/arch/powerpc/boot/dts/ep8248e.dts
index 244934fa2419..8b3a49f34f5a 100644
--- a/arch/powerpc/boot/dts/ep8248e.dts
+++ b/arch/powerpc/boot/dts/ep8248e.dts
@@ -67,7 +67,6 @@
 			ranges;
 
 			mdio {
-				device_type = "mdio";
 				compatible = "fsl,ep8248e-mdio-bitbang";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/powerpc/boot/dts/holly.dts b/arch/powerpc/boot/dts/holly.dts
index c6e11ebecebb..43e6f0c8e449 100644
--- a/arch/powerpc/boot/dts/holly.dts
+++ b/arch/powerpc/boot/dts/holly.dts
@@ -58,7 +58,6 @@
 		};
 
 		MDIO: mdio@6000 {
-			device_type = "mdio";
 			compatible = "tsi109-mdio", "tsi108-mdio";
 			reg = <0x00006000 0x00000050>;
 			#address-cells = <1>;
diff --git a/arch/powerpc/boot/dts/mpc7448hpc2.dts b/arch/powerpc/boot/dts/mpc7448hpc2.dts
index 2544f3ecd6e9..20a0d22df473 100644
--- a/arch/powerpc/boot/dts/mpc7448hpc2.dts
+++ b/arch/powerpc/boot/dts/mpc7448hpc2.dts
@@ -68,7 +68,6 @@
 		};
 
 		MDIO: mdio@6000 {
-			device_type = "mdio";
 			compatible = "tsi108-mdio";
 			reg = <0x6000 0x50>;
 			#address-cells = <1>;
diff --git a/arch/powerpc/boot/dts/mpc8272ads.dts b/arch/powerpc/boot/dts/mpc8272ads.dts
index 0c92de74d065..6d2cddf64cfd 100644
--- a/arch/powerpc/boot/dts/mpc8272ads.dts
+++ b/arch/powerpc/boot/dts/mpc8272ads.dts
@@ -182,7 +182,6 @@
 			};
 
 			mdio@10d40 {
-				device_type = "mdio";
 				compatible = "fsl,mpc8272ads-mdio-bitbang",
 				             "fsl,mpc8272-mdio-bitbang",
 				             "fsl,cpm2-mdio-bitbang";
diff --git a/arch/powerpc/boot/dts/pq2fads.dts b/arch/powerpc/boot/dts/pq2fads.dts
index 9d065cdeb5eb..0c525ff0c257 100644
--- a/arch/powerpc/boot/dts/pq2fads.dts
+++ b/arch/powerpc/boot/dts/pq2fads.dts
@@ -198,7 +198,6 @@
 			};
 
 			mdio@10d40 {
-				device_type = "mdio";
 				compatible = "fsl,pq2fads-mdio-bitbang",
 				             "fsl,mpc8280-mdio-bitbang",
 				             "fsl,cpm2-mdio-bitbang";
diff --git a/arch/powerpc/boot/dts/prpmc2800.dts b/arch/powerpc/boot/dts/prpmc2800.dts
index 909e8b0ead26..77c8db238d1c 100644
--- a/arch/powerpc/boot/dts/prpmc2800.dts
+++ b/arch/powerpc/boot/dts/prpmc2800.dts
@@ -73,7 +73,6 @@
 		mdio {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			device_type = "mdio";
 			compatible = "marvell,mv64360-mdio";
 			PHY0: ethernet-phy@1 {
 				compatible = "broadcom,bcm5421";
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
