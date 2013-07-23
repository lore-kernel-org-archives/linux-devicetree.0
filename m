From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 18/28] ARM: mvebu: Initialize MBus using the DT binding
Date: Tue, 23 Jul 2013 10:31:22 -0300
Message-ID: <1374586292-4941-19-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Now that the mbus device tree binding has been introduced, we can
switch over to it.

Also, and since the initialization of the mbus driver is quite
fundamental for the system to work properly, this patch adds a BUG()
in case mbus fails to initialize.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/mach-mvebu/armada-370-xp.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/arch/arm/mach-mvebu/armada-370-xp.c b/arch/arm/mach-mvebu/armada-370-xp.c
index 97cbb80..829b573 100644
--- a/arch/arm/mach-mvebu/armada-370-xp.c
+++ b/arch/arm/mach-mvebu/armada-370-xp.c
@@ -34,44 +34,12 @@ static void __init armada_370_xp_map_io(void)
 	debug_ll_io_init();
 }
 
-/*
- * This initialization will be replaced by a DT-based
- * initialization once the mvebu-mbus driver gains DT support.
- */
-
-#define ARMADA_370_XP_MBUS_WINS_OFFS   0x20000
-#define ARMADA_370_XP_MBUS_WINS_SIZE   0x100
-#define ARMADA_370_XP_SDRAM_WINS_OFFS  0x20180
-#define ARMADA_370_XP_SDRAM_WINS_SIZE  0x20
-
-static void __init armada_370_xp_mbus_init(void)
-{
-	char *mbus_soc_name;
-	struct device_node *dn;
-	const __be32 mbus_wins_offs = cpu_to_be32(ARMADA_370_XP_MBUS_WINS_OFFS);
-	const __be32 sdram_wins_offs = cpu_to_be32(ARMADA_370_XP_SDRAM_WINS_OFFS);
-
-	if (of_machine_is_compatible("marvell,armada370"))
-		mbus_soc_name = "marvell,armada370-mbus";
-	else
-		mbus_soc_name = "marvell,armadaxp-mbus";
-
-	dn = of_find_node_by_name(NULL, "internal-regs");
-	BUG_ON(!dn);
-
-	mvebu_mbus_init(mbus_soc_name,
-			of_translate_address(dn, &mbus_wins_offs),
-			ARMADA_370_XP_MBUS_WINS_SIZE,
-			of_translate_address(dn, &sdram_wins_offs),
-			ARMADA_370_XP_SDRAM_WINS_SIZE);
-}
-
 static void __init armada_370_xp_timer_and_clk_init(void)
 {
 	of_clk_init(NULL);
 	armada_370_xp_timer_init();
 	coherency_init();
-	armada_370_xp_mbus_init();
+	BUG_ON(mvebu_mbus_dt_init());
 #ifdef CONFIG_CACHE_L2X0
 	l2x0_of_init(0, ~0UL);
 #endif
-- 
1.8.1.5
