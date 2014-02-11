From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH 4/8] ARM: mvebu: make use of of_find_matching_node_and_match
Date: Tue, 11 Feb 2014 10:24:02 -0600
Message-ID: <1392135847-30791-5-git-send-email-joshc@codeaurora.org>
References: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Instead of the of_find_matching_node()/of_match_node() pair, which requires two
iterations through the match table, make use of of_find_matching_node_and_match(),
which only iterates through the table once.

While we're here, mark the of_system_controller table const.

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 arch/arm/mach-mvebu/system-controller.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-mvebu/system-controller.c b/arch/arm/mach-mvebu/system-controller.c
index a7fb89a..e6e300a 100644
--- a/arch/arm/mach-mvebu/system-controller.c
+++ b/arch/arm/mach-mvebu/system-controller.c
@@ -54,7 +54,7 @@ static const struct mvebu_system_controller orion_system_controller = {
 	.system_soft_reset = 0x1,
 };
 
-static struct of_device_id of_system_controller_table[] = {
+static const struct of_device_id of_system_controller_table[] = {
 	{
 		.compatible = "marvell,orion-system-controller",
 		.data = (void *) &orion_system_controller,
@@ -90,13 +90,12 @@ void mvebu_restart(enum reboot_mode mode, const char *cmd)
 
 static int __init mvebu_system_controller_init(void)
 {
+	const struct of_device_id *match;
 	struct device_node *np;
 
-	np = of_find_matching_node(NULL, of_system_controller_table);
+	np = of_find_matching_node_and_match(NULL, of_system_controller_table,
+					     &match);
 	if (np) {
-		const struct of_device_id *match =
-		    of_match_node(of_system_controller_table, np);
-		BUG_ON(!match);
 		system_controller_base = of_iomap(np, 0);
 		mvebu_sc = (struct mvebu_system_controller *)match->data;
 		of_node_put(np);
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
