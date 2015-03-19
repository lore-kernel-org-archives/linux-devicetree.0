From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 08/12] usb: chipidea: add ahb burst configuration
Date: Thu, 19 Mar 2015 09:19:19 +0800
Message-ID: <1426727963-32280-9-git-send-email-peter.chen@freescale.com>
References: <1426727963-32280-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426727963-32280-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The users can change it through dts or platform data if they
want to change the default value.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/bits.h  |  3 +++
 drivers/usb/chipidea/core.c  | 18 ++++++++++++++++++
 include/linux/usb/chipidea.h |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
index 3cb9bda..3af6213 100644
--- a/drivers/usb/chipidea/bits.h
+++ b/drivers/usb/chipidea/bits.h
@@ -25,6 +25,9 @@
 #define VERSION		      (0xF << 25)
 #define CIVERSION	      (0x7 << 29)
 
+/* SBUSCFG */
+#define AHBBRST_MASK  0x7
+
 /* HCCPARAMS */
 #define HCCPARAMS_LEN         BIT(17)
 
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index f713e32..c0e6bb1 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -412,6 +412,8 @@ static int ci_usb_phy_init(struct ci_hdrc *ci)
  */
 void ci_platform_config(struct ci_hdrc *ci, int usb_mode)
 {
+	bool override_needed;
+
 	if (usb_mode == USBMODE_CM_DC) {
 		if (ci->platdata->flags & CI_HDRC_DISABLE_DEVICE_STREAMING)
 			hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS,
@@ -439,6 +441,12 @@ void ci_platform_config(struct ci_hdrc *ci, int usb_mode)
 			hw_write(ci, OP_PORTSC, PORTSC_PFSC, PORTSC_PFSC);
 	}
 
+	/* Override AHB burst configuration if needed */
+	override_needed = hw_read_id_reg(ci, ID_SBUSCFG, AHBBRST_MASK) !=
+		(ci->platdata->ahbburst_config & AHBBRST_MASK);
+	if (override_needed)
+		hw_write_id_reg(ci, ID_SBUSCFG, AHBBRST_MASK,
+			ci->platdata->ahbburst_config);
 }
 
 /**
@@ -633,6 +641,16 @@ static int ci_get_platdata(struct device *dev,
 		}
 	}
 
+	if (of_find_property(dev->of_node, "ahb-burst-config", NULL)) {
+		ret = of_property_read_u32(dev->of_node, "ahb-burst-config",
+			&platdata->ahbburst_config);
+		if (ret) {
+			dev_err(dev,
+				"failed to get ahb-burst-config value\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index d3906a4..4d7ceb3 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -32,6 +32,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_DISABLE_HOST_STREAMING		BIT(9)
 #define CI_HDRC_DISABLE_STREAMING (CI_HDRC_DISABLE_DEVICE_STREAMING |	\
 		CI_HDRC_DISABLE_HOST_STREAMING)
+#define CI_HDRC_OVERRIDE_AHB_BURST		BIT(10)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
@@ -40,6 +41,7 @@ struct ci_hdrc_platform_data {
 	bool			tpl_support;
 	/* interrupt threshold value for gadget */
 	u32			gadget_itc_setting;
+	u32			ahbburst_config;
 };
 
 /* Default offset of capability registers */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
