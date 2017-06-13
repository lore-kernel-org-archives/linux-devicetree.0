From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/4] MAINTAINERS: Add entry for Synopsys Designware HDMI drivers
Date: Tue, 13 Jun 2017 11:01:17 +0100
Message-ID: <d42119a9ac27cbee7dd53b083e3e19edba88ecc8.1497347657.git.joabreu@synopsys.com>
References: <cover.1497347657.git.joabreu@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497347657.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
In-Reply-To: <cover.1497347657.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
References: <cover.1497347657.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a entry for Synopsys Designware HDMI Receivers drivers
and phys.

Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 053c3bd..e798040 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11294,6 +11294,13 @@ L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Supported
 F:	drivers/net/ethernet/synopsys/
 
+SYNOPSYS DESIGNWARE HDMI RECEIVERS AND PHY DRIVERS
+M:	Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
+L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+F:	drivers/media/platform/dwc/*
+F:	include/media/dwc/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 R:	Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
