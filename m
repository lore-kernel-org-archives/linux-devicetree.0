Return-Path: <SRS0=FOmB=HB=rock-chips.com=shawn.lin@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/2] mmc: core: Add tunable delay before detecting card after card is inserted
Date: Thu, 12 Apr 2018 09:20:31 +0800
Message-Id: <1523496031-145755-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1523496031-145755-1-git-send-email-shawn.lin@rock-chips.com>
References: <1523496031-145755-1-git-send-email-shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

Allow to use tunable delay before detecting card after card is inserted
either from firmware, or argument passing to mmc_gpiod_request_cd(). The
default value is 200ms as before, if cd-delay-ms isn't present but using
mmc_gpiod_request_cd() to request slot-gpio interrupt.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/mmc/core/host.c           |  7 +++++--
 drivers/mmc/core/slot-gpio.c      | 11 +++++++++--
 drivers/mmc/host/davinci_mmc.c    |  2 +-
 drivers/mmc/host/mmci.c           |  2 +-
 drivers/mmc/host/sdhci-acpi.c     |  2 +-
 drivers/mmc/host/sdhci-pci-core.c |  3 ++-
 include/linux/mmc/slot-gpio.h     |  3 ++-
 7 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 64b03d6..cb8babc 100644
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
+					   0, &cd_gpio_invert, cd_delay_ms);
 		if (!ret)
 			dev_info(host->parent, "Got CD GPIO\n");
 		else if (ret != -ENOENT && ret != -ENOSYS)
diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 31f7dbb..baa6e8d 100644
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
@@ -248,7 +253,8 @@ int mmc_gpio_request_cd(struct mmc_host *host, unsigned int gpio,
  */
 int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, bool override_active_level,
-			 unsigned int debounce, bool *gpio_invert)
+			 unsigned int debounce, bool *gpio_invert,
+			 u32 cd_delay_ms)
 {
 	struct mmc_gpio *ctx = host->slot.handler_priv;
 	struct gpio_desc *desc;
@@ -269,6 +275,7 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 
 	ctx->override_cd_active_level = override_active_level;
 	ctx->cd_gpio = desc;
+	ctx->cd_delay_ms = cd_delay_ms;
 
 	return 0;
 }
diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 8e36317..fcff397 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1187,7 +1187,7 @@ static int mmc_davinci_parse_pdata(struct mmc_host *mmc)
 		mmc->caps |= pdata->caps;
 
 	/* Register a cd gpio, if there is not one, enable polling */
-	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL, 200);
 	if (ret == -EPROBE_DEFER)
 		return ret;
 	else if (ret)
diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 70b0df8..0771c4f 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1827,7 +1827,7 @@ static int mmci_probe(struct amba_device *dev,
 	 * silently of these do not exist and proceed to try platform data
 	 */
 	if (!np) {
-		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL, 200);
 		if (ret < 0) {
 			if (ret == -EPROBE_DEFER)
 				goto clk_disable;
diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index 32321bd..4157a29 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -718,7 +718,7 @@ static int sdhci_acpi_probe(struct platform_device *pdev)
 	if (sdhci_acpi_flag(c, SDHCI_ACPI_SD_CD)) {
 		bool v = sdhci_acpi_flag(c, SDHCI_ACPI_SD_CD_OVERRIDE_LEVEL);
 
-		err = mmc_gpiod_request_cd(host->mmc, NULL, 0, v, 0, NULL);
+		err = mmc_gpiod_request_cd(host->mmc, NULL, 0, v, 0, NULL, 200);
 		if (err) {
 			if (err == -EPROBE_DEFER)
 				goto err_free;
diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index 787434e..7842a67 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -1715,7 +1715,8 @@ static struct sdhci_pci_slot *sdhci_pci_probe_slot(
 
 	if (slot->cd_idx >= 0) {
 		ret = mmc_gpiod_request_cd(host->mmc, NULL, slot->cd_idx,
-					   slot->cd_override_level, 0, NULL);
+					   slot->cd_override_level, 0, NULL,
+					   200);
 		if (ret == -EPROBE_DEFER)
 			goto remove;
 
diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
index 06607c5..b13f3a9 100644
--- a/include/linux/mmc/slot-gpio.h
+++ b/include/linux/mmc/slot-gpio.h
@@ -25,7 +25,8 @@ int mmc_gpio_request_cd(struct mmc_host *host, unsigned int gpio,
 
 int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, bool override_active_level,
-			 unsigned int debounce, bool *gpio_invert);
+			 unsigned int debounce, bool *gpio_invert,
+			 u32 cd_delay);
 int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, bool override_active_level,
 			 unsigned int debounce, bool *gpio_invert);
-- 
1.9.1
