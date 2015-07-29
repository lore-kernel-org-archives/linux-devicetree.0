From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 10/10] usb: chipidea: add tx/rx burst size configuration interface
Date: Wed, 29 Jul 2015 10:42:14 +0800
Message-ID: <1438137734-27311-11-git-send-email-peter.chen@freescale.com>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438137734-27311-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The user can adjust it through dts or platform data

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/bits.h  |  4 ++++
 drivers/usb/chipidea/ci.h    |  1 +
 drivers/usb/chipidea/core.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/usb/chipidea.h |  4 ++++
 4 files changed, 44 insertions(+)

diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
index 462ad02..e462f55 100644
--- a/drivers/usb/chipidea/bits.h
+++ b/drivers/usb/chipidea/bits.h
@@ -61,6 +61,10 @@
 /* Set non-zero value for internal TT Hub address representation */
 #define TTCTRL_TTHA		(0x7fUL << 24)
 
+/* BURSTSIZE */
+#define RX_BURST_MASK		0xff
+#define TX_BURST_MASK		0xff00
+
 /* PORTSC */
 #define PORTSC_CCS            BIT(0)
 #define PORTSC_CSC            BIT(1)
diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index b562544..41d7cf6 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -51,6 +51,7 @@ enum ci_hw_regs {
 	OP_DEVICEADDR,
 	OP_ENDPTLISTADDR,
 	OP_TTCTRL,
+	OP_BURSTSIZE,
 	OP_PORTSC,
 	OP_DEVLC,
 	OP_OTGSC,
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index f60cbf6..0375412 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -86,6 +86,7 @@ static const u8 ci_regs_nolpm[] = {
 	[OP_DEVICEADDR]		= 0x14U,
 	[OP_ENDPTLISTADDR]	= 0x18U,
 	[OP_TTCTRL]		= 0x1CU,
+	[OP_BURSTSIZE]		= 0x20U,
 	[OP_PORTSC]		= 0x44U,
 	[OP_DEVLC]		= 0x84U,
 	[OP_OTGSC]		= 0x64U,
@@ -109,6 +110,7 @@ static const u8 ci_regs_lpm[] = {
 	[OP_DEVICEADDR]		= 0x14U,
 	[OP_ENDPTLISTADDR]	= 0x18U,
 	[OP_TTCTRL]		= 0x1CU,
+	[OP_BURSTSIZE]		= 0x20U,
 	[OP_PORTSC]		= 0x44U,
 	[OP_DEVLC]		= 0x84U,
 	[OP_OTGSC]		= 0xC4U,
@@ -442,6 +444,17 @@ void ci_platform_configure(struct ci_hdrc *ci)
 	if (ci->platdata->flags & CI_HDRC_OVERRIDE_AHB_BURST)
 		hw_write_id_reg(ci, ID_SBUSCFG, AHBBRST_MASK,
 			ci->platdata->ahb_burst_config);
+
+	/* override burst size, take effect only when ahb_burst_config is 0 */
+	if (!hw_read_id_reg(ci, ID_SBUSCFG, AHBBRST_MASK)) {
+		if (ci->platdata->flags & CI_HDRC_OVERRIDE_TX_BURST)
+			hw_write(ci, OP_BURSTSIZE, TX_BURST_MASK,
+			ci->platdata->tx_burst_size << __ffs(TX_BURST_MASK));
+
+		if (ci->platdata->flags & CI_HDRC_OVERRIDE_RX_BURST)
+			hw_write(ci, OP_BURSTSIZE, RX_BURST_MASK,
+				ci->platdata->rx_burst_size);
+	}
 }
 
 /**
@@ -661,6 +674,28 @@ static int ci_get_platdata(struct device *dev,
 		platdata->flags |= CI_HDRC_OVERRIDE_AHB_BURST;
 	}
 
+	if (of_find_property(dev->of_node, "tx-burst-size-dword", NULL)) {
+		ret = of_property_read_u32(dev->of_node, "tx-burst-size-dword",
+			&platdata->tx_burst_size);
+		if (ret) {
+			dev_err(dev,
+				"failed to get tx-burst-size-dword\n");
+			return ret;
+		}
+		platdata->flags |= CI_HDRC_OVERRIDE_TX_BURST;
+	}
+
+	if (of_find_property(dev->of_node, "rx-burst-size-dword", NULL)) {
+		ret = of_property_read_u32(dev->of_node, "rx-burst-size-dword",
+			&platdata->rx_burst_size);
+		if (ret) {
+			dev_err(dev,
+				"failed to get rx-burst-size-dword\n");
+			return ret;
+		}
+		platdata->flags |= CI_HDRC_OVERRIDE_RX_BURST;
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 9848a4e..524ef3d 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -34,6 +34,8 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_DISABLE_STREAMING (CI_HDRC_DISABLE_DEVICE_STREAMING |	\
 		CI_HDRC_DISABLE_HOST_STREAMING)
 #define CI_HDRC_OVERRIDE_AHB_BURST		BIT(11)
+#define CI_HDRC_OVERRIDE_TX_BURST		BIT(12)
+#define CI_HDRC_OVERRIDE_RX_BURST		BIT(13)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
@@ -44,6 +46,8 @@ struct ci_hdrc_platform_data {
 	/* interrupt threshold setting */
 	u32			itc_setting;
 	u32			ahb_burst_config;
+	u32			tx_burst_size;
+	u32			rx_burst_size;
 };
 
 /* Default offset of capability registers */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
