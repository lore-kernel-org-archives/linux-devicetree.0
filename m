From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/7] ARM: dts: lpc32xx: ea3250: add NAND partitions device node
Date: Tue, 26 Apr 2016 03:37:25 +0300
Message-ID: <1461631050-10479-3-git-send-email-vz@mleia.com>
References: <1461631050-10479-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461631050-10479-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

To declare MTD OF partitions NAND controller device node should have
a special 'partitions' subnode, the change removes a debug message
from mtd/ofpart on boot:

  nxp_lpc3220_slc: 'partitions' subnode not found on /ahb/flash@20020000.
  Trying to parse direct subnodes as partitions.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/ea3250.dts | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/ea3250.dts b/arch/arm/boot/dts/ea3250.dts
index 7cf815a..58bcda9 100644
--- a/arch/arm/boot/dts/ea3250.dts
+++ b/arch/arm/boot/dts/ea3250.dts
@@ -213,8 +213,6 @@
 
 /* 128MB Flash via SLC NAND controller */
 &slc {
-	#address-cells = <1>;
-	#size-cells = <1>;
 	status = "okay";
 
 	nxp,wdr-clks = <14>;
@@ -228,26 +226,31 @@
 	nand-on-flash-bbt;
 	gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
 
-	mtd0@00000000 {
-		label = "ea3250-boot";
-		reg = <0x00000000 0x00080000>;
-		read-only;
-	};
+	partitions {
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-	mtd1@00080000 {
-		label = "ea3250-uboot";
-		reg = <0x00080000 0x000c0000>;
-		read-only;
-	};
+		mtd0@00000000 {
+			label = "ea3250-boot";
+			reg = <0x00000000 0x00080000>;
+			read-only;
+		};
 
-	mtd2@00140000 {
-		label = "ea3250-kernel";
-		reg = <0x00140000 0x00400000>;
-	};
+		mtd1@00080000 {
+			label = "ea3250-uboot";
+			reg = <0x00080000 0x000c0000>;
+			read-only;
+		};
 
-	mtd3@00540000 {
-		label = "ea3250-rootfs";
-		reg = <0x00540000 0x07ac0000>;
+		mtd2@00140000 {
+			label = "ea3250-kernel";
+			reg = <0x00140000 0x00400000>;
+		};
+
+		mtd3@00540000 {
+			label = "ea3250-rootfs";
+			reg = <0x00540000 0x07ac0000>;
+		};
 	};
 };
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
