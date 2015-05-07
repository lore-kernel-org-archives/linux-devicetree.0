From: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 2/6] arm64: hi6220: Document devicetree bindings for Hisilicon hi6220 SoC
Date: Thu, 7 May 2015 22:00:21 +0800
Message-ID: <1431007225-8513-3-git-send-email-bintian.wang@huawei.com>
References: <1431007225-8513-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431007225-8513-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the devicetree bindings used by the
DT files of Hisilicon hi6220 SoC mobile platform.

Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           |   87 ++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 35b1bd4..f67d0f3 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -1,5 +1,8 @@
 Hisilicon Platforms Device Tree Bindings
 ----------------------------------------------------
+Hi6220 SoC
+Required root node properties:
+	- compatible = "hisilicon,hi6220";
 
 Hi4511 Board
 Required root node properties:
@@ -13,6 +16,9 @@ HiP01 ca9x2 Board
 Required root node properties:
 	- compatible = "hisilicon,hip01-ca9x2";
 
+HiKey Board
+Required root node properties:
+	- compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
 
 Hisilicon system controller
 
@@ -41,6 +47,87 @@ Example:
 	};
 
 -----------------------------------------------------------------------
+Hisilicon Hi6220 system controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-sysctrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, many clock registers are defined
+  under this controller and this property must be present.
+
+Hisilicon designs this controller as one of the system controllers,
+its main functions are the same as Hisilicon system controller, but
+the register offset of some core modules are different.
+
+Example:
+	/*for Hi6220*/
+	sys_ctrl: sys_ctrl {
+		compatible = "hisilicon,hi6220-sysctrl", "syscon";
+		reg = <0x0 0xf7030000 0x0 0x2000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Hi6220 Power Always ON domain controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-aoctrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, many clock registers are defined
+  under this controller and this property must be present.
+
+Hisilicon designs this system controller to control the power always
+on domain for mobile platform.
+
+Example:
+	/*for Hi6220*/
+	ao_ctrl: ao_ctrl {
+		compatible = "hisilicon,hi6220-aoctrl", "syscon";
+		reg = <0x0 0xf7800000 0x0 0x2000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Hi6220 Media domain controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-mediactrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, many clock registers are defined
+  under this controller and this property must be present.
+
+Hisilicon designs this system controller to control the multimedia
+domain(e.g. codec, G3D ...) for mobile platform.
+
+Example:
+	/*for Hi6220*/
+	media_ctrl: media_ctrl {
+		compatible = "hisilicon,hi6220-mediactrl", "syscon";
+		reg = <0x0 0xf4410000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Hi6220 Power Management domain controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-pmctrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, some clock registers are define
+  under this controller and this property must be present.
+
+Hisilicon designs this system controller to control the power management
+domain for mobile platform.
+
+Example:
+	/*for Hi6220*/
+	pm_ctrl: pm_ctrl {
+		compatible = "hisilicon,hi6220-pmctrl", "syscon";
+		reg = <0x0 0xf7032000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+-----------------------------------------------------------------------
 Hisilicon HiP01 system controller
 
 Required properties:
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
