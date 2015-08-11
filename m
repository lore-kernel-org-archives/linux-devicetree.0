From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [RFC PATCH v1] mmc: sdhci-of-arasan: Add the support for sdhci-5.1
Date: Tue, 11 Aug 2015 15:57:05 +0800
Message-ID: <1439279825-9647-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, soren.brinkmann@xilinx.com
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch adds the compatible string in sdhci-of-arasan.c to
support sdhci-arasan5.1 version of controller. No documented
controller IP version is found in the TRM, so we use ths version
of command queueing engine integrated into this controller by arasan
to specify our controller.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v1:
- Remove redundant SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN for "arasan, sdhci-5.1" since
  SDHCI will check "host->max_clk == 0" and let driver get it from host->ops->get_max_clock.

 Documentation/devicetree/bindings/mmc/arasan,sdhci.txt | 2 +-
 drivers/mmc/host/sdhci-of-arasan.c                     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
index 7e94903..da541c3 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
@@ -9,7 +9,7 @@ Device Tree Bindings for the Arasan SDHCI Controller
 
 Required Properties:
   - compatible: Compatibility string. Must be 'arasan,sdhci-8.9a' or
-                'arasan,sdhci-4.9a'
+                'arasan,sdhci-4.9a' or 'arasan,sdhci-5.1'
   - reg: From mmc bindings: Register location and length.
   - clocks: From clock bindings: Handles to clock inputs.
   - clock-names: From clock bindings: Tuple including "clk_xin" and "clk_ahb"
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index ef5a7d2..75379cb 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -217,6 +217,7 @@ static int sdhci_arasan_remove(struct platform_device *pdev)
 
 static const struct of_device_id sdhci_arasan_of_match[] = {
 	{ .compatible = "arasan,sdhci-8.9a" },
+	{ .compatible = "arasan,sdhci-5.1" },
 	{ .compatible = "arasan,sdhci-4.9a" },
 	{ }
 };
-- 
2.3.7


