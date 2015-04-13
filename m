From: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/6] arm64: hi6220: Document devicetree bindings for Hisilicon hi6220 SoC
Date: Mon, 13 Apr 2015 17:17:36 +0800
Message-ID: <1428916660-25910-3-git-send-email-bintian.wang@huawei.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428916660-25910-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the devicetree bindings used by the
DT files of Hisilicon hi6220 SoC mobile platform.

Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 35b1bd4..66ad65d 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -13,6 +13,9 @@ HiP01 ca9x2 Board
 Required root node properties:
 	- compatible = "hisilicon,hip01-ca9x2";
 
+HiKey Board
+Required root node properties:
+	- compatible = "hisilicon,hi6220-hikey";
 
 Hisilicon system controller
 
@@ -29,6 +32,10 @@ Optional properties:
 - resume-offset : offset in sysctrl for notifying cpu0 when resume
 - reboot-offset : offset in sysctrl for system reboot
 
+For some SoCs(e.g. Hi6220), many clock registers are defined under this
+controller, so "#clock-cells" is a required property for these SoCs and
+it should be set to 1.
+
 Example:
 
 	/* for Hi3620 */
@@ -40,6 +47,72 @@ Example:
 		reboot-offset = <0x4>;
 	};
 
+
+Hisilicon Power Always ON domain controller
+
+Hisilicon designs this system controller to control the power always
+on domain for mobile platform.
+
+Required properties:
+- compatible : "hisilicon,aoctrl"
+- reg : Register address and size
+
+For some SoCs(e.g. Hi6220), many clock registers are defined under this
+controller, so "#clock-cells" is a required property for these SoCs and
+it should be set to 1.
+
+Example:
+	/*for Hi6220*/
+	ao_ctrl: ao_ctrl {
+		compatible = "hisilicon,aoctrl", "syscon";
+		reg = <0x0 0xf7800000 0x0 0x2000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Media domain controller
+
+Hisilicon designs this system controller to control the multimedia
+domain(e.g. codec, G3D ...) for mobile platform.
+
+Required properties:
+- compatible : "hisilicon,mediactrl"
+- reg : Register address and size
+
+For some SoCs(e.g. Hi6220), many clock registers are defined under this
+controller, so "#clock-cells" is a required property for these SoCs and
+it should be set to 1.
+
+Example:
+	/*for Hi6220*/
+	media_ctrl: media_ctrl {
+		compatible = "hisilicon,mediactrl", "syscon";
+		reg = <0x0 0xf4410000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Power Management domain controller
+
+Hisilicon designs this system controller to control the power management
+domain for mobile platform.
+
+Required properties:
+- compatible : "hisilicon,pmctrl"
+- reg : Register address and size
+
+For some SoCs (e.g. Hi6220), many clock registers are defined under this
+controller, so "#clock-cells" is a required property for these SoCs and
+it should be set to 1.
+
+Example:
+	/*for Hi6220*/
+	pm_ctrl: pm_ctrl {
+		compatible = "hisilicon,pmctrl", "syscon";
+		reg = <0x0 0xf7032000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 -----------------------------------------------------------------------
 Hisilicon HiP01 system controller
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
