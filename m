From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] rtc: ds1302: fix write value for day of week register
Date: Sun, 10 Apr 2016 23:59:24 +0900
Message-ID: <1460300366-25248-3-git-send-email-akinobu.mita@gmail.com>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460300366-25248-1-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The valid range of day of week register for DS1302 is 1 to 7.  But the
set_time callback for rtc-ds1302 attempts to write the value of
tm->tm_wday which is in the range 0 to 6.  While the get_time callback
correctly decodes the register.

Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/rtc/rtc-ds1302.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
index 5e05653..454248f 100644
--- a/drivers/rtc/rtc-ds1302.c
+++ b/drivers/rtc/rtc-ds1302.c
@@ -66,7 +66,7 @@ static int ds1302_rtc_set_time(struct device *dev, struct rtc_time *time)
 	*bp++ = bin2bcd(time->tm_hour);
 	*bp++ = bin2bcd(time->tm_mday);
 	*bp++ = bin2bcd(time->tm_mon + 1);
-	*bp++ = time->tm_wday;
+	*bp++ = time->tm_wday + 1;
 	*bp++ = bin2bcd(time->tm_year % 100);
 	*bp++ = RTC_CMD_WRITE_DISABLE;
 
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
