From: ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH] dts: tiny4412 add support for eMMC
Date: Sat, 12 Jul 2014 23:53:35 +0800
Message-ID: <1405180415-8556-2-git-send-email-ayaka@soulik.info>
References: <1405180415-8556-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405180415-8556-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch would enable the support for eMMC of tiny4412
core board, I have tested it on tiny4412 stanard board.
---
 arch/arm/boot/dts/exynos4412-tiny4412.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index ea6929d..79a7567 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -63,6 +63,27 @@
 		status = "okay";
 	};
 
+	mmc@12550000 {
+		status = "okay";
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
+		non-removable;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-sdr-timing = <1 1>;
+		samsung,dw-mshc-ddr-timing = <1 1>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+			gpios = <&gpk0 1 3 0 2>, <&gpk0 0 3 0 2>,
+				<&gpk1 3 4 3 2>, <&gpk1 4 4 3 2>,
+				<&gpk1 5 4 3 2>, <&gpk1 6 4 3 2>,
+				<&gpk0 3 3 3 2>, <&gpk0 4 3 3 2>,
+				<&gpk0 5 3 3 2>, <&gpk0 6 3 3 2>;
+		};
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
