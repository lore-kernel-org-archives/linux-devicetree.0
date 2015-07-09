From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6] mfd: 88pm80x: Add 88pm860 chip type support
Date: Thu,  9 Jul 2015 17:17:06 +0530
Message-ID: <1436442431-3471-2-git-send-email-vaibhav.hiremath@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436442431-3471-1-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add chip identification support for 88PM860 device
to the pm80x_chip_mapping table.

Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/88pm80x.c       | 2 ++
 include/linux/mfd/88pm80x.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
index 5e72f65..63445ea 100644
--- a/drivers/mfd/88pm80x.c
+++ b/drivers/mfd/88pm80x.c
@@ -33,6 +33,8 @@ static struct pm80x_chip_mapping chip_mapping[] = {
 	{0x3,	CHIP_PM800},
 	/* 88PM805 chip id number */
 	{0x0,	CHIP_PM805},
+	/* 88PM860 chip id number */
+	{0x4,	CHIP_PM860},
 };
 
 /*
diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
index 9c5773b..2e25fb1 100644
--- a/include/linux/mfd/88pm80x.h
+++ b/include/linux/mfd/88pm80x.h
@@ -21,6 +21,7 @@ enum {
 	CHIP_INVALID = 0,
 	CHIP_PM800,
 	CHIP_PM805,
+	CHIP_PM860,
 	CHIP_MAX,
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
