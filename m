From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/2] regulator: lm363x: Use generic DT property name for external control pins
Date: Tue, 28 Feb 2017 16:50:41 +0900
Message-ID: <20170228075041.7568-2-milo.kim@ti.com>
References: <20170228075041.7568-1-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170228075041.7568-1-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Vpos and Vneg LDOs can be enabled or disabled by external GPIOs.
Use general DT property 'enable-gpios' for this usage.
Two enable pins are differentiable by selecting the index number.

Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
---
 drivers/regulator/lm363x-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index f53e63301a20..ce5f7d9ad475 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -227,9 +227,9 @@ static int lm363x_regulator_of_get_enable_gpio(struct device_node *np, int id)
 	 */
 	switch (id) {
 	case LM3632_LDO_POS:
-		return of_get_named_gpio(np, "ti,lcm-en1-gpio", 0);
+		return of_get_named_gpio(np, "enable-gpios", 0);
 	case LM3632_LDO_NEG:
-		return of_get_named_gpio(np, "ti,lcm-en2-gpio", 0);
+		return of_get_named_gpio(np, "enable-gpios", 1);
 	default:
 		return -EINVAL;
 	}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
