From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 6/8] pinctrl: aspeed: Clarify comment about strapping W1C
Date: Fri, 28 Jun 2019 12:08:36 +0930
Message-ID: <20190628023838.15426-7-andrew@aj.id.au>
References: <20190628023838.15426-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>
List-Id: devicetree@vger.kernel.org

Writes of 1 to SCU7C clear set bits in SCU70, the hardware strapping
register. The information was correct if you squinted while reading, but
hopefully switching the order of the registers as listed conveys it
better.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 4c775b8ffdc4..b510bb475851 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -209,7 +209,7 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
-		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
+		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
 			unsigned int rev_id;
 
-- 
2.20.1
