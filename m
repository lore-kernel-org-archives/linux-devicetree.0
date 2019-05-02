From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH V2 1/3] watchdog: stm32: update to devm_watchdog_register_device
Date: Thu, 2 May 2019 16:08:44 +0200
Message-ID: <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
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

This patch updates to devm_watchdog_register_device interface

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index e00e3b3..e191bd8 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "unable to set timeout value, using default\n");
 
-	ret = watchdog_register_device(wdd);
+	ret = devm_watchdog_register_device(&pdev->dev, wdd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register watchdog device\n");
 		goto err;
@@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
 {
 	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
 
-	watchdog_unregister_device(&wdt->wdd);
 	clk_disable_unprepare(wdt->clk_lsi);
 	clk_disable_unprepare(wdt->clk_pclk);
 
-- 
2.7.4
