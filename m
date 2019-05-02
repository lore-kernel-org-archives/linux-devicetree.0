From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH V2 2/3] watchdog: stm32: update return values recommended by watchdog kernel api
Date: Thu, 2 May 2019 16:08:45 +0200
Message-ID: <1556806126-15890-3-git-send-email-ludovic.Barre@st.com>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch updates return values on watchdog-kernel-api.txt:
return 0 on succes, -EINVAL for "parameter out of range"
and -EIO for "could not write value to the watchdog".

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index e191bd8..f19a6d4 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -81,7 +81,6 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
 	u32 val = FLAG_PVU | FLAG_RVU;
 	u32 reload;
-	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
@@ -98,13 +97,11 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
-	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
-					 !(val & (FLAG_PVU | FLAG_RVU)),
-					 SLEEP_US, TIMEOUT_US);
-	if (ret) {
-		dev_err(wdd->parent,
-			"Fail to set prescaler or reload registers\n");
-		return ret;
+	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
+				       !(val & (FLAG_PVU | FLAG_RVU)),
+				       SLEEP_US, TIMEOUT_US)) {
+		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
+		return -EIO;
 	}
 
 	/* reload watchdog */
@@ -128,8 +125,16 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
 static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
 				  unsigned int timeout)
 {
+	unsigned int tout = clamp(timeout, wdd->min_timeout,
+				  wdd->max_hw_heartbeat_ms / 1000);
+
 	dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
 
+	if (tout != timeout) {
+		dev_err(wdd->parent, "parameter out of range\n");
+		return -EINVAL;
+	}
+
 	wdd->timeout = timeout;
 
 	if (watchdog_active(wdd))
-- 
2.7.4
