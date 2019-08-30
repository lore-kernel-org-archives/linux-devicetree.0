From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 08/16] ARM: mmp: map the PGU as well
Date: Sat, 31 Aug 2019 00:07:35 +0200
Message-ID: <20190830220743.439670-9-lkundrak@v3.sk>
References: <20190830220743.439670-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830220743.439670-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "To : Olof Johansson" <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, "Cc : Rob Herring" <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The MMP2 and later includes a system control unit in this area. We'll need
that to initialize the secondary core on MMP3.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/mach-mmp/addr-map.h |  7 +++++++
 arch/arm/mach-mmp/common.c   | 15 +++++++++++++++
 arch/arm/mach-mmp/common.h   |  1 +
 arch/arm/mach-mmp/mmp2-dt.c  |  2 +-
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mmp/addr-map.h b/arch/arm/mach-mmp/addr-map.h
index 25edf6a92276e..3dc2f0b0ecba5 100644
--- a/arch/arm/mach-mmp/addr-map.h
+++ b/arch/arm/mach-mmp/addr-map.h
@@ -20,6 +20,10 @@
 #define AXI_VIRT_BASE		IOMEM(0xfe200000)
 #define AXI_PHYS_SIZE		0x00200000
 
+#define PGU_PHYS_BASE		0xe0000000
+#define PGU_VIRT_BASE		IOMEM(0xfe400000)
+#define PGU_PHYS_SIZE		0x00100000
+
 /* Static Memory Controller - Chip Select 0 and 1 */
 #define SMC_CS0_PHYS_BASE	0x80000000
 #define SMC_CS0_PHYS_SIZE	0x10000000
@@ -38,4 +42,7 @@
 #define CIU_VIRT_BASE		(AXI_VIRT_BASE + 0x82c00)
 #define CIU_REG(x)		(CIU_VIRT_BASE + (x))
 
+#define SCU_VIRT_BASE		(PGU_VIRT_BASE)
+#define SCU_REG(x)		(SCU_VIRT_BASE + (x))
+
 #endif /* __ASM_MACH_ADDR_MAP_H */
diff --git a/arch/arm/mach-mmp/common.c b/arch/arm/mach-mmp/common.c
index 6684abc7708bd..2ee08c78e8bc9 100644
--- a/arch/arm/mach-mmp/common.c
+++ b/arch/arm/mach-mmp/common.c
@@ -36,6 +36,15 @@ static struct map_desc standard_io_desc[] __initdata = {
 	},
 };
 
+static struct map_desc mmp2_io_desc[] __initdata = {
+	{
+		.pfn		= __phys_to_pfn(PGU_PHYS_BASE),
+		.virtual	= (unsigned long)PGU_VIRT_BASE,
+		.length		= PGU_PHYS_SIZE,
+		.type		= MT_DEVICE,
+	},
+};
+
 void __init mmp_map_io(void)
 {
 	iotable_init(standard_io_desc, ARRAY_SIZE(standard_io_desc));
@@ -44,6 +53,12 @@ void __init mmp_map_io(void)
 	mmp_chip_id = __raw_readl(MMP_CHIPID);
 }
 
+void __init mmp2_map_io(void)
+{
+	mmp_map_io();
+	iotable_init(mmp2_io_desc, ARRAY_SIZE(mmp2_io_desc));
+}
+
 void mmp_restart(enum reboot_mode mode, const char *cmd)
 {
 	soft_restart(0);
diff --git a/arch/arm/mach-mmp/common.h b/arch/arm/mach-mmp/common.h
index 483b8b6d3005a..ed56b3f15b45e 100644
--- a/arch/arm/mach-mmp/common.h
+++ b/arch/arm/mach-mmp/common.h
@@ -5,4 +5,5 @@
 extern void mmp_timer_init(int irq, unsigned long rate);
 
 extern void __init mmp_map_io(void);
+extern void __init mmp2_map_io(void);
 extern void mmp_restart(enum reboot_mode, const char *);
diff --git a/arch/arm/mach-mmp/mmp2-dt.c b/arch/arm/mach-mmp/mmp2-dt.c
index 305a9daba6d68..8eec881191f4b 100644
--- a/arch/arm/mach-mmp/mmp2-dt.c
+++ b/arch/arm/mach-mmp/mmp2-dt.c
@@ -33,7 +33,7 @@ static const char *const mmp2_dt_board_compat[] __initconst = {
 };
 
 DT_MACHINE_START(MMP2_DT, "Marvell MMP2 (Device Tree Support)")
-	.map_io		= mmp_map_io,
+	.map_io		= mmp2_map_io,
 	.init_time	= mmp_init_time,
 	.dt_compat	= mmp2_dt_board_compat,
 MACHINE_END
-- 
2.21.0
