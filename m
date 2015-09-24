From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: dts: move aliases back to .dts in Cygnus
Date: Thu, 24 Sep 2015 15:21:23 -0700
Message-ID: <1443133283-29025-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move aliases from bcm-cygnus.dtsi back to individual .dts files. Also
clean up the chosen node to have the stdout-path using the proper alias

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 4 ----
 arch/arm/boot/dts/bcm911360k.dts  | 7 +++++--
 arch/arm/boot/dts/bcm958300k.dts  | 7 +++++--
 arch/arm/boot/dts/bcm958305k.dts  | 7 +++++--
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index b5f9f34..2778533 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -41,10 +41,6 @@
 	model = "Broadcom Cygnus SoC";
 	interrupt-parent = <&gic>;
 
-	aliases {
-		serial0 = &uart3;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/bcm911360k.dts b/arch/arm/boot/dts/bcm911360k.dts
index 814011c..091c73a 100644
--- a/arch/arm/boot/dts/bcm911360k.dts
+++ b/arch/arm/boot/dts/bcm911360k.dts
@@ -38,9 +38,12 @@
 	model = "Cygnus SVK (BCM911360K)";
 	compatible = "brcm,bcm11360", "brcm,cygnus";
 
+	aliases {
+		serial0 = &uart3;
+	};
+
 	chosen {
-		stdout-path = &uart3;
-		bootargs = "console=ttyS0,115200";
+		stdout-path = "serial0:115200n8";
 	};
 };
 
diff --git a/arch/arm/boot/dts/bcm958300k.dts b/arch/arm/boot/dts/bcm958300k.dts
index 2e31581..b4a1392 100644
--- a/arch/arm/boot/dts/bcm958300k.dts
+++ b/arch/arm/boot/dts/bcm958300k.dts
@@ -39,9 +39,12 @@
 	model = "Cygnus SVK (BCM958300K)";
 	compatible = "brcm,bcm58300", "brcm,cygnus";
 
+	aliases {
+		serial0 = &uart3;
+	};
+
 	chosen {
-		stdout-path = &uart3;
-		bootargs = "console=ttyS0,115200";
+		stdout-path = "serial0:115200n8";
 	};
 };
 
diff --git a/arch/arm/boot/dts/bcm958305k.dts b/arch/arm/boot/dts/bcm958305k.dts
index 288a637..3378683 100644
--- a/arch/arm/boot/dts/bcm958305k.dts
+++ b/arch/arm/boot/dts/bcm958305k.dts
@@ -39,9 +39,12 @@
 	model = "Cygnus Wireless Audio (BCM958305K)";
 	compatible = "brcm,bcm58305", "brcm,cygnus";
 
+	aliases {
+		serial0 = &uart3;
+	};
+
 	chosen {
-		stdout-path = &uart3;
-		bootargs = "console=ttyS0,115200";
+		stdout-path = "serial0:115200n8";
 	};
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
