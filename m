From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v6 4/6] ARM: vf610: enable NAND Flash Controller
Date: Fri, 19 Jun 2015 00:58:37 +0200
Message-ID: <1434668319-6651-5-git-send-email-stefan@agner.ch>
References: <1434668319-6651-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434668319-6651-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com
Cc: sebastian@breakpoint.cc, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawn.guo@linaro.org, kernel@pengutronix.de, boris.brezillon@free-electrons.com, marb@ixxat.de, aaron@tastycactus.com, bpringlemeir@gmail.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Enable the NAND Flash Controller driver which is part of the Vybrid
SoC by default.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 3a3d3e9..9358135 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -589,6 +589,7 @@ config SOC_VF610
 	select PINCTRL_VF610
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select SMP_ON_UP if SMP
+	select HAVE_NAND_VF610_NFC
 
 	help
 	  This enables support for Freescale Vybrid VF610 processor.
-- 
2.4.2
