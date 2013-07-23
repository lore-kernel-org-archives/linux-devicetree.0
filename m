From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 16/28] bus: mvebu-mbus: Factorize Armada 370/XP data
 structures
Date: Tue, 23 Jul 2013 10:31:20 -0300
Message-ID: <1374586292-4941-17-git-send-email-ezequiel.garcia@free-electrons.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

These structures were only different in the mapping tables.
Now that those tables have been removed, it doesn't make any sense
to keep different structures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/bus/mvebu-mbus.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 26af145..19ab6ff 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -536,15 +536,7 @@ mvebu_mbus_dove_setup_cpu_target(struct mvebu_mbus_state *mbus)
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
@@ -604,9 +596,9 @@ static const struct mvebu_mbus_soc_data mv78xx0_mbus_data = {
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
