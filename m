From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [RESEND PATCH 3/6] regulator: arizona-micsupp: Add support for WM8280/WM8281
Date: Tue,  3 Mar 2015 16:19:33 +0000
Message-ID: <1425399576-26428-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/regulator/arizona-micsupp.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/arizona-micsupp.c b/drivers/regulator/arizona-micsupp.c
index 2007900..bfe5dac 100644
--- a/drivers/regulator/arizona-micsupp.c
+++ b/drivers/regulator/arizona-micsupp.c
@@ -246,6 +246,7 @@ static int arizona_micsupp_probe(struct platform_device *pdev)
 	 */
 	switch (arizona->type) {
 	case WM5110:
+	case WM8280:
 		desc = &arizona_micsupp_ext;
 		micsupp->init_data = arizona_micsupp_ext_default;
 		break;
-- 
1.7.2.5
