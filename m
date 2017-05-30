From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 4/4] ARM: dts: at91: Add the NOR flash available on sama5d3 dev kits
Date: Tue, 30 May 2017 11:20:54 +0200
Message-ID: <1496136054-12390-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1496136054-12390-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496136054-12390-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>, Antoine Aubert <a.aubert-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, info-inJ12LbcDfezQB+pC5nmwQ@public.gmane.org, Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

sama5d3 CPU modules embed a parallel NOR flash connected to the EBI bus.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sama5d3xcm.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3xcm.dtsi b/arch/arm/boot/dts/sama5d3xcm.dtsi
index 4606e1d7e6f2..9506daf5efb6 100644
--- a/arch/arm/boot/dts/sama5d3xcm.dtsi
+++ b/arch/arm/boot/dts/sama5d3xcm.dtsi
@@ -37,10 +37,33 @@
 		};
 
 		ebi@10000000 {
-			pinctrl-0 = <&pinctrl_ebi_nand_addr>;
-			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ebi_addr &pinctrl_ebi_cs0>;
+			pinctr-name = "default";
 			status = "okay";
 
+			nor: flash@0,0 {
+				compatible = "cfi-flash";
+				linux,mtd-name = "physmap-flash.0";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0x0 0x0 0x1000000>;
+				bank-width = <2>;
+				atmel,smc-read-mode = "nrd";
+				atmel,smc-write-mode = "nwe";
+				atmel,smc-bus-width = <16>;
+				atmel,smc-ncs-rd-setup-ns = <0>;
+				atmel,smc-ncs-wr-setup-ns = <0>;
+				atmel,smc-nwe-setup-ns = <8>;
+				atmel,smc-nrd-setup-ns = <16>;
+				atmel,smc-ncs-rd-pulse-ns = <84>;
+				atmel,smc-ncs-wr-pulse-ns = <84>;
+				atmel,smc-nrd-pulse-ns = <76>;
+				atmel,smc-nwe-pulse-ns = <76>;
+				atmel,smc-nrd-cycle-ns = <107>;
+				atmel,smc-nwe-cycle-ns = <84>;
+				atmel,smc-tdf-ns = <16>;
+			};
+
 			nand_controller: nand-controller {
 				status = "okay";
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
