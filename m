From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 4/4] ARM: at91: move sam9n12 SoC to the CCF
Date: Mon, 12 May 2014 18:26:30 +0200
Message-ID: <1399911990-5086-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1399911990-5086-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399911990-5086-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Bo Shen <voice.shen@atmel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

This patch removes the selection of AT91_USE_OLD_CLK when selecting
sam9n12 SoC support. This will automatically enable COMMON_CLK_AT91 option
and add support for at91 common clk implementation.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
Tested-by: Bo Shen <voice.shen@atmel.com>
---
 arch/arm/mach-at91/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index b2d2cf4..a1ac430 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -183,7 +183,6 @@ config SOC_AT91SAM9N12
 	select HAVE_AT91_DBGU0
 	select HAVE_FB_ATMEL
 	select SOC_AT91SAM9
-	select AT91_USE_OLD_CLK
 	select HAVE_AT91_USB_CLK
 	help
 	  Select this if you are using Atmel's AT91SAM9N12 SoC.
-- 
1.8.3.2
