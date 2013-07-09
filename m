From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 17/22] ARM: mvebu: Initialize MBus using the DT binding
Date: Tue,  9 Jul 2013 13:41:19 -0300
Message-ID: <1373388084-29520-18-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373388084-29520-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373388084-29520-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that the mbus device tree binding has been introduced, we can
switch over to it.

Also, and since the initialization of the mbus driver is quite
fundamental for the system to work properly, this patch adds a BUG()
in case mbus fails to initialize.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
