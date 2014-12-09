From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [REVIEW PATCH v3 02/12] smiapp: List include/uapi/linux/smiapp.h in MAINTAINERS
Date: Tue,  9 Dec 2014 02:04:10 +0200
Message-ID: <1418083460-28556-3-git-send-email-sakari.ailus@iki.fi>
References: <1418083460-28556-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1418083460-28556-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

This is part of the smiapp driver.

Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c49eb6..f2d9159 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8624,6 +8624,7 @@ F:	drivers/media/i2c/smiapp/
 F:	include/media/smiapp.h
 F:	drivers/media/i2c/smiapp-pll.c
 F:	drivers/media/i2c/smiapp-pll.h
+F:	include/uapi/linux/smiapp.h
 
 SMM665 HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
-- 
1.7.10.4
