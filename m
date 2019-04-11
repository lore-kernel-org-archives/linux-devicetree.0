Return-Path: <SRS0=vThj=SN=flygoat.com=jiaxun.yang@kernel.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/6] MIPS: Loongson32: Remove ehci platform device
Date: Thu, 11 Apr 2019 20:19:10 +0800
Message-Id: <20190411121915.8040-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20190411121915.8040-1-jiaxun.yang@flygoat.com>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org, paul.burton@mips.com, robh+dt@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-ID: <devicetree@vger.kernel.org>

It's going to be enabled by DeviceTree

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson32/platform.h    |  1 -
 arch/mips/loongson32/common/platform.c        | 30 -------------------
 arch/mips/loongson32/ls1b/board.c             |  1 -
 3 files changed, 32 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
index 15d1de2300fe..f36c8d287b59 100644
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ b/arch/mips/include/asm/mach-loongson32/platform.h
@@ -19,7 +19,6 @@ extern struct platform_device ls1x_uart_pdev;
 extern struct platform_device ls1x_cpufreq_pdev;
 extern struct platform_device ls1x_eth0_pdev;
 extern struct platform_device ls1x_eth1_pdev;
-extern struct platform_device ls1x_ehci_pdev;
 extern struct platform_device ls1x_gpio0_pdev;
 extern struct platform_device ls1x_gpio1_pdev;
 extern struct platform_device ls1x_rtc_pdev;
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 0bf355c8bcb2..4b35f49e9fcb 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -10,12 +10,10 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/mtd/partitions.h>
 #include <linux/sizes.h>
 #include <linux/phy.h>
 #include <linux/serial_8250.h>
 #include <linux/stmmac.h>
-#include <linux/usb/ehci_pdriver.h>
 
 #include <platform.h>
 #include <loongson1.h>
@@ -255,34 +253,6 @@ struct platform_device ls1x_gpio1_pdev = {
 	.resource	= ls1x_gpio1_resources,
 };
 
-/* USB EHCI */
-static u64 ls1x_ehci_dmamask = DMA_BIT_MASK(32);
-
-static struct resource ls1x_ehci_resources[] = {
-	[0] = {
-		.start	= LS1X_EHCI_BASE,
-		.end	= LS1X_EHCI_BASE + SZ_32K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= LS1X_EHCI_IRQ,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-static struct usb_ehci_pdata ls1x_ehci_pdata = {
-};
-
-struct platform_device ls1x_ehci_pdev = {
-	.name		= "ehci-platform",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(ls1x_ehci_resources),
-	.resource	= ls1x_ehci_resources,
-	.dev		= {
-		.dma_mask = &ls1x_ehci_dmamask,
-		.platform_data = &ls1x_ehci_pdata,
-	},
-};
 
 /* Real Time Clock */
 void __init ls1x_rtc_set_extclk(struct platform_device *pdev)
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 447b15fc0a2b..74f7b530d9b1 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -42,7 +42,6 @@ static struct platform_device *ls1b_platform_devices[] __initdata = {
 	&ls1x_cpufreq_pdev,
 	&ls1x_eth0_pdev,
 	&ls1x_eth1_pdev,
-	&ls1x_ehci_pdev,
 	&ls1x_gpio0_pdev,
 	&ls1x_gpio1_pdev,
 	&ls1x_rtc_pdev,
-- 
2.21.0
