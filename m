From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] pinctrl: mvebu: add additional variant for standalone
 CP115
Date: Mon,  5 Aug 2019 12:16:07 +0200
Message-ID: <20190805101607.29811-4-miquel.raynal@bootlin.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190805101607.29811-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Grzegorz Jaszczyk <jaz@semihalf.com>

With CP115 standalone modules, all MPP configuration are
possible. Handle this new possibility thanks to the new
"marvell,cp115-standalone-pinctrl" compatible property.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
[<miquel.raynal@bootlin.com>: mention the new compatible in the
commit log]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
index 85ade9761885..17491b27e487 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
@@ -32,6 +32,7 @@ enum {
 	V_ARMADA_7K = BIT(0),
 	V_ARMADA_8K_CPM = BIT(1),
 	V_ARMADA_8K_CPS = BIT(2),
+	V_CP115_STANDALONE = BIT(3),
 	V_ARMADA_7K_8K_CPM = (V_ARMADA_7K | V_ARMADA_8K_CPM),
 	V_ARMADA_7K_8K_CPS = (V_ARMADA_7K | V_ARMADA_8K_CPS),
 };
@@ -614,6 +615,10 @@ static const struct of_device_id armada_cp110_pinctrl_of_match[] = {
 		.compatible	= "marvell,armada-8k-cps-pinctrl",
 		.data		= (void *) V_ARMADA_8K_CPS,
 	},
+	{
+		.compatible	= "marvell,cp115-standalone-pinctrl",
+		.data		= (void *) V_CP115_STANDALONE,
+	},
 	{ },
 };
 
@@ -655,16 +660,20 @@ static int armada_cp110_pinctrl_probe(struct platform_device *pdev)
 
 		switch (i) {
 		case 0 ... 31:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_7K_8K_CPS);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_7K_8K_CPS |
+							 V_CP115_STANDALONE));
 			break;
 		case 32 ... 38:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_7K_8K_CPM);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_7K_8K_CPM |
+							 V_CP115_STANDALONE));
 			break;
 		case 39 ... 43:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_8K_CPM);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_8K_CPM |
+							 V_CP115_STANDALONE));
 			break;
 		case 44 ... 62:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_7K_8K_CPM);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_7K_8K_CPM |
+							 V_CP115_STANDALONE));
 			break;
 		}
 	}
-- 
2.20.1
