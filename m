From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5 v10] ARM: davinci: defined missing CFGCHIP2_REFFREQ_* macros for MUSB PHY
Date: Fri, 11 Mar 2016 09:29:48 +0100
Message-ID: <1457684989-13318-4-git-send-email-petr@barix.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457684989-13318-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Only few MUSB PHY reference clock  frequencies were defined.
This patch defines macros for the missing frequencies:
19.2MHz, 38.4MHz, 13MHz, 26MHz, 20MHz, 40MHz

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Acked-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
---
v5: <initial>
v6: <no change>
v7: <no change>
v8: <no change>
v9: <no change>
v10: <no change>

 include/linux/platform_data/usb-davinci.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/platform_data/usb-davinci.h b/include/linux/platform_data/usb-davinci.h
index e0bc4ab..961d3dc 100644
--- a/include/linux/platform_data/usb-davinci.h
+++ b/include/linux/platform_data/usb-davinci.h
@@ -33,6 +33,12 @@
 #define CFGCHIP2_REFFREQ_12MHZ	(1 << 0)
 #define CFGCHIP2_REFFREQ_24MHZ	(2 << 0)
 #define CFGCHIP2_REFFREQ_48MHZ	(3 << 0)
+#define CFGCHIP2_REFFREQ_19_2MHZ	(4 << 0)
+#define CFGCHIP2_REFFREQ_38_4MHZ	(5 << 0)
+#define CFGCHIP2_REFFREQ_13MHZ	(6 << 0)
+#define CFGCHIP2_REFFREQ_26MHZ	(7 << 0)
+#define CFGCHIP2_REFFREQ_20MHZ	(8 << 0)
+#define CFGCHIP2_REFFREQ_40MHZ	(9 << 0)
 
 struct	da8xx_ohci_root_hub;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
