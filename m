From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [RFC PATCH 1/4] pinctrl: at91: fix typos
Date: Fri, 13 Sep 2013 09:45:33 +0200
Message-ID: <1379058333-3286-1-git-send-email-b.brezillon@overkiz.com>
References: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Jiri Kosina <jkosina@suse.cz>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Fix AT91_PINCTRL_DEBOUNCE_VAL dt macro typo.
Fix at91_pinctrl_mux_ops callback typos.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 drivers/pinctrl/pinctrl-at91.c     |    6 +++---
 include/dt-bindings/pinctrl/at91.h |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 19afb9a..50b555a 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -144,11 +144,11 @@ struct at91_pinctrl_mux_ops {
 	void (*mux_C_periph)(void __iomem *pio, unsigned mask);
 	void (*mux_D_periph)(void __iomem *pio, unsigned mask);
 	bool (*get_deglitch)(void __iomem *pio, unsigned pin);
-	void (*set_deglitch)(void __iomem *pio, unsigned mask, bool in_on);
+	void (*set_deglitch)(void __iomem *pio, unsigned mask, bool is_on);
 	bool (*get_debounce)(void __iomem *pio, unsigned pin, u32 *div);
-	void (*set_debounce)(void __iomem *pio, unsigned mask, bool in_on, u32 div);
+	void (*set_debounce)(void __iomem *pio, unsigned mask, bool is_on, u32 div);
 	bool (*get_pulldown)(void __iomem *pio, unsigned pin);
-	void (*set_pulldown)(void __iomem *pio, unsigned mask, bool in_on);
+	void (*set_pulldown)(void __iomem *pio, unsigned mask, bool is_on);
 	bool (*get_schmitt_trig)(void __iomem *pio, unsigned pin);
 	void (*disable_schmitt_trig)(void __iomem *pio, unsigned mask);
 	/* irq */
diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
index d7988b4..0fee6ff 100644
--- a/include/dt-bindings/pinctrl/at91.h
+++ b/include/dt-bindings/pinctrl/at91.h
@@ -16,7 +16,7 @@
 #define AT91_PINCTRL_PULL_DOWN		(1 << 3)
 #define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
 #define AT91_PINCTRL_DEBOUNCE		(1 << 16)
-#define AT91_PINCTRL_DEBOUNCE_VA(x)	(x << 17)
+#define AT91_PINCTRL_DEBOUNCE_VAL(x)	(x << 17)
 
 #define AT91_PINCTRL_PULL_UP_DEGLITCH	(AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DEGLITCH)
 
-- 
1.7.9.5

