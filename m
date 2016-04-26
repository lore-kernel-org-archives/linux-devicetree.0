From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: lpc32xx: phy3250: add NAND partitions device node
Date: Tue, 26 Apr 2016 03:37:29 +0300
Message-ID: <1461631050-10479-7-git-send-email-vz@mleia.com>
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
 arch/arm/boot/dts/phy3250.dts | 49 +++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
index c1a6e62..ca9870f 100644
--- a/arch/arm/boot/dts/phy3250.dts
+++ b/arch/arm/boot/dts/phy3250.dts
@@ -136,8 +136,6 @@
 
 /* 64MB Flash via SLC NAND controller */
 &slc {
-	#address-cells = <1>;
-	#size-cells = <1>;
 	status = "okay";
 
 	nxp,wdr-clks = <14>;
@@ -151,31 +149,36 @@
 	nand-on-flash-bbt;
 	gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
 
-	mtd0@00000000 {
-		label = "phy3250-boot";
-		reg = <0x00000000 0x00064000>;
-		read-only;
-	};
+	partitions {
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-	mtd1@00064000 {
-		label = "phy3250-uboot";
-		reg = <0x00064000 0x00190000>;
-		read-only;
-	};
+		mtd0@00000000 {
+			label = "phy3250-boot";
+			reg = <0x00000000 0x00064000>;
+			read-only;
+		};
 
-	mtd2@001f4000 {
-		label = "phy3250-ubt-prms";
-		reg = <0x001f4000 0x00010000>;
-	};
+		mtd1@00064000 {
+			label = "phy3250-uboot";
+			reg = <0x00064000 0x00190000>;
+			read-only;
+		};
 
-	mtd3@00204000 {
-		label = "phy3250-kernel";
-		reg = <0x00204000 0x00400000>;
-	};
+		mtd2@001f4000 {
+			label = "phy3250-ubt-prms";
+			reg = <0x001f4000 0x00010000>;
+		};
 
-	mtd4@00604000 {
-		label = "phy3250-rootfs";
-		reg = <0x00604000 0x039fc000>;
+		mtd3@00204000 {
+			label = "phy3250-kernel";
+			reg = <0x00204000 0x00400000>;
+		};
+
+		mtd4@00604000 {
+			label = "phy3250-rootfs";
+			reg = <0x00604000 0x039fc000>;
+		};
 	};
 };
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
