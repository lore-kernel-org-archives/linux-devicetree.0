From: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [RFC PATCH 1/4] arm64: defconfig: increase NR_CPUS range to 2-128
Date: Thu, 25 Sep 2014 14:33:56 +0530
Message-ID: <1411635840-24038-2-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
References: <1411635840-24038-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411635840-24038-1-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Raising the maximum limit to 128. This is needed for Cavium's
Thunder systems that will have 96 cores on Multi-node system.

Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 4d42453..a409105 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -296,8 +296,8 @@ config SCHED_SMT
 	  places. If unsure say N here.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-64)"
-	range 2 64
+	int "Maximum number of CPUs (2-128)"
+	range 2 128
 	depends on SMP
 	# These have to remain sorted largest to smallest
 	default "64"
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
