From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/13] ARM: dts: armada-385-linksys: drop redundant properties in dependants
Date: Sun, 21 May 2017 14:48:53 +0200
Message-ID: <20170521124903.11050-5-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Drop redundant declaration of #address-cells and #size-cells.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/armada-385-linksys-caiman.dts | 3 ---
 arch/arm/boot/dts/armada-385-linksys-cobra.dts  | 3 ---
 arch/arm/boot/dts/armada-385-linksys-shelby.dts | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys-caiman.dts b/arch/arm/boot/dts/armada-385-linksys-caiman.dts
index 765c939..05e854a 100644
--- a/arch/arm/boot/dts/armada-385-linksys-caiman.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-caiman.dts
@@ -47,9 +47,6 @@
 };
 
 &expander0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	wan_amber@0 {
 		label = "caiman:amber:wan";
 		reg = <0x0>;
diff --git a/arch/arm/boot/dts/armada-385-linksys-cobra.dts b/arch/arm/boot/dts/armada-385-linksys-cobra.dts
index 2ae1e71..5b1662b 100644
--- a/arch/arm/boot/dts/armada-385-linksys-cobra.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-cobra.dts
@@ -47,9 +47,6 @@
 };
 
 &expander0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	wan_amber@0 {
 		label = "cobra:amber:wan";
 		reg = <0x0>;
diff --git a/arch/arm/boot/dts/armada-385-linksys-shelby.dts b/arch/arm/boot/dts/armada-385-linksys-shelby.dts
index 74f4273..a909371 100644
--- a/arch/arm/boot/dts/armada-385-linksys-shelby.dts
+++ b/arch/arm/boot/dts/armada-385-linksys-shelby.dts
@@ -47,9 +47,6 @@
 };
 
 &expander0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	wan_amber@0 {
 		label = "shelby:amber:wan";
 		reg = <0x0>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
