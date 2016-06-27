From: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v5 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU driver
Date: Mon, 27 Jun 2016 14:54:15 -0700
Message-ID: <1467064458-22143-2-git-send-email-ttnguyen@apm.com>
References: <1467064458-22143-1-git-send-email-ttnguyen@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467064458-22143-1-git-send-email-ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4978dc1..3bd4143 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8593,6 +8593,14 @@ L:	linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Supported
 F:	drivers/scsi/pm8001/
 
+PMU-XGENE
+APPLIED MICRO (APM) X-GENE SOC PMU
+M:	Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
+S:	Supported
+F:	drivers/perf/xgene_pmu.c
+F:	Documentation/perf/xgene-pmu.txt
+F:	Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
+
 POSIX CLOCKS and TIMERS
 M:	Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
 L:	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
