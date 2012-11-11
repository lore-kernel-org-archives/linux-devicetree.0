From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 09/14] ARM: SPEAr1310: Move 1310 specific misc register into
 machine specific files
Date: Sun, 11 Nov 2012 10:09:31 +0530
Message-ID: <41aec518c8f13be929be680268552ef5d9857901.1352608333.git.viresh.kumar@linaro.org>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1352608333.git.viresh.kumar@linaro.org>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Vipul Kumar Samar <vipulkumar.samar@st.com>

This patch moves some global macro definitions to the files where they are used.
Its a step towards removing spear.h completely later on.

Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-spear13xx/include/mach/spear.h | 8 --------
 arch/arm/mach-spear13xx/spear1310.c          | 5 +++++
 drivers/clk/spear/spear1310_clock.c          | 1 +
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-spear13xx/include/mach/spear.h b/arch/arm/mach-spear13xx/include/mach/spear.h
index 07d90ac..7cfa681 100644
--- a/arch/arm/mach-spear13xx/include/mach/spear.h
+++ b/arch/arm/mach-spear13xx/include/mach/spear.h
@@ -47,14 +47,6 @@
 #define DMAC1_BASE				UL(0xEB000000)
 #define MCIF_CF_BASE				UL(0xB2800000)
 
-/* Devices present in SPEAr1310 */
-#ifdef CONFIG_MACH_SPEAR1310
-#define SPEAR1310_RAS_GRP1_BASE			UL(0xD8000000)
-#define VA_SPEAR1310_RAS_GRP1_BASE		UL(0xFA000000)
-#define SPEAR1310_RAS_BASE			UL(0xD8400000)
-#define VA_SPEAR1310_RAS_BASE			IOMEM(UL(0xFA400000))
-#endif /* CONFIG_MACH_SPEAR1310 */
-
 /* Debug uart for linux, will be used for debug and uncompress messages */
 #define SPEAR_DBG_UART_BASE			UART_BASE
 #define VA_SPEAR_DBG_UART_BASE			VA_UART_BASE
diff --git a/arch/arm/mach-spear13xx/spear1310.c b/arch/arm/mach-spear13xx/spear1310.c
index 9fbbfc5..593a756 100644
--- a/arch/arm/mach-spear13xx/spear1310.c
+++ b/arch/arm/mach-spear13xx/spear1310.c
@@ -27,6 +27,11 @@
 #define SPEAR1310_SATA1_BASE			UL(0xB1800000)
 #define SPEAR1310_SATA2_BASE			UL(0xB4000000)
 
+#define SPEAR1310_RAS_GRP1_BASE			UL(0xD8000000)
+#define VA_SPEAR1310_RAS_GRP1_BASE		UL(0xFA000000)
+#define SPEAR1310_RAS_BASE			UL(0xD8400000)
+#define VA_SPEAR1310_RAS_BASE			IOMEM(UL(0xFA400000))
+
 /* ssp device registration */
 static struct pl022_ssp_controller ssp1_plat_data = {
 	.bus_id = 0,
diff --git a/drivers/clk/spear/spear1310_clock.c b/drivers/clk/spear/spear1310_clock.c
index 0fcec2a..cf7e176 100644
--- a/drivers/clk/spear/spear1310_clock.c
+++ b/drivers/clk/spear/spear1310_clock.c
@@ -20,6 +20,7 @@
 #include <mach/spear.h>
 #include "clk.h"
 
+#define VA_SPEAR1310_RAS_BASE			IOMEM(UL(0xFA400000))
 /* PLL related registers and bit values */
 #define SPEAR1310_PLL_CFG			(VA_MISC_BASE + 0x210)
 	/* PLL_CFG bit values */
-- 
1.7.12.rc2.18.g61b472e
