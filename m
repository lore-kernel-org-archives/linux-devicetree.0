From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/4] arm64: add Rockchip architecture entry
Date: Mon, 29 Jun 2015 14:31:54 +0200
Message-ID: <1507422.Ta3AHj4ijV@diego>
References: <3333434.ZKWQ6GxgtB@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3333434.ZKWQ6GxgtB@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The rk3368 is Rockchip's first ARM64 soc, build around 8 Cortex-A53 cores.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm64/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 290ed64..9af528a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -197,6 +197,16 @@ config ARCH_QCOM
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
+config ARCH_ROCKCHIP
+	bool "Rockchip Platforms"
+	select ARCH_HAS_RESET_CONTROLLER
+	select ARCH_REQUIRE_GPIOLIB
+	select PINCTRL
+	select PINCTRL_ROCKCHIP
+	help
+	  This enables support for the ARMv8 based Rockchip chipsets,
+	  like the RK3368.
+
 config ARCH_SEATTLE
 	bool "AMD Seattle SoC Family"
 	help
-- 
2.1.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
