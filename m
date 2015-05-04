From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 5/6] ARM: shmobile: r8a7740: Remove mapping of L2 cache controller registers
Date: Mon,  4 May 2015 17:24:31 +0200
Message-ID: <1430753072-17145-6-git-send-email-geert+renesas@glider.be>
References: <1430753072-17145-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430753072-17145-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Now all r8a7740-based platforms have been migrated to the generic l2c OF
initialization, it's no longer needed to map the L2 cache controller
registers from .map_io().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - No changes.
---
 arch/arm/mach-shmobile/setup-r8a7740.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7740.c b/arch/arm/mach-shmobile/setup-r8a7740.c
index 5dbb40d5c56b6495..3d8a8cfee9a62c6c 100644
--- a/arch/arm/mach-shmobile/setup-r8a7740.c
+++ b/arch/arm/mach-shmobile/setup-r8a7740.c
@@ -51,18 +51,6 @@ static struct map_desc r8a7740_io_desc[] __initdata = {
 		.length		= 160 << 20,
 		.type		= MT_DEVICE_NONSHARED
 	},
-#ifdef CONFIG_CACHE_L2X0
-	/*
-	 * for l2x0_init()
-	 * 0xf0100000-0xf0101000 -> 0xf0002000-0xf0003000
-	 */
-	{
-		.virtual	= 0xf0002000,
-		.pfn		= __phys_to_pfn(0xf0100000),
-		.length		= PAGE_SIZE,
-		.type		= MT_DEVICE_NONSHARED
-	},
-#endif
 };
 
 void __init r8a7740_map_io(void)
-- 
1.9.1

