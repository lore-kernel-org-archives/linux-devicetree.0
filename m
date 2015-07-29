From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v5 02/10] clk: mediatek: Remove unused code from MT8173.
Date: Wed, 29 Jul 2015 14:52:26 +0800
Message-ID: <1438152754-11970-3-git-send-email-jamesjj.liao@mediatek.com>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Remove unused header files from MT8173, and remove unused
keywords from function declaration.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8173.c | 2 --
 drivers/clk/mediatek/clk-mtk.h    | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 4486f8f..4478849 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -14,8 +14,6 @@
 
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/slab.h>
-#include <linux/mfd/syscon.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 9dda9d8..740fe5e 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -41,7 +41,7 @@ struct mtk_fixed_factor {
 		.div = _div,				\
 	}
 
-extern void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
+void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 		int num, struct clk_onecell_data *clk_data);
 
 struct mtk_composite {
@@ -152,7 +152,7 @@ struct mtk_pll_data {
 	int pcw_shift;
 };
 
-void __init mtk_clk_register_plls(struct device_node *node,
+void mtk_clk_register_plls(struct device_node *node,
 		const struct mtk_pll_data *plls, int num_plls,
 		struct clk_onecell_data *clk_data);
 
-- 
1.8.1.1.dirty
