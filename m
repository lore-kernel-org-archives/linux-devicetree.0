From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 1/7] clk: fix orphan list iterator to be safe
Date: Tue, 13 Mar 2012 18:22:21 -0500
Message-ID: <1331680947-29861-2-git-send-email-robherring2@gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

__clk_reparent can remove orphans, so the list iterator needs to be the
safe from removal version.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 drivers/clk/clk.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c7c3bc5..802eda4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1172,7 +1172,7 @@ void __clk_init(struct device *dev, struct clk *clk)
 {
 	int i;
 	struct clk *orphan;
-	struct hlist_node *tmp;
+	struct hlist_node *tmp, *tmp2;
 
 	if (!clk)
 		return;
@@ -1246,7 +1246,7 @@ void __clk_init(struct device *dev, struct clk *clk)
 	 * walk the list of orphan clocks and reparent any that are children of
 	 * this clock
 	 */
-	hlist_for_each_entry(orphan, tmp, &clk_orphan_list, child_node)
+	hlist_for_each_entry_safe(orphan, tmp, tmp2, &clk_orphan_list, child_node)
 		__clk_reparent(orphan, __clk_init_parent(orphan));
 
 	/*
-- 
1.7.5.4
