From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 3/3] arm: dts: Add Altera L2 Cache and OCRAM EDAC
Date: Wed, 1 Oct 2014 11:31:32 -0500
Message-ID: <1412181092-27162-4-git-send-email-tthayer@opensource.altera.com>
References: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412181092-27162-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Adding the device tree entries needed to support the Altera L2
cache and OCRAM EDAC.

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 4d77ad6..f186957 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -608,7 +608,7 @@
 		};
 
 		L2: l2-cache@fffef000 {
-			compatible = "arm,pl310-cache";
+			compatible = "arm,pl310-cache", "syscon";
 			reg = <0xfffef000 0x1000>;
 			interrupts = <0 38 0x04>;
 			cache-unified;
@@ -628,6 +628,24 @@
 			clock-names = "biu", "ciu";
 		};
 
+		ocram: sram@ffff0000 {
+			compatible = "mmio-sram";
+			reg = <0xffff0000 0x10000>;
+		};
+
+		l2edac@xffd08140 {
+			compatible = "altr,l2-edac";
+			reg = <0xffd08140 0x4>;
+			interrupts = <0 36 1>, <0 37 1>;
+		};
+
+		ocramedac@ffd08144 {
+			compatible = "altr,ocram-edac";
+			reg = <0xffd08144 0x4>;
+			iram = <&ocram>;
+			interrupts = <0 178 1>, <0 179 1>;
+		};
+
 		/* Local timer */
 		timer@fffec600 {
 			compatible = "arm,cortex-a9-twd-timer";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
