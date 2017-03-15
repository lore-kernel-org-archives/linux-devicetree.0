From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 3/3] MAINTAINERS: Broadcom Vulcan is now Cavium ThunderX2
Date: Wed, 15 Mar 2017 20:11:02 +0000
Message-ID: <1489608662-4434-4-git-send-email-jnair@caviumnetworks.com>
References: <1489495634-2920-1-git-send-email-jnair@caviumnetworks.com>
 <1489608662-4434-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489608662-4434-1-git-send-email-jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that the dts files are moved to the new location, we can remove
the Broadcom Vulcan entry in the MAINTAINERS.

Also fix up the Cavium ThunderX2 entry with the correct pattern for
the new names.

Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
---
 MAINTAINERS | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c776906..81a1f2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2838,13 +2838,6 @@ L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Supported
 F:	drivers/net/ethernet/broadcom/bcmsysport.*
 
-BROADCOM VULCAN ARM64 SOC
-M:	Jayachandran C. <c.jayachandran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
-M:	bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
-L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm64/boot/dts/broadcom/vulcan*
-
 BROADCOM NETXTREME-E ROCE DRIVER
 M:	Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
 M:	Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
@@ -3030,7 +3023,7 @@ CAVIUM THUNDERX2 ARM64 SOC
 M:	Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
 S:	Maintained
-F:	arch/arm64/boot/dts/cavium/thunder-99xx*
+F:	arch/arm64/boot/dts/cavium/thunder2-99xx*
 F:	Documentation/devicetree/bindings/arm/cavium-thunder2.txt
 
 CAVIUM I2C DRIVER
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
