From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2] ARM: zx296702-ad1: remove deprecated usage of mmc
Date: Thu, 21 Jan 2016 19:16:51 +0800
Message-ID: <1453375011-548-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

supports-highspeed property and slot are deprecated for dw_mmc,
this patch remove slot node and replace supports-highspeed with
cap-sd-highspeed and cap-mmc-highspeed.

Cc: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v2:
- remove slot suggested by Jaehoon

 arch/arm/boot/dts/zx296702-ad1.dts | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zx296702-ad1.dts b/arch/arm/boot/dts/zx296702-ad1.dts
index 081f980..c2ffa9d 100644
--- a/arch/arm/boot/dts/zx296702-ad1.dts
+++ b/arch/arm/boot/dts/zx296702-ad1.dts
@@ -19,28 +19,22 @@
 
 &mmc0 {
 	num-slots = <1>;
-	supports-highspeed;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
 	non-removable;
 	disable-wp;
 	status = "okay";
-
-	slot@0 {
-		reg = <0>;
-		bus-width = <4>;
-	};
 };
 
 &mmc1 {
 	num-slots = <1>;
-	supports-highspeed;
+	bus-width = <8>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
 	non-removable;
 	disable-wp;
 	status = "okay";
-
-	slot@0 {
-		reg = <0>;
-		bus-width = <8>;
-	};
 };
 
 &uart0 {
-- 
2.3.7


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
