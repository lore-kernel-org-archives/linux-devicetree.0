From: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/4] rtc: rv8803: add device tree compatible names
Date: Tue, 21 Jun 2016 08:57:19 +0200
Message-ID: <1466492240-5528-3-git-send-email-dirk.behme@de.bosch.com>
References: <1466492240-5528-1-git-send-email-dirk.behme@de.bosch.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDCMXBNSKAINLSVDXMCRUBAK7PRJO-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1466492240-5528-1-git-send-email-dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Knut Wohlrab <Knut.Wohlrab-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Knut Wohlrab <Knut.Wohlrab-V5te9oGctAVWk0Htik3J/w@public.gmane.org>

Add device tree compatible names for usage in a compatible
list of alternative RTC devices.

Signed-off-by: Knut Wohlrab <Knut.Wohlrab-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/rtc/rtc-rv8803.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index f623038..62baddd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/rtc.h>
+#include <linux/of.h>
 
 #define RV8803_SEC			0x00
 #define RV8803_MIN			0x01
@@ -520,9 +521,19 @@ static const struct i2c_device_id rv8803_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rv8803_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id rv8803_of_match[] = {
+	{ .compatible = "mc,rv8803", },
+	{ .compatible = "epson,rx8900", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rv8803_of_match);
+#endif
+
 static struct i2c_driver rv8803_driver = {
 	.driver = {
 		.name = "rtc-rv8803",
+		.of_match_table = of_match_ptr(rv8803_of_match),
 	},
 	.probe		= rv8803_probe,
 	.remove		= rv8803_remove,
-- 
2.8.0

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
