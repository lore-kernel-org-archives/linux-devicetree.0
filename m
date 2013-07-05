From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 14/21] bus: mvebu-mbus: Factorize Armada 370/XP data
 structures
Date: Fri,  5 Jul 2013 18:39:25 -0300
Message-ID: <1373060372-32357-15-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373060372-32357-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373060372-32357-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

These structures were only different in the mapping tables.
Now that those tables have been removed, it doesn't make any sense
to keep different structures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/bus/mvebu-mbus.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 58d3c8f..0b7f9f7 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -534,15 +534,7 @@ mvebu_mbus_dove_setup_cpu_target(struct mvebu_mbus_state *mbus)
 	mvebu_mbus_dram_info.num_cs = cs;
 }
 
-static const struct mvebu_mbus_soc_data armada_370_mbus_data = {
-	.num_wins            = 20,
-	.num_remappable_wins = 8,
-	.win_cfg_offset      = armada_370_xp_mbus_win_offset,
-	.setup_cpu_target    = mvebu_mbus_default_setup_cpu_target,
-	.show_cpu_target     = mvebu_sdram_debug_show_orion,
-};
-
-static const struct mvebu_mbus_soc_data armada_xp_mbus_data = {
+static const struct mvebu_mbus_soc_data armada_370_xp_mbus_data = {
 	.num_wins            = 20,
 	.num_remappable_wins = 8,
 	.win_cfg_offset      = armada_370_xp_mbus_win_offset,
@@ -602,9 +594,9 @@ static const struct mvebu_mbus_soc_data mv78xx0_mbus_data = {
  */
 static const struct of_device_id of_mvebu_mbus_ids[] = {
 	{ .compatible = "marvell,armada370-mbus",
-	  .data = &armada_370_mbus_data, },
+	  .data = &armada_370_xp_mbus_data, },
 	{ .compatible = "marvell,armadaxp-mbus",
-	  .data = &armada_xp_mbus_data, },
+	  .data = &armada_370_xp_mbus_data, },
 	{ .compatible = "marvell,kirkwood-mbus",
 	  .data = &kirkwood_mbus_data, },
 	{ .compatible = "marvell,dove-mbus",
-- 
1.8.1.5
