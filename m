From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 5/5] pinctrl: aspeed: Fix kerneldoc return descriptions
Date: Tue, 20 Dec 2016 18:05:51 +1030
Message-ID: <20161220073551.28522-6-andrew@aj.id.au>
References: <20161220073551.28522-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220073551.28522-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 782c5c97f853..76f62bd45f02 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -97,7 +97,7 @@ static inline void aspeed_sig_desc_print_val(
  * @enabled: True to query the enabled state, false to query disabled state
  * @regmap: The IP block's regmap instance
  *
- * @return 1 if the descriptor's bitfield is configured to the state
+ * Return: 1 if the descriptor's bitfield is configured to the state
  * selected by @enabled, 0 if not, and less than zero if an unrecoverable
  * failure occurred
  *
@@ -134,7 +134,7 @@ static int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
  * @enabled: True to query the enabled state, false to query disabled state
  * @maps: The list of regmap instances
  *
- * @return 1 if the expression composed by @enabled evaluates true, 0 if not,
+ * Return: 1 if the expression composed by @enabled evaluates true, 0 if not,
  * and less than zero if an unrecoverable failure occurred.
  *
  * A mux function is enabled or disabled if the function's signal expression
@@ -175,7 +175,7 @@ static int aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
  *          expression, false to disable the function's signal
  * @maps: The list of regmap instances for pinmux register access.
  *
- * @return 0 if the expression is configured as requested and a negative error
+ * Return: 0 if the expression is configured as requested and a negative error
  * code otherwise
  */
 static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
@@ -256,7 +256,7 @@ static int aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
  * @exprs: The list of signal expressions (from a priority level on a pin)
  * @maps: The list of regmap instances for pinmux register access.
  *
- * @return 0 if all expressions are disabled, otherwise a negative error code
+ * Return: 0 if all expressions are disabled, otherwise a negative error code
  */
 static int aspeed_disable_sig(const struct aspeed_sig_expr **exprs,
 			       struct regmap * const *maps)
@@ -281,8 +281,8 @@ static int aspeed_disable_sig(const struct aspeed_sig_expr **exprs,
  * @exprs: List of signal expressions (haystack)
  * @name: The name of the requested function (needle)
  *
- * @return A pointer to the signal expression whose function tag matches the
- *         provided name, otherwise NULL.
+ * Return: A pointer to the signal expression whose function tag matches the
+ * provided name, otherwise NULL.
  *
  */
 static const struct aspeed_sig_expr *aspeed_find_expr_by_name(
-- 
2.9.3
