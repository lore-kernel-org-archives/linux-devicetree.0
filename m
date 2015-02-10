From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 4/5] usb: phy: load usb phy earlier
Date: Tue, 10 Feb 2015 15:50:26 +0800
Message-ID: <1423554627-694-5-git-send-email-zhangfei.gao@linaro.org>
References: <1423554627-694-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423554627-694-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since phy is definitely used in usb controller, load the phy
earlier to make boot time shorter.

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 2f1e2aa..d8926c6 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -5,6 +5,7 @@
 # Object files in subdirectories
 
 obj-$(CONFIG_USB)		+= core/
+obj-$(CONFIG_USB_SUPPORT)	+= phy/
 
 obj-$(CONFIG_USB_DWC3)		+= dwc3/
 obj-$(CONFIG_USB_DWC2)		+= dwc2/
@@ -48,7 +49,6 @@ obj-$(CONFIG_USB_MICROTEK)	+= image/
 obj-$(CONFIG_USB_SERIAL)	+= serial/
 
 obj-$(CONFIG_USB)		+= misc/
-obj-$(CONFIG_USB_SUPPORT)	+= phy/
 obj-$(CONFIG_EARLY_PRINTK_DBGP)	+= early/
 
 obj-$(CONFIG_USB_ATM)		+= atm/
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
