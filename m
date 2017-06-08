From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v6 1/9] pinctrl: meson: add interrupts to pinctrl data
Date: Thu, 8 Jun 2017 21:37:50 +0200
Message-ID: <897a1982-2bfb-d250-94bc-262a745109a3@gmail.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>
Add GPIO interrupt information to pinctrl data. Added to the original
version from Jerome was data for Meson GXL.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
v3:
- no changes
v4:
- no changes
v5:
- added Acked-by
v6:
- no changes

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 22 ++++++++++----------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 20 +++++++++----------
 drivers/pinctrl/meson/pinctrl-meson.h      | 15 +++++++++-----
 drivers/pinctrl/meson/pinctrl-meson8.c     | 20 +++++++++----------
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 32 ++++++++++++++++++++----------
 5 files changed, 63 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 8b716b93..6999c7a9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -807,20 +807,20 @@ static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
 };
 
 static struct meson_bank meson_gxbb_periphs_banks[] = {
-	/*   name    first                      last                    pullen  pull    dir     out     in  */
-	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_22, EE_OFF),  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
-	BANK("Y",    PIN(GPIOY_0, EE_OFF),	PIN(GPIOY_16, EE_OFF),  1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
-	BANK("DV",   PIN(GPIODV_0, EE_OFF),	PIN(GPIODV_29, EE_OFF), 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
-	BANK("H",    PIN(GPIOH_0, EE_OFF),	PIN(GPIOH_3, EE_OFF),   1, 20,  1, 20,  3, 20,  4, 20,  5, 20),
-	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_15, EE_OFF),  3,  0,  3,  0,  9,  0,  10, 0, 11,  0),
-	BANK("CARD", PIN(CARD_0, EE_OFF),	PIN(CARD_6, EE_OFF),    2, 20,  2, 20,  6, 20,  7, 20,  8, 20),
-	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_17, EE_OFF),   2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
-	BANK("CLK",  PIN(GPIOCLK_0, EE_OFF),	PIN(GPIOCLK_3, EE_OFF), 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
+	/*   name    first                      last                    irq       pullen  pull    dir     out     in  */
+	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_22, EE_OFF),  106, 128, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
+	BANK("Y",    PIN(GPIOY_0, EE_OFF),	PIN(GPIOY_16, EE_OFF),   89, 105, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
+	BANK("DV",   PIN(GPIODV_0, EE_OFF),	PIN(GPIODV_29, EE_OFF),  59,  88, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
+	BANK("H",    PIN(GPIOH_0, EE_OFF),	PIN(GPIOH_3, EE_OFF),    30,  33, 1, 20,  1, 20,  3, 20,  4, 20,  5, 20),
+	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_15, EE_OFF),   14,  29, 3,  0,  3,  0,  9,  0,  10, 0, 11,  0),
+	BANK("CARD", PIN(CARD_0, EE_OFF),	PIN(CARD_6, EE_OFF),     52,  58, 2, 20,  2, 20,  6, 20,  7, 20,  8, 20),
+	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_17, EE_OFF),    34,  51, 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	BANK("CLK",  PIN(GPIOCLK_0, EE_OFF),	PIN(GPIOCLK_3, EE_OFF), 129, 132, 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
 };
 
 static struct meson_bank meson_gxbb_aobus_banks[] = {
-	/*   name    first              last               pullen  pull    dir     out     in  */
-	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_13, 0), 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	/*   name    first              last               irq    pullen  pull    dir     out     in  */
+	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_13, 0), 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
 };
 
 struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 190f50c6..2abea6e1 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -764,19 +764,19 @@ static struct meson_pmx_func meson_gxl_aobus_functions[] = {
 };
 
 static struct meson_bank meson_gxl_periphs_banks[] = {
-	/*   name    first                      last                    pullen  pull    dir     out     in  */
-	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_18, EE_OFF),  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
-	BANK("DV",   PIN(GPIODV_0, EE_OFF),	PIN(GPIODV_29, EE_OFF), 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
-	BANK("H",    PIN(GPIOH_0, EE_OFF),	PIN(GPIOH_9, EE_OFF),   1, 20,  1, 20,  3, 20,  4, 20,  5, 20),
-	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_15, EE_OFF),  3,  0,  3,  0,  9,  0,  10, 0, 11,  0),
-	BANK("CARD", PIN(CARD_0, EE_OFF),	PIN(CARD_6, EE_OFF),    2, 20,  2, 20,  6, 20,  7, 20,  8, 20),
-	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_15, EE_OFF),   2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
-	BANK("CLK",  PIN(GPIOCLK_0, EE_OFF),	PIN(GPIOCLK_1, EE_OFF), 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
+	/*   name    first                      last                    irq	  pullen  pull    dir     out     in  */
+	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_18, EE_OFF),   89, 107, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
+	BANK("DV",   PIN(GPIODV_0, EE_OFF),	PIN(GPIODV_29, EE_OFF),  83,  88, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
+	BANK("H",    PIN(GPIOH_0, EE_OFF),	PIN(GPIOH_9, EE_OFF),    26,  35, 1, 20,  1, 20,  3, 20,  4, 20,  5, 20),
+	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_15, EE_OFF),   10,  25, 3,  0,  3,  0,  9,  0,  10, 0, 11,  0),
+	BANK("CARD", PIN(CARD_0, EE_OFF),	PIN(CARD_6, EE_OFF),     52,  58, 2, 20,  2, 20,  6, 20,  7, 20,  8, 20),
+	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_15, EE_OFF),    36,  51, 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	BANK("CLK",  PIN(GPIOCLK_0, EE_OFF),	PIN(GPIOCLK_1, EE_OFF), 108, 109, 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
 };
 
 static struct meson_bank meson_gxl_aobus_banks[] = {
-	/*   name    first              last              pullen  pull    dir     out     in  */
-	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_9, 0), 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	/*   name    first              last              irq	pullen  pull    dir     out     in  */
+	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_9, 0), 0, 9, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
 };
 
 struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 1aa871d5..890f296f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -81,6 +81,7 @@ enum meson_reg_type {
  * @name:	bank name
  * @first:	first pin of the bank
  * @last:	last pin of the bank
+ * @irq:	hwirq base number of the bank
  * @regs:	array of register descriptors
  *
  * A bank represents a set of pins controlled by a contiguous set of
@@ -92,6 +93,8 @@ struct meson_bank {
 	const char *name;
 	unsigned int first;
 	unsigned int last;
+	int irq_first;
+	int irq_last;
 	struct meson_reg_desc regs[NUM_REG];
 };
 
@@ -147,12 +150,14 @@ struct meson_pinctrl {
 		.num_groups = ARRAY_SIZE(fn ## _groups),		\
 	}
 
-#define BANK(n, f, l, per, peb, pr, pb, dr, db, or, ob, ir, ib)		\
+#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib)	\
 	{								\
-		.name	= n,						\
-		.first	= f,						\
-		.last	= l,						\
-		.regs	= {						\
+		.name		= n,					\
+		.first		= f,					\
+		.last		= l,					\
+		.irq_first	= fi,					\
+		.irq_last	= li,					\
+		.regs = {						\
 			[REG_PULLEN]	= { per, peb },			\
 			[REG_PULL]	= { pr, pb },			\
 			[REG_DIR]	= { dr, db },			\
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index e1bdf1f3..970f6f14 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1041,19 +1041,19 @@ static struct meson_pmx_func meson8_aobus_functions[] = {
 };
 
 static struct meson_bank meson8_cbus_banks[] = {
-	/*   name    first             last                 pullen  pull    dir     out     in  */
-	BANK("X",    PIN(GPIOX_0, 0),  PIN(GPIOX_21, 0),    4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
-	BANK("Y",    PIN(GPIOY_0, 0),  PIN(GPIOY_16, 0),    3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
-	BANK("DV",   PIN(GPIODV_0, 0), PIN(GPIODV_29, 0),   0,  0,  0,  0,  7,  0,  8,  0,  9,  0),
-	BANK("H",    PIN(GPIOH_0, 0),  PIN(GPIOH_9, 0),     1, 16,  1, 16,  9, 19, 10, 19, 11, 19),
-	BANK("Z",    PIN(GPIOZ_0, 0),  PIN(GPIOZ_14, 0),    1,  0,  1,  0,  3, 17,  4, 17,  5, 17),
-	BANK("CARD", PIN(CARD_0, 0),   PIN(CARD_6, 0),      2, 20,  2, 20,  0, 22,  1, 22,  2, 22),
-	BANK("BOOT", PIN(BOOT_0, 0),   PIN(BOOT_18, 0),     2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
+	/*   name    first             last                 irq       pullen  pull    dir     out     in  */
+	BANK("X",    PIN(GPIOX_0, 0),  PIN(GPIOX_21, 0),    112, 133, 4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
+	BANK("Y",    PIN(GPIOY_0, 0),  PIN(GPIOY_16, 0),    95,  111, 3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
+	BANK("DV",   PIN(GPIODV_0, 0), PIN(GPIODV_29, 0),   65,   94, 0,  0,  0,  0,  7,  0,  8,  0,  9,  0),
+	BANK("H",    PIN(GPIOH_0, 0),  PIN(GPIOH_9, 0),     29,   38, 1, 16,  1, 16,  9, 19, 10, 19, 11, 19),
+	BANK("Z",    PIN(GPIOZ_0, 0),  PIN(GPIOZ_14, 0),    14,   28, 1,  0,  1,  0,  3, 17,  4, 17,  5, 17),
+	BANK("CARD", PIN(CARD_0, 0),   PIN(CARD_6, 0),      58,   64, 2, 20,  2, 20,  0, 22,  1, 22,  2, 22),
+	BANK("BOOT", PIN(BOOT_0, 0),   PIN(BOOT_18, 0),     39,   57, 2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
 };
 
 static struct meson_bank meson8_aobus_banks[] = {
-	/*   name    first                  last                      pullen  pull    dir     out     in  */
-	BANK("AO",   PIN(GPIOAO_0, AO_OFF), PIN(GPIO_TEST_N, AO_OFF), 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	/*   name    first                  last                      irq    pullen  pull    dir     out     in  */
+	BANK("AO",   PIN(GPIOAO_0, AO_OFF), PIN(GPIO_TEST_N, AO_OFF), 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
 };
 
 struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index bf747eb1..71f216b5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -124,6 +124,12 @@ static const struct pinctrl_pin_desc meson8b_aobus_pins[] = {
 	MESON_PIN(GPIOAO_11, AO_OFF),
 	MESON_PIN(GPIOAO_12, AO_OFF),
 	MESON_PIN(GPIOAO_13, AO_OFF),
+
+	/*
+	 * The following 2 pins are not mentionned in the public datasheet
+	 * According to this datasheet, they can't be used with the gpio
+	 * interrupt controller
+	 */
 	MESON_PIN(GPIO_BSD_EN, AO_OFF),
 	MESON_PIN(GPIO_TEST_N, AO_OFF),
 };
@@ -881,19 +887,25 @@ static struct meson_pmx_func meson8b_aobus_functions[] = {
 };
 
 static struct meson_bank meson8b_cbus_banks[] = {
-	/*   name    first                      last                   pullen  pull    dir     out     in  */
-	BANK("X",    PIN(GPIOX_0, 0),		PIN(GPIOX_21, 0),      4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
-	BANK("Y",    PIN(GPIOY_0, 0),		PIN(GPIOY_14, 0),      3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
-	BANK("DV",   PIN(GPIODV_9, 0),		PIN(GPIODV_29, 0),     0,  0,  0,  0,  7,  0,  8,  0,  9,  0),
-	BANK("H",    PIN(GPIOH_0, 0),		PIN(GPIOH_9, 0),       1, 16,  1, 16,  9, 19, 10, 19, 11, 19),
-	BANK("CARD", PIN(CARD_0, 0),		PIN(CARD_6, 0),        2, 20,  2, 20,  0, 22,  1, 22,  2, 22),
-	BANK("BOOT", PIN(BOOT_0, 0),		PIN(BOOT_18, 0),       2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
-	BANK("DIF",  PIN(DIF_0_P, 0),		PIN(DIF_4_N, 0),       5,  8,  5,  8, 12, 12, 13, 12, 14, 12),
+	/*   name    first                      last                irq      pullen  pull    dir     out     in  */
+	BANK("X",    PIN(GPIOX_0, 0),		PIN(GPIOX_21, 0),   97, 118, 4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
+	BANK("Y",    PIN(GPIOY_0, 0),		PIN(GPIOY_14, 0),   80,  96, 3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
+	BANK("DV",   PIN(GPIODV_9, 0),		PIN(GPIODV_29, 0),  59,  79, 0,  0,  0,  0,  7,  0,  8,  0,  9,  0),
+	BANK("H",    PIN(GPIOH_0, 0),		PIN(GPIOH_9, 0),    14,  23, 1, 16,  1, 16,  9, 19, 10, 19, 11, 19),
+	BANK("CARD", PIN(CARD_0, 0),		PIN(CARD_6, 0),     43,  49, 2, 20,  2, 20,  0, 22,  1, 22,  2, 22),
+	BANK("BOOT", PIN(BOOT_0, 0),		PIN(BOOT_18, 0),    24,  42, 2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
+
+	/*
+	 * The following bank is not mentionned in the public datasheet
+	 * There is no information whether it can be used with the gpio
+	 * interrupt controller
+	 */
+	BANK("DIF",  PIN(DIF_0_P, 0),		PIN(DIF_4_N, 0),    -1,  -1, 5,  8,  5,  8, 12, 12, 13, 12, 14, 12),
 };
 
 static struct meson_bank meson8b_aobus_banks[] = {
-	/*   name    first                  last                      pullen  pull    dir     out     in  */
-	BANK("AO",   PIN(GPIOAO_0, AO_OFF), PIN(GPIO_TEST_N, AO_OFF), 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	/*   name    first                  last                      irq    pullen  pull    dir     out     in  */
+	BANK("AO",   PIN(GPIOAO_0, AO_OFF), PIN(GPIO_TEST_N, AO_OFF), 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
 };
 
 struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
-- 
2.13.0



