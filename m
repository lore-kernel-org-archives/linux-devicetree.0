From: Karl Beldan <kbeldan@baylibre.com>
Subject: [PATCH 4/4] ARM: davinci_all_defconfig: Enable AEMIF as a module
Date: Tue,  9 Aug 2016 17:15:18 +0000
Message-ID: <20160809171518.22690-5-kbeldan@baylibre.com>
References: <20160809171518.22690-1-kbeldan@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160809171518.22690-1-kbeldan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Santosh Shilimkar <ssantosh@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@baylibre.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Karl Beldan <kbeldan@baylibre.com>
List-Id: devicetree@vger.kernel.org

This enables the use of the memory/ti-aemif.c driver.
ATM most davinci boards use the mach-davinci aemif code which gets in
the way of genericity and proper DT boot.

Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
---
 arch/arm/configs/davinci_all_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index d037d3d..2802897 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -192,6 +192,8 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_OMAP=m
 CONFIG_DMADEVICES=y
 CONFIG_TI_EDMA=y
+CONFIG_MEMORY=y
+CONFIG_TI_AEMIF=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_XFS_FS=m
-- 
2.9.2
