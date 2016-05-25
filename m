From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 1/5] Documentation: dt: socfpga: Add interrupt-controller to ecc-manager
Date: Wed, 25 May 2016 11:29:39 -0500
Message-ID: <1464193783-5071-2-git-send-email-tthayer@opensource.altera.com>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464193783-5071-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Designate the ECC Manager as an interrupt controller and add child
interrupts.

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index 5a6b160..15eb0df 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -61,7 +61,9 @@ Required Properties:
 - #address-cells: must be 1
 - #size-cells: must be 1
 - interrupts : Should be single bit error interrupt, then double bit error
-	interrupt. Note the rising edge type.
+	interrupt.
+- interrupt-controller : boolean indicator that ECC Manager is an interrupt controller
+- #interrupt-cells : must be set to 2.
 - ranges : standard definition, should translate from local addresses
 
 Subcomponents:
@@ -70,11 +72,15 @@ L2 Cache ECC
 Required Properties:
 - compatible : Should be "altr,socfpga-a10-l2-ecc"
 - reg : Address and size for ECC error interrupt clear registers.
+- interrupts : Should be single bit error interrupt, then double bit error
+	interrupt, in this order.
 
 On-Chip RAM ECC
 Required Properties:
 - compatible : Should be "altr,socfpga-a10-ocram-ecc"
 - reg        : Address and size for ECC block registers.
+- interrupts : Should be single bit error interrupt, then double bit error
+	interrupt, in this order.
 
 Example:
 
@@ -85,15 +91,21 @@ Example:
 		#size-cells = <1>;
 		interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>,
 			     <0 0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		ranges;
 
 		l2-ecc@ffd06010 {
 			compatible = "altr,socfpga-a10-l2-ecc";
 			reg = <0xffd06010 0x4>;
+			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+				     <32 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		ocram-ecc@ff8c3000 {
 			compatible = "altr,socfpga-a10-ocram-ecc";
 			reg = <0xff8c3000 0x90>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>,
+				     <33 IRQ_TYPE_LEVEL_HIGH> ;
 		};
 	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
