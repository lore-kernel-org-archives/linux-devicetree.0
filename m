From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 5/6] ARM: dts: rockchip: add reboot mode node
Date: Mon, 21 Dec 2015 19:42:29 +0800
Message-ID: <1450698149-30260-1-git-send-email-andy.yan@rock-chips.com>
References: <1450697249-29994-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450697249-29994-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add reboot mode driver DT node for rk3xxx,rk3288 platform

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rk3288.dtsi                | 25 +++++++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                | 26 ++++++++++++++++++++++++
 include/dt-bindings/soc/rockchip_boot-mode.h | 30 ++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 include/dt-bindings/soc/rockchip_boot-mode.h

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 04ea209..937ba4c 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -170,6 +170,31 @@
 		};
 	};
 
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmu>;
+		offset = <0x94>;
+		loader {
+			linux,mode = "loader";
+			linux,magic = <0x5242C301>;
+		};
+
+		maskrom {
+			linux,mode = "maskrom";
+			linux,magic = <0x5242C302>;
+		};
+
+		recovery {
+			linux,mode = "recovery";
+			linux,magic = <0x5242C303>;
+		};
+
+		fastboot {
+			linux,mode = "fastboot";
+			linux,magic = <0x5242C309>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 4497d28..735eef4 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -43,6 +43,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/rockchip_boot-mode.h>
 #include "skeleton.dtsi"
 
 / {
@@ -103,6 +104,31 @@
 		};
 	};
 
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmu>;
+		offset = <0x40>;
+		loader {
+			linux,mode = "loader";
+			linux,magic = <BOOT_LOADER>;
+		};
+
+		maskrom {
+			linux,mode = "maskrom";
+			linux,magic = <BOOT_MASKROM>;
+		};
+
+		recovery {
+			linux,mode = "recovery";
+			linux,magic = <BOOT_RECOVERY>;
+		};
+
+		fastboot {
+			linux,mode = "fastboot";
+			linux,magic = <BOOT_FASTBOOT>;
+		};
+	};
+
 	xin24m: oscillator {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
diff --git a/include/dt-bindings/soc/rockchip_boot-mode.h b/include/dt-bindings/soc/rockchip_boot-mode.h
new file mode 100644
index 0000000..129edf8
--- /dev/null
+++ b/include/dt-bindings/soc/rockchip_boot-mode.h
@@ -0,0 +1,30 @@
+#ifndef __ROCKCHIP_BOOT_MODE_H
+#define __ROCKCHIP_BOOT_MODE_H
+
+/*high 24 bits is tag, low 8 bits is type*/
+#define	REBOOT_FLAG		0x5242C300
+/* normal boot */
+#define	BOOT_NORMAL		(REBOOT_FLAG + 0)
+/* enter loader rockusb mode */
+#define	BOOT_LOADER		(REBOOT_FLAG + 1)
+/* enter maskrom rockusb mode */
+#define	BOOT_MASKROM		(REBOOT_FLAG + 2)
+/* enter recovery */
+#define	BOOT_RECOVERY		(REBOOT_FLAG + 3)
+/* do not enter recover */
+#define	BOOT_NORECOVER		(REBOOT_FLAG + 4)
+/* boot second OS*/
+#define	BOOT_SECONDOS		(REBOOT_FLAG + 5)
+/* enter recover and wipe data. */
+#define	BOOT_WIPEDATA		(REBOOT_FLAG + 6)
+/* enter recover and wipe all data. */
+#define	BOOT_WIPEALL		(REBOOT_FLAG + 7)
+/* check firmware img with backup part*/
+#define	BOOT_CHECKIMG		(REBOOT_FLAG + 8)
+ /* enter fast boot mode */
+#define	BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+#define	BOOT_SECUREBOOT_DISABLE	(REBOOT_FLAG + 10)
+/* enter charge mode */
+#define	BOOT_CHARGING		(REBOOT_FLAG + 11)
+
+#endif
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
