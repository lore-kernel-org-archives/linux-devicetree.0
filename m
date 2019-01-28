From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 1/3] RTC: Ingenic: Add support for the X1000.
Date: Tue, 29 Jan 2019 01:29:57 +0800
Message-ID: <1548696599-53639-2-git-send-email-zhouyanjie@zoho.com>
References: <1548696599-53639-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548696599-53639-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

Add support for probing the rtc-jz4740 driver on the
X1000 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/rtc/rtc-jz4740.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index d0a8917..0c7ae65 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -34,7 +34,7 @@
 #define JZ_REG_RTC_RESET_COUNTER	0x28
 #define JZ_REG_RTC_SCRATCHPAD	0x34
 
-/* The following are present on the jz4780 */
+/* The following are present on the jz4780 and x1000 */
 #define JZ_REG_RTC_WENR	0x3C
 #define JZ_RTC_WENR_WEN	BIT(31)
 
@@ -46,7 +46,7 @@
 #define JZ_RTC_CTRL_AE		BIT(2)
 #define JZ_RTC_CTRL_ENABLE	BIT(0)
 
-/* Magic value to enable writes on jz4780 */
+/* Magic value to enable writes on jz4780 and x1000 */
 #define JZ_RTC_WENR_MAGIC	0xA55A
 
 #define JZ_RTC_WAKEUP_FILTER_MASK	0x0000FFE0
@@ -55,6 +55,7 @@
 enum jz4740_rtc_type {
 	ID_JZ4740,
 	ID_JZ4780,
+	ID_X1000,
 };
 
 struct jz4740_rtc {
@@ -301,6 +302,7 @@ static void jz4740_rtc_power_off(void)
 static const struct of_device_id jz4740_rtc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-rtc", .data = (void *)ID_JZ4740 },
 	{ .compatible = "ingenic,jz4780-rtc", .data = (void *)ID_JZ4780 },
+	{ .compatible = "ingenic,x1000-rtc", .data = (void *)ID_X1000 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, jz4740_rtc_of_match);
@@ -429,6 +431,7 @@ static const struct dev_pm_ops jz4740_pm_ops = {
 static const struct platform_device_id jz4740_rtc_ids[] = {
 	{ "jz4740-rtc", ID_JZ4740 },
 	{ "jz4780-rtc", ID_JZ4780 },
+	{ "x1000-rtc", ID_X1000 },
 	{}
 };
 MODULE_DEVICE_TABLE(platform, jz4740_rtc_ids);
-- 
2.7.4
