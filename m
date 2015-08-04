From: Scott Shu <scott.shu@mediatek.com>
Subject: [PATCH v3 6/8] ARM: Mediatek: enable GPT6 on boot up to make arch timer working for MT6580
Date: Tue, 4 Aug 2015 21:54:22 +0800
Message-ID: <1438696464-59858-7-git-send-email-scott.shu@mediatek.com>
References: <1438696464-59858-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438696464-59858-1-git-send-email-scott.shu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, loda.chou@mediatek.com, jades.shih@mediatek.com, Mars.Cheng@mediatek.com, scott.shu@gmail.com, Scott Shu <scott.shu@mediatek.com>
List-Id: devicetree@vger.kernel.org

We enable GTP6 which ungates the arch timer clock.

Signed-off-by: Scott Shu <scott.shu@mediatek.com>
---
 arch/arm/mach-mediatek/mediatek.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index 6b38d67..469d332 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -28,7 +28,8 @@ static void __init mediatek_timer_init(void)
 {
 	void __iomem *gpt_base = 0;
 
-	if (of_machine_is_compatible("mediatek,mt6589") ||
+	if (of_machine_is_compatible("mediatek,mt6580") ||
+	    of_machine_is_compatible("mediatek,mt6589") ||
 	    of_machine_is_compatible("mediatek,mt8135") ||
 	    of_machine_is_compatible("mediatek,mt8127")) {
 		/* turn on GPT6 which ungates arch timer clocks */
@@ -46,6 +47,7 @@ static void __init mediatek_timer_init(void)
 };
 
 static const char * const mediatek_board_dt_compat[] = {
+	"mediatek,mt6580",
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt8127",
-- 
1.7.9.5
