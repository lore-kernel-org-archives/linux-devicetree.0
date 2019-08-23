From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v5 01/10] mfd: mt6397: clean up code
Date: Fri, 23 Aug 2019 11:45:22 +0800
Message-ID: <1566531931-9772-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

refine some variable name for more readable

Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 337bccc..c070862 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -10,17 +10,17 @@
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/mfd/core.h>
-#include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6323/core.h>
-#include <linux/mfd/mt6397/registers.h>
+#include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6397/registers.h>
 
 #define MT6397_RTC_BASE		0xe000
 #define MT6397_RTC_SIZE		0x3e
 
-#define MT6323_CID_CODE		0x23
-#define MT6391_CID_CODE		0x91
-#define MT6397_CID_CODE		0x97
+#define MT6323_CHIP_ID		0x23
+#define MT6391_CHIP_ID		0x91
+#define MT6397_CHIP_ID		0x97
 
 static const struct resource mt6397_rtc_resources[] = {
 	{
@@ -290,7 +290,7 @@ static int mt6397_probe(struct platform_device *pdev)
 		return pmic->irq;
 
 	switch (id & 0xff) {
-	case MT6323_CID_CODE:
+	case MT6323_CHIP_ID:
 		pmic->int_con[0] = MT6323_INT_CON0;
 		pmic->int_con[1] = MT6323_INT_CON1;
 		pmic->int_status[0] = MT6323_INT_STATUS0;
@@ -304,8 +304,8 @@ static int mt6397_probe(struct platform_device *pdev)
 					   0, pmic->irq_domain);
 		break;
 
-	case MT6397_CID_CODE:
-	case MT6391_CID_CODE:
+	case MT6391_CHIP_ID:
+	case MT6397_CHIP_ID:
 		pmic->int_con[0] = MT6397_INT_CON0;
 		pmic->int_con[1] = MT6397_INT_CON1;
 		pmic->int_status[0] = MT6397_INT_STATUS0;
-- 
1.9.1
