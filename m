From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 4/6] mmc: debugfs: add HS400 enhanced strobe description
Date: Fri, 29 Apr 2016 10:48:12 +0800
Message-ID: <1461898092-28985-1-git-send-email-shawn.lin@rock-chips.com>
References: <1461897751-28810-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1461897751-28810-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Michal Simek <michal.simek@xilinx.com>, soren.brinkmann@xilinx.com, Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: devicetree@vger.kernel.org

We inctroduce HS400 with enhanced strobe function, so we need
add it for debug show.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

Changes in v2: None

 drivers/mmc/core/debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/debugfs.c b/drivers/mmc/core/debugfs.c
index 9382a57..51d7c38 100644
--- a/drivers/mmc/core/debugfs.c
+++ b/drivers/mmc/core/debugfs.c
@@ -148,7 +148,9 @@ static int mmc_ios_show(struct seq_file *s, void *data)
 		str = "mmc HS200";
 		break;
 	case MMC_TIMING_MMC_HS400:
-		str = "mmc HS400";
+		mmc_card_hs400es(host->card) ?
+			(str = "mmc HS400 enhanced strobe") :
+			(str = "mmc HS400");
 		break;
 	default:
 		str = "invalid";
-- 
2.3.7


