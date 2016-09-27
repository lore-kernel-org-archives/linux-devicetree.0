From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/8] pinctrl: aspeed-g5: Fix GPIOE1 typo
Date: Wed, 28 Sep 2016 00:20:15 +0930
Message-ID: <9364de84d3be30a5349298e219ca827d176d7ba8.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This prevented C20 from successfully being muxed as GPIO.

Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 14639834a5eb..235d929e74fd 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -182,7 +182,7 @@ SIG_EXPR_LIST_DECL_SINGLE(NDCD3, NDCD3, SIG_DESC_SET(SCU80, 17));
 SIG_EXPR_DECL(GPIE0OUT, GPIE0, GPIE0_DESC);
 SIG_EXPR_DECL(GPIE0OUT, GPIE, GPIE_DESC);
 SIG_EXPR_LIST_DECL_DUAL(GPIE0OUT, GPIE0, GPIE);
-MS_PIN_DECL(C20, GPIE0, NDCD3, GPIE0OUT);
+MS_PIN_DECL(C20, GPIOE1, NDCD3, GPIE0OUT);
 
 FUNC_GROUP_DECL(GPIE0, B20, C20);
 
-- 
git-series 0.8.10
