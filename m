From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/3] ARM: dts: atlas7: use general dt-binding for hwspinlock
Date: Tue, 26 May 2015 08:28:31 +0000
Message-ID: <1432628911-18555-3-git-send-email-21cnbao@gmail.com>
References: <1432628911-18555-1-git-send-email-21cnbao@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432628911-18555-1-git-send-email-21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: workgroup.linux-kQvG35nSl+M@public.gmane.org, Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>

This patch moves to use generic dt-binding for hwspinlock providers and
clients.
add #hwlock-cells for the provider and hwlocks for clients.

Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Signed-off-by: Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>
Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
---
 arch/arm/boot/dts/atlas7.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/atlas7.dtsi b/arch/arm/boot/dts/atlas7.dtsi
index a753178..66d3f0e 100644
--- a/arch/arm/boot/dts/atlas7.dtsi
+++ b/arch/arm/boot/dts/atlas7.dtsi
@@ -84,17 +84,17 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			hwspinlock {
+			hwlock: hwspinlock {
 				compatible = "sirf,hwspinlock";
 				reg = <0x13240000 0x00010000>;
-
-				num-spinlocks = <30>;
+				#hwlock-cells = <1>;
 			};
 
 			ns_m3_rproc@0 {
 				compatible = "sirf,ns2m30-rproc";
 				reg = <0x13240000 0x00010000>;
 				interrupts = <0 123 0>;
+				hwlocks = <&hwlock 0>, <&hwlock 1>;
 			};
 
 			ns_m3_rproc@1 {
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
