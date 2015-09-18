From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/9] ARM: dts: consolidate aliases for Cygnus dt files
Date: Fri, 18 Sep 2015 14:24:06 -0700
Message-ID: <1442611454-16331-2-git-send-email-rjui@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442611454-16331-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move aliases into bcm-cygnus.dtsi to avoid duplications in Cygnus dts
files

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi      | 4 ++++
 arch/arm/boot/dts/bcm911360_entphn.dts | 4 ----
 arch/arm/boot/dts/bcm911360k.dts       | 4 ----
 arch/arm/boot/dts/bcm958300k.dts       | 4 ----
 arch/arm/boot/dts/bcm958305k.dts       | 4 ----
 5 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index e1ac07a..30903ba 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -40,6 +40,10 @@
 	model = "Broadcom Cygnus SoC";
 	interrupt-parent = <&gic>;
 
+	aliases {
+		serial0 = &uart3;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/bcm911360_entphn.dts b/arch/arm/boot/dts/bcm911360_entphn.dts
index 7db4843..0e1320e 100644
--- a/arch/arm/boot/dts/bcm911360_entphn.dts
+++ b/arch/arm/boot/dts/bcm911360_entphn.dts
@@ -39,10 +39,6 @@
 	model = "Cygnus Enterprise Phone (BCM911360_ENTPHN)";
 	compatible = "brcm,bcm11360", "brcm,cygnus";
 
-	aliases {
-		serial0 = &uart3;
-	};
-
 	chosen {
 		stdout-path = &uart3;
 		bootargs = "console=ttyS0,115200";
diff --git a/arch/arm/boot/dts/bcm911360k.dts b/arch/arm/boot/dts/bcm911360k.dts
index 9658d4f..2af40c6 100644
--- a/arch/arm/boot/dts/bcm911360k.dts
+++ b/arch/arm/boot/dts/bcm911360k.dts
@@ -38,10 +38,6 @@
 	model = "Cygnus SVK (BCM911360K)";
 	compatible = "brcm,bcm11360", "brcm,cygnus";
 
-	aliases {
-		serial0 = &uart3;
-	};
-
 	chosen {
 		stdout-path = &uart3;
 		bootargs = "console=ttyS0,115200";
diff --git a/arch/arm/boot/dts/bcm958300k.dts b/arch/arm/boot/dts/bcm958300k.dts
index 2f63052..75e50f0 100644
--- a/arch/arm/boot/dts/bcm958300k.dts
+++ b/arch/arm/boot/dts/bcm958300k.dts
@@ -38,10 +38,6 @@
 	model = "Cygnus SVK (BCM958300K)";
 	compatible = "brcm,bcm58300", "brcm,cygnus";
 
-	aliases {
-		serial0 = &uart3;
-	};
-
 	chosen {
 		stdout-path = &uart3;
 		bootargs = "console=ttyS0,115200";
diff --git a/arch/arm/boot/dts/bcm958305k.dts b/arch/arm/boot/dts/bcm958305k.dts
index 56b429a..bf62e1b 100644
--- a/arch/arm/boot/dts/bcm958305k.dts
+++ b/arch/arm/boot/dts/bcm958305k.dts
@@ -38,10 +38,6 @@
 	model = "Cygnus Wireless Audio (BCM958305K)";
 	compatible = "brcm,bcm58305", "brcm,cygnus";
 
-	aliases {
-		serial0 = &uart3;
-	};
-
 	chosen {
 		stdout-path = &uart3;
 		bootargs = "console=ttyS0,115200";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
