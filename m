From: Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] Documentation: Binding docs for bcm11351 enable method
Date: Thu, 28 Apr 2016 10:59:57 -0700
Message-ID: <1461866399-1725-2-git-send-email-chris.brand@broadcom.com>
References: <1461866399-1725-1-git-send-email-chris.brand@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461866399-1725-1-git-send-email-chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?=20=22=08=08=22@lbrmn-lnxub?==?ISO-8859-1?Q?61.ric.broadcom.?=, =?ISO-8859-1?Q?com?=
List-Id: devicetree@vger.kernel.org

Commit 84320e1a635fcf90cff4185f029ce9e31bf1d4a7
("ARM: BCM: Clean up SMP support for Broadcom Kona") moved the
"secondary-boot-reg" property from the "cpus" node to the individual "cpu"
nodes but negelected to update brcm,bcm11351-cpu-method.txt to match.

bcm11351-cpu-method was apparently never added to the list of methods in
bindings/arm/cpus.txt.

bindings/arm/cpus.txt states that "enable-method" should be a property of
the "cpu" node rather than the "cpus" node.

This patch rectifies these two omissions and one inconsistency.

Signed-off-by: Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/arm/bcm/brcm,bcm11351-cpu-method.txt        | 6 +++---
 Documentation/devicetree/bindings/arm/cpus.txt                      | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351-cpu-method.txt
index 8240c023e202..e3f996920403 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351-cpu-method.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351-cpu-method.txt
@@ -5,7 +5,7 @@ CPUs in the following Broadcom SoCs:
   BCM11130, BCM11140, BCM11351, BCM28145, BCM28155, BCM21664
 
 The enable method is specified by defining the following required
-properties in the "cpus" device tree node:
+properties in the "cpu" device tree node:
   - enable-method = "brcm,bcm11351-cpu-method";
   - secondary-boot-reg = <...>;
 
@@ -19,8 +19,6 @@ Example:
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "brcm,bcm11351-cpu-method";
-		secondary-boot-reg = <0x3500417c>;
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -32,5 +30,7 @@ Example:
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
+			enable-method = "brcm,bcm11351-cpu-method";
+			secondary-boot-reg = <0x3500417c>;
 		};
 	};
diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index ccc62f145306..953350f085c9 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -194,6 +194,7 @@ nodes to be present and contain the properties described below.
 			    "allwinner,sun8i-a23"
 			    "arm,psci"
 			    "arm,realview-smp"
+			    "brcm,bcm11351-cpu-method"
 			    "brcm,bcm-nsp-smp"
 			    "brcm,brahma-b15"
 			    "marvell,armada-375-smp"
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
