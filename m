From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 3/3] mmc: core: Add DT bindings for eMMC HS200 1.8/1.2V
Date: Fri, 14 Feb 2014 13:27:09 +0100
Message-ID: <1392380829-8473-3-git-send-email-ulf.hansson@linaro.org>
References: <1392380829-8473-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1392380829-8473-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org, Chris Ball <chris@printf.net>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jaehoon Chung <jh80.chung@samsung.com>

Provide the option to configure these speed modes per host, for those
host driver's that can't distinguish this in runtime.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc.txt |    2 ++
 drivers/mmc/core/host.c                       |    4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index 519d952..9dce540 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -36,6 +36,8 @@ Optional properties:
 - full-pwr-cycle: full power cycle of the card is supported
 - mmc-highspeed-ddr-1_8v: eMMC high-speed DDR mode(1.8V I/O) is supported
 - mmc-highspeed-ddr-1_2v: eMMC high-speed DDR mode(1.2V I/O) is supported
+- mmc-hs200-1_8v: eMMC HS200 mode(1.8V I/O) is supported
+- mmc-hs200-1_2v: eMMC HS200 mode(1.2V I/O) is supported
 
 *NOTE* on CD and WP polarity. To use common for all SD/MMC host controllers line
 polarity properties, we have to fix the meaning of the "normal" and "inverted"
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index d014127..453573d 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -443,6 +443,10 @@ int mmc_of_parse(struct mmc_host *host)
 		host->caps |= MMC_CAP_1_8V_DDR;
 	if (of_find_property(np, "mmc-ddr-1_2v", &len))
 		host->caps |= MMC_CAP_1_2V_DDR;
+	if (of_find_property(np, "mmc-hs200-1_8v", &len))
+		host->caps2 |= MMC_CAP2_HS200_1_8V_SDR;
+	if (of_find_property(np, "mmc-hs200-1_2v", &len))
+		host->caps2 |= MMC_CAP2_HS200_1_2V_SDR;
 
 	return 0;
 
-- 
1.7.9.5

