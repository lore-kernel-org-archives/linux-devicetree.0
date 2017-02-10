From: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH INTERNAL 2/2] bus: arm-ccn: Enable stats for CCN-502 interconnect
Date: Fri, 10 Feb 2017 12:36:27 -0800
Message-ID: <1486758987-23769-3-git-send-email-velibor.markovski@broadcom.com>
References: <1486758987-23769-1-git-send-email-velibor.markovski@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486758987-23769-1-git-send-email-velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatible string for the ARM CCN-502 interconnect

Signed-off-by: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/bus/arm-ccn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
index 4d6a2b7..98a6995 100644
--- a/drivers/bus/arm-ccn.c
+++ b/drivers/bus/arm-ccn.c
@@ -1544,6 +1544,7 @@ static int arm_ccn_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id arm_ccn_match[] = {
+	{ .compatible = "arm,ccn-502", },
 	{ .compatible = "arm,ccn-504", },
 	{},
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
