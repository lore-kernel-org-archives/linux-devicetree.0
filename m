From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/3] ARM: clps711x: Reduce static map size
Date: Fri, 13 May 2016 14:26:26 +0300
Message-ID: <1463138788-5390-2-git-send-email-shc_work@mail.ru>
References: <1463138788-5390-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1463138788-5390-1-git-send-email-shc_work@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Last CLPS711X CPU register is PLLR has 0xa5a8 address, so we can reduce
the map to 48k and align the end of the static at VMALLOC_START.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/include/debug/clps711x.S              | 4 ++--
 arch/arm/mach-clps711x/common.c                | 6 +++---
 arch/arm/mach-clps711x/include/mach/hardware.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/debug/clps711x.S b/arch/arm/include/debug/clps711x.S
index abe2254..c17ac5c 100644
--- a/arch/arm/include/debug/clps711x.S
+++ b/arch/arm/include/debug/clps711x.S
@@ -9,10 +9,10 @@
 
 #ifndef CONFIG_DEBUG_CLPS711X_UART2
 #define CLPS711X_UART_PADDR	(0x80000000 + 0x0000)
-#define CLPS711X_UART_VADDR	(0xfeff0000 + 0x0000)
+#define CLPS711X_UART_VADDR	(0xfeff4000 + 0x0000)
 #else
 #define CLPS711X_UART_PADDR	(0x80000000 + 0x1000)
-#define CLPS711X_UART_VADDR	(0xfeff0000 + 0x1000)
+#define CLPS711X_UART_VADDR	(0xfeff4000 + 0x1000)
 #endif
 
 #define SYSFLG		(0x0140)
diff --git a/arch/arm/mach-clps711x/common.c b/arch/arm/mach-clps711x/common.c
index 671acc5a..bf62211 100644
--- a/arch/arm/mach-clps711x/common.c
+++ b/arch/arm/mach-clps711x/common.c
@@ -37,9 +37,9 @@ static struct map_desc clps711x_io_desc[] __initdata = {
 	{
 		.virtual	= (unsigned long)CLPS711X_VIRT_BASE,
 		.pfn		= __phys_to_pfn(CLPS711X_PHYS_BASE),
-		.length		= SZ_64K,
-		.type		= MT_DEVICE
-	}
+		.length		= 48 * SZ_1K,
+		.type		= MT_DEVICE,
+	},
 };
 
 void __init clps711x_map_io(void)
diff --git a/arch/arm/mach-clps711x/include/mach/hardware.h b/arch/arm/mach-clps711x/include/mach/hardware.h
index 833129c..cfd0e2c 100644
--- a/arch/arm/mach-clps711x/include/mach/hardware.h
+++ b/arch/arm/mach-clps711x/include/mach/hardware.h
@@ -24,7 +24,7 @@
 
 #include <mach/clps711x.h>
 
-#define CLPS711X_VIRT_BASE	IOMEM(0xfeff0000)
+#define CLPS711X_VIRT_BASE	IOMEM(0xfeff4000)
 
 #ifndef __ASSEMBLY__
 #define clps_readb(off)		readb(CLPS711X_VIRT_BASE + (off))
-- 
2.4.9
