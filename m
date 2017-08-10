From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/9] arm64: dts: hikey960: Add support for syscon-reboot-mode
Date: Thu, 10 Aug 2017 10:26:11 +0800
Message-ID: <20170810022615.19204-6-guodong.xu@linaro.org>
References: <20170810022615.19204-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810022615.19204-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support to hikey960 dts for the syscon-reboot-mode driver.

Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index b96d865..ce5e874 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -39,6 +39,20 @@
 		reg = <0x0 0x0 0x0 0x0>;
 	};
 
+	reboot-mode-syscon@32100000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0x32100000 0x0 0x00001000>;
+
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x0>;
+
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
+
 	keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
