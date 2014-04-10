From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 5/5] ARM: sunxi: update the default ARCH_NR_GPIO for sunxi arch
Date: Thu, 10 Apr 2014 14:25:47 +0200
Message-ID: <1397132747-13917-6-git-send-email-boris.brezillon@free-electrons.com>
References: <1397132747-13917-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397132747-13917-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The A31 SoC has PL and PM banks, we thus need to increase the default
ARCH_NR_GPIO when building for the sunxi architecture.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 503da0a..fe915ea 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1628,9 +1628,9 @@ config ARCH_NR_GPIO
 	int
 	default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
 	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX
+	default 416 if ARCH_SUNXI
 	default 392 if ARCH_U8500
 	default 352 if ARCH_VT8500
-	default 288 if ARCH_SUNXI
 	default 264 if MACH_H4700
 	default 0
 	help
-- 
1.8.3.2

