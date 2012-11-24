From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: [PATCH 21/24] MAINTAINERS: fix drivers/rtc/rtc-sec.c
Date: Fri, 23 Nov 2012 22:26:45 -0200
Message-ID: <1353716808-16375-22-git-send-email-cesarb@cesarb.net>
References: <1353716808-16375-1-git-send-email-cesarb@cesarb.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353716808-16375-1-git-send-email-cesarb@cesarb.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Cesar Eduardo Barros <cesarb@cesarb.net>, Sangbeom Kim <sbkim73@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, rtc-linux@googlegroups.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Added by commit f69d3a1 (Add maintainer for samsung mfd driver). I could
not find any trace of that file being ever added to the repository.

I am guessing that this was a typo for rtc-s3c. Please NACK this patch
if I am wrong.

Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: rtc-linux@googlegroups.com
Cc: devicetree-discuss@lists.ozlabs.org
Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 331b3a2..fb245ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6354,7 +6354,7 @@ S:	Supported
 F:	drivers/mfd/sec*.c
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
-F:	drivers/rtc/rtc-sec.c
+F:	drivers/rtc/rtc-s3c.c
 F:	include/linux/mfd/samsung/
 
 SERIAL DRIVERS
-- 
1.7.11.7
