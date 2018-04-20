Return-Path: <SRS0=Yg38=HJ=rock-chips.com=shawn.lin@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v3 2/2] mmc: core: Add tunable delay before detecting card after card is inserted
Date: Fri, 20 Apr 2018 14:59:15 +0800
Message-Id: <1524207555-165403-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1524207555-165403-1-git-send-email-shawn.lin@rock-chips.com>
References: <1524207555-165403-1-git-send-email-shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

Allow to use tunable delay before detecting card after card is inserted,
which either comes from firmware node, or comes from debounce value
passed on to mmc_gpiod_request_cd(). If the platform doesn't support
debounce, then we fall back to use the debounce period as the delay,
otherwise, it behaves the same as before that a HW debounce(if set) plus
a 200ms hardcode delay before detecting the card.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v3: None
Changes in v2:
- doesn't introduce new agrument for mmc_gpiod_request_cd and drop
  the change for host drivers

 drivers/mmc/core/host.c      | 7 +++++--
 drivers/mmc/core/slot-gpio.c | 9 +++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 64b03d6..d281cbf 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -179,7 +179,7 @@ static void mmc_retune_timer(struct timer_list *t)
 int mmc_of_parse(struct mmc_host *host)
 {
 	struct device *dev = host->parent;
-	u32 bus_width, drv_type;
+	u32 bus_width, drv_type, cd_delay_ms;
 	int ret;
 	bool cd_cap_invert, cd_gpio_invert = false;
 	bool ro_cap_invert, ro_gpio_invert = false;
@@ -230,11 +230,14 @@ int mmc_of_parse(struct mmc_host *host)
 	} else {
 		cd_cap_invert = device_property_read_bool(dev, "cd-inverted");
 
+		if (device_property_read_u32(dev, "cd-delay-ms", &cd_delay_ms))
+			cd_delay_ms = 200;
+
 		if (device_property_read_bool(dev, "broken-cd"))
 			host->caps |= MMC_CAP_NEEDS_POLL;
 
 		ret = mmc_gpiod_request_cd(host, "cd", 0, true,
-					   0, &cd_gpio_invert);
+					   cd_delay_ms, &cd_gpio_invert);
 		if (!ret)
 			dev_info(host->parent, "Got CD GPIO\n");
 		else if (ret != -ENOENT && ret != -ENOSYS)
diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 31f7dbb..2ef41be 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -28,15 +28,17 @@ struct mmc_gpio {
 	irqreturn_t (*cd_gpio_isr)(int irq, void *dev_id);
 	char *ro_label;
 	char cd_label[0];
+	u32 cd_delay_ms;
 };
 
 static irqreturn_t mmc_gpio_cd_irqt(int irq, void *dev_id)
 {
 	/* Schedule a card detection after a debounce timeout */
 	struct mmc_host *host = dev_id;
+	struct mmc_gpio *ctx = host->slot.handler_priv;
 
 	host->trigger_card_event = true;
-	mmc_detect_change(host, msecs_to_jiffies(200));
+	mmc_detect_change(host, msecs_to_jiffies(ctx->cd_delay_ms));
 
 	return IRQ_HANDLED;
 }
@@ -49,6 +51,7 @@ int mmc_gpio_alloc(struct mmc_host *host)
 
 	if (ctx) {
 		ctx->ro_label = ctx->cd_label + len;
+		ctx->cd_delay_ms = 200;
 		snprintf(ctx->cd_label, len, "%s cd", dev_name(host->parent));
 		snprintf(ctx->ro_label, len, "%s ro", dev_name(host->parent));
 		host->slot.handler_priv = ctx;
@@ -239,6 +242,8 @@ int mmc_gpio_request_cd(struct mmc_host *host, unsigned int gpio,
  * @debounce: debounce time in microseconds
  * @gpio_invert: will return whether the GPIO line is inverted or not, set
  * to NULL to ignore
+ * @cd_delay_ms: delay time in ms before detecting card after card insert
+ * event
  *
  * Use this function in place of mmc_gpio_request_cd() to use the GPIO
  * descriptor API.  Note that it must be called prior to mmc_add_host()
@@ -261,7 +266,7 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 	if (debounce) {
 		ret = gpiod_set_debounce(desc, debounce);
 		if (ret < 0)
-			return ret;
+			ctx->cd_delay_ms = debounce;
 	}
 
 	if (gpio_invert)
-- 
1.9.1
