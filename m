From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [RESEND PATCH 5/6] extcon: arizona: Add support for WM8280/WM8281
Date: Tue,  3 Mar 2015 16:19:35 +0000
Message-ID: <1425399576-26428-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 63f01c4..6b5e795 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1149,6 +1149,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		}
 		break;
 	case WM5110:
+	case WM8280:
 		switch (arizona->rev) {
 		case 0 ... 2:
 			break;
-- 
1.7.2.5
