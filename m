From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 3/3] clk: keystone: sci-clk: use shorter names for clocks
Date: Tue, 8 Jan 2019 15:30:23 +0200
Message-ID: <1546954223-9738-4-git-send-email-t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Currently the full device name of the clock provider is used as the initial
part of the registered clock name. This is pretty long and completely
unnecessary info in generic case, so shorten it up. Now, we only contain
the short name of the clock provider node (pOFn.)

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index d1d6dc8..57b7d02 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -283,7 +283,7 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 	int i;
 	int ret = 0;
 
-	name = kasprintf(GFP_KERNEL, "%s:%d:%d", dev_name(provider->dev),
+	name = kasprintf(GFP_KERNEL, "%pOFn:%d:%d", provider->dev->of_node,
 			 sci_clk->dev_id, sci_clk->clk_id);
 
 	init.name = name;
@@ -309,8 +309,8 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 		for (i = 0; i < sci_clk->num_parents; i++) {
 			char *parent_name;
 
-			parent_name = kasprintf(GFP_KERNEL, "%s:%d:%d",
-						dev_name(provider->dev),
+			parent_name = kasprintf(GFP_KERNEL, "%pOFn:%d:%d",
+						provider->dev->of_node,
 						sci_clk->dev_id,
 						sci_clk->clk_id + 1 + i);
 			if (!parent_name) {
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
