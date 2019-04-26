From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH] watchdog: stm32: add dynamic prescaler support
Date: Fri, 26 Apr 2019 15:41:15 +0200
Message-ID: <1556286075-29496-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch allows to define the max prescaler by compatible.
To set a large range of timeout, the prescaler should be set
dynamically (from the timeout request) to improve the resolution
in order to have a timeout close to the expected value.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 70 +++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index e00e3b3..91d0a89 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -34,18 +34,10 @@
 #define KR_KEY_EWA	0x5555 /* write access enable */
 #define KR_KEY_DWA	0x0000 /* write access disable */
 
-/* IWDG_PR register bit values */
-#define PR_4		0x00 /* prescaler set to 4 */
-#define PR_8		0x01 /* prescaler set to 8 */
-#define PR_16		0x02 /* prescaler set to 16 */
-#define PR_32		0x03 /* prescaler set to 32 */
-#define PR_64		0x04 /* prescaler set to 64 */
-#define PR_128		0x05 /* prescaler set to 128 */
-#define PR_256		0x06 /* prescaler set to 256 */
+#define PR_SHIFT	2
 
 /* IWDG_RLR register values */
-#define RLR_MIN		0x07C /* min value supported by reload register */
-#define RLR_MAX		0xFFF /* max value supported by reload register */
+#define RLR_MAX		GENMASK(11, 0) /* max value of reload register */
 
 /* IWDG_SR register bit mask */
 #define FLAG_PVU	BIT(0) /* Watchdog prescaler value update */
@@ -55,15 +47,28 @@
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
 
-#define HAS_PCLK	true
+struct stm32_iwdg_data {
+	bool has_pclk;
+	u32 max_prescaler;
+};
+
+static const struct stm32_iwdg_data stm32_iwdg_data = {
+	.has_pclk = false,
+	.max_prescaler = 256,
+};
+
+static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
+	.has_pclk = true,
+	.max_prescaler = 1024,
+};
 
 struct stm32_iwdg {
 	struct watchdog_device	wdd;
+	const struct stm32_iwdg_data *data;
 	void __iomem		*regs;
 	struct clk		*clk_lsi;
 	struct clk		*clk_pclk;
 	unsigned int		rate;
-	bool			has_pclk;
 };
 
 static inline u32 reg_read(void __iomem *base, u32 reg)
@@ -80,21 +85,30 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
 	u32 val = FLAG_PVU | FLAG_RVU;
-	u32 reload;
+	u32 timeout, presc, iwdg_rlr, iwdg_pr;
 	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
-	/* prescaler fixed to 256 */
-	reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
-			 RLR_MIN, RLR_MAX);
+	timeout = clamp_t(unsigned int, wdd->timeout,
+			  wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
+
+	if (timeout != wdd->timeout)
+		dev_warn(wdd->parent, "timeout skrinked to %d\n", timeout);
+
+	presc = DIV_ROUND_UP(timeout * wdt->rate, RLR_MAX + 1);
+
+	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
+	presc = roundup_pow_of_two(presc);
+	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
+	iwdg_rlr = ((timeout * wdt->rate) / presc) - 1;
 
 	/* enable write access */
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
 
 	/* set prescaler & reload registers */
-	reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
-	reg_write(wdt->regs, IWDG_RLR, reload);
+	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
+	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
@@ -150,7 +164,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	}
 
 	/* optional peripheral clock */
-	if (wdt->has_pclk) {
+	if (wdt->data->has_pclk) {
 		wdt->clk_pclk = devm_clk_get(&pdev->dev, "pclk");
 		if (IS_ERR(wdt->clk_pclk)) {
 			dev_err(&pdev->dev, "Unable to get pclk clock\n");
@@ -191,8 +205,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
 };
 
 static const struct of_device_id stm32_iwdg_of_match[] = {
-	{ .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
-	{ .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
+	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
+	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
 	{ /* end node */ }
 };
 MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
@@ -200,20 +214,17 @@ MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
 static int stm32_iwdg_probe(struct platform_device *pdev)
 {
 	struct watchdog_device *wdd;
-	const struct of_device_id *match;
 	struct stm32_iwdg *wdt;
 	struct resource *res;
 	int ret;
 
-	match = of_match_device(stm32_iwdg_of_match, &pdev->dev);
-	if (!match)
-		return -ENODEV;
-
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
 
-	wdt->has_pclk = match->data;
+	wdt->data = of_device_get_match_data(&pdev->dev);
+	if (!wdt->data)
+		return -ENODEV;
 
 	/* This is the timer base. */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -231,8 +242,9 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd = &wdt->wdd;
 	wdd->info = &stm32_iwdg_info;
 	wdd->ops = &stm32_iwdg_ops;
-	wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
-	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
+	wdd->min_timeout = 1;
+	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
+				    1000) / wdt->rate;
 	wdd->parent = &pdev->dev;
 
 	watchdog_set_drvdata(wdd, wdt);
-- 
2.7.4
