From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 24/35] nfc: st-nci: Add ese-present/uicc-present dts properties
Date: Mon, 26 Oct 2015 07:50:04 +0100
Message-ID: <1445842215-28403-25-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to align with st21nfca, dts configuration properties ese_present
and uicc_present are made available in st-nci driver.

So far, in early development firmware, because nci_nfcee_mode_set(DISABLE)
was not supported pushed us to try to enable during the secure element
discovery phase.

After several trials on commercial and qualified firmware it appears that
nci_nfcee_mode_set(ENABLE) and nci_nfcee_mode_set(DISABLE) are properly
supported.

Such feature also help us to eventually save some time (~5ms) if only
one secure element is connected.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/st-nci-i2c.txt     |  7 ++
 .../devicetree/bindings/net/nfc/st-nci-spi.txt     |  9 +-
 drivers/nfc/st-nci/core.c                          |  4 +-
 drivers/nfc/st-nci/i2c.c                           | 12 ++-
 drivers/nfc/st-nci/ndlc.c                          |  6 +-
 drivers/nfc/st-nci/ndlc.h                          |  5 +-
 drivers/nfc/st-nci/se.c                            | 98 ++++++++++++++--------
 drivers/nfc/st-nci/spi.c                           | 12 ++-
 drivers/nfc/st-nci/st-nci.h                        | 13 ++-
 include/linux/platform_data/st-nci.h               |  2 +
 10 files changed, 122 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt b/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
index d707588..263732e 100644
--- a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
@@ -11,6 +11,10 @@ Required properties:
 Optional SoC Specific Properties:
 - pinctrl-names: Contains only one value - "default".
 - pintctrl-0: Specifies the pin control groups used for this controller.
+- ese-present: Specifies that an ese is physically connected to the nfc
+controller.
+- uicc-present: Specifies that the uicc swp signal can be physically
+connected to the nfc controller.
 
 Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
 
@@ -29,5 +33,8 @@ Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
 		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
 
 		reset-gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+		ese-present;
+		uicc-present;
 	};
 };
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt b/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
index 525681b..711ca85 100644
--- a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
@@ -2,7 +2,7 @@
 
 Required properties:
 - compatible: Should be "st,st21nfcb-spi"
-- spi-max-frequency: Maximum SPI frequency (<= 10000000).
+- spi-max-frequency: Maximum SPI frequency (<= 4000000).
 - interrupt-parent: phandle for the interrupt gpio controller
 - interrupts: GPIO interrupt to which the chip is connected
 - reset-gpios: Output GPIO pin used to reset the ST21NFCB
@@ -10,6 +10,10 @@ Required properties:
 Optional SoC Specific Properties:
 - pinctrl-names: Contains only one value - "default".
 - pintctrl-0: Specifies the pin control groups used for this controller.
+- ese-present: Specifies that an ese is physically connected to the nfc
+controller.
+- uicc-present: Specifies that the uicc swp signal can be physically
+connected to the nfc controller.
 
 Example (for ARM-based BeagleBoard xM with ST21NFCB on SPI4):
 
@@ -27,5 +31,8 @@ Example (for ARM-based BeagleBoard xM with ST21NFCB on SPI4):
 		interrupts = <2 IRQ_TYPE_EDGE_RISING>;
 
 		reset-gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
+
+		ese-present;
+		uicc-present;
 	};
 };
diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index 6b083ed..ccf7237 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -123,7 +123,7 @@ static struct nci_ops st_nci_ops = {
 };
 
 int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
-		       int phy_tailroom)
+		 int phy_tailroom, struct st_nci_se_status *se_status)
 {
 	struct st_nci_info *info;
 	int r;
@@ -164,7 +164,7 @@ int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
 		goto err_reg_dev;
 	}
 
-	return st_nci_se_init(ndlc->ndev);
+	return st_nci_se_init(ndlc->ndev, se_status);
 
 err_reg_dev:
 	nci_free_device(ndlc->ndev);
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 02e585f..172cbc3 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -52,6 +52,8 @@ struct st_nci_i2c_phy {
 
 	unsigned int gpio_reset;
 	unsigned int irq_polarity;
+
+	struct st_nci_se_status se_status;
 };
 
 #define I2C_DUMP_SKB(info, skb)					\
@@ -245,6 +247,11 @@ static int st_nci_i2c_of_request_resources(struct i2c_client *client)
 
 	phy->irq_polarity = irq_get_trigger_type(client->irq);
 
+	phy->se_status.is_ese_present =
+				of_property_read_bool(pp, "ese-present");
+	phy->se_status.is_uicc_present =
+				of_property_read_bool(pp, "uicc-present");
+
 	return 0;
 }
 #else
@@ -277,6 +284,9 @@ static int st_nci_i2c_request_resources(struct i2c_client *client)
 		return r;
 	}
 
+	phy->se_status.is_ese_present = pdata->is_ese_present;
+	phy->se_status.is_uicc_present = pdata->is_uicc_present;
+
 	return 0;
 }
 
@@ -326,7 +336,7 @@ static int st_nci_i2c_probe(struct i2c_client *client,
 
 	r = ndlc_probe(phy, &i2c_phy_ops, &client->dev,
 			ST_NCI_FRAME_HEADROOM, ST_NCI_FRAME_TAILROOM,
-			&phy->ndlc);
+			&phy->ndlc, &phy->se_status);
 	if (r < 0) {
 		nfc_err(&client->dev, "Unable to register ndlc layer\n");
 		return r;
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index fb50007..0884b11 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -20,6 +20,7 @@
 #include <net/nfc/nci_core.h>
 
 #include "st-nci.h"
+#include "ndlc.h"
 
 #define NDLC_TIMER_T1		100
 #define NDLC_TIMER_T1_WAIT	400
@@ -265,7 +266,8 @@ static void ndlc_t2_timeout(unsigned long data)
 }
 
 int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct device *dev,
-	       int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id)
+	       int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id,
+	       struct st_nci_se_status *se_status)
 {
 	struct llt_ndlc *ndlc;
 
@@ -295,7 +297,7 @@ int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct device *dev,
 
 	INIT_WORK(&ndlc->sm_work, llt_ndlc_sm_work);
 
-	return st_nci_probe(ndlc, phy_headroom, phy_tailroom);
+	return st_nci_probe(ndlc, phy_headroom, phy_tailroom, se_status);
 }
 EXPORT_SYMBOL(ndlc_probe);
 
diff --git a/drivers/nfc/st-nci/ndlc.h b/drivers/nfc/st-nci/ndlc.h
index 6361005..bdf78ff 100644
--- a/drivers/nfc/st-nci/ndlc.h
+++ b/drivers/nfc/st-nci/ndlc.h
@@ -22,6 +22,8 @@
 #include <linux/skbuff.h>
 #include <net/nfc/nfc.h>
 
+struct st_nci_se_status;
+
 /* Low Level Transport description */
 struct llt_ndlc {
 	struct nci_dev *ndev;
@@ -55,6 +57,7 @@ void ndlc_close(struct llt_ndlc *ndlc);
 int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb);
 void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb);
 int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct device *dev,
-	int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id);
+	       int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id,
+	       struct st_nci_se_status *se_status);
 void ndlc_remove(struct llt_ndlc *ndlc);
 #endif /* __LOCAL_NDLC_H__ */
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 2812884..147e2d9 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -419,12 +419,8 @@ void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
 }
 EXPORT_SYMBOL_GPL(st_nci_hci_cmd_received);
 
-/*
- * Remarks: On some early st_nci firmware, nci_nfcee_mode_set(0)
- * is rejected
- */
 static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
-				   u8 state)
+			     u8 state)
 {
 	struct st_nci_info *info = nci_get_drvdata(ndev);
 	int r;
@@ -449,7 +445,7 @@ static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
 	 * retrieve a relevant host list.
 	 */
 	reinit_completion(&info->se_info.req_completion);
-	r = nci_nfcee_mode_set(ndev, se_idx, NCI_NFCEE_ENABLE);
+	r = nci_nfcee_mode_set(ndev, se_idx, state);
 	if (r != NCI_STATUS_OK)
 		return r;
 
@@ -465,7 +461,9 @@ static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
 	 * There is no possible synchronization to prevent this.
 	 * Adding a small delay is the only way to solve the issue.
 	 */
-	usleep_range(3000, 5000);
+	if (info->se_info.se_status->is_ese_present &&
+	    info->se_info.se_status->is_uicc_present)
+		usleep_range(3000, 5000);
 
 	r = nci_hci_get_param(ndev, NCI_HCI_ADMIN_GATE,
 			NCI_HCI_ADMIN_PARAM_HOST_LIST, &sk_host_list);
@@ -488,11 +486,20 @@ int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx)
 
 	pr_debug("st_nci_disable_se\n");
 
-	if (se_idx == NFC_SE_EMBEDDED) {
-		r = nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
-				ST_NCI_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
-		if (r < 0)
-			return r;
+	/*
+	 * According to upper layer, se_idx == NFC_SE_UICC when
+	 * info->se_info.se_status->is_uicc_enable is true should never happen
+	 * Same for eSE.
+	 */
+	r = st_nci_control_se(ndev, se_idx, ST_NCI_SE_MODE_OFF);
+	if (r < 0) {
+		/* Do best effort to release SWP */
+		if (se_idx == NFC_SE_EMBEDDED) {
+			r = nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
+					ST_NCI_EVT_SE_END_OF_APDU_TRANSFER,
+					NULL, 0);
+		}
+		return r;
 	}
 
 	return 0;
@@ -505,11 +512,25 @@ int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx)
 
 	pr_debug("st_nci_enable_se\n");
 
-	if (se_idx == ST_NCI_HCI_HOST_ID_ESE) {
+	/*
+	 * According to upper layer, se_idx == NFC_SE_UICC when
+	 * info->se_info.se_status->is_uicc_enable is true should never happen.
+	 * Same for eSE.
+	 */
+	r = st_nci_control_se(ndev, se_idx, ST_NCI_SE_MODE_ON);
+	if (r == ST_NCI_HCI_HOST_ID_ESE) {
+		st_nci_se_get_atr(ndev);
 		r = nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
 				ST_NCI_EVT_SE_SOFT_RESET, NULL, 0);
-		if (r < 0)
-			return r;
+	}
+
+	if (r < 0) {
+		/*
+		 * The activation procedure failed, the secure element
+		 * is not connected. Remove from the list.
+		 */
+		nfc_remove_se(ndev->nfc_dev, se_idx);
+		return r;
 	}
 
 	return 0;
@@ -592,8 +613,8 @@ exit:
 
 int st_nci_discover_se(struct nci_dev *ndev)
 {
-	u8 param[2];
-	int r;
+	u8 white_list[2];
+	int r, wl_size = 0;
 	int se_count = 0;
 	struct st_nci_info *info = nci_get_drvdata(ndev);
 
@@ -606,29 +627,34 @@ int st_nci_discover_se(struct nci_dev *ndev)
 	if (test_bit(ST_NCI_FACTORY_MODE, &info->flags))
 		return 0;
 
-	param[0] = ST_NCI_UICC_HOST_ID;
-	param[1] = ST_NCI_HCI_HOST_ID_ESE;
-	r = nci_hci_set_param(ndev, NCI_HCI_ADMIN_GATE,
-				NCI_HCI_ADMIN_PARAM_WHITELIST,
-				param, sizeof(param));
-	if (r != NCI_HCI_ANY_OK)
-		return r;
+	if (info->se_info.se_status->is_ese_present &&
+	    info->se_info.se_status->is_uicc_present) {
+		white_list[wl_size++] = ST_NCI_UICC_HOST_ID;
+		white_list[wl_size++] = ST_NCI_ESE_HOST_ID;
+	} else if (!info->se_info.se_status->is_ese_present &&
+		   info->se_info.se_status->is_uicc_present) {
+		white_list[wl_size++] = ST_NCI_UICC_HOST_ID;
+	} else if (info->se_info.se_status->is_ese_present &&
+		   !info->se_info.se_status->is_uicc_present) {
+		white_list[wl_size++] = ST_NCI_ESE_HOST_ID;
+	}
+
+	if (wl_size) {
+		r = nci_hci_set_param(ndev, NCI_HCI_ADMIN_GATE,
+				      NCI_HCI_ADMIN_PARAM_WHITELIST,
+				      white_list, wl_size);
+		if (r != NCI_HCI_ANY_OK)
+			return r;
+	}
 
-	r = st_nci_control_se(ndev, ST_NCI_UICC_HOST_ID,
-				ST_NCI_SE_MODE_ON);
-	if (r == ST_NCI_UICC_HOST_ID) {
+	if (info->se_info.se_status->is_uicc_present) {
 		nfc_add_se(ndev->nfc_dev, ST_NCI_UICC_HOST_ID, NFC_SE_UICC);
 		se_count++;
 	}
 
-	/* Try to enable eSE in order to check availability */
-	r = st_nci_control_se(ndev, ST_NCI_HCI_HOST_ID_ESE,
-				ST_NCI_SE_MODE_ON);
-	if (r == ST_NCI_HCI_HOST_ID_ESE) {
-		nfc_add_se(ndev->nfc_dev, ST_NCI_HCI_HOST_ID_ESE,
-			   NFC_SE_EMBEDDED);
+	if (info->se_info.se_status->is_ese_present) {
+		nfc_add_se(ndev->nfc_dev, ST_NCI_ESE_HOST_ID, NFC_SE_EMBEDDED);
 		se_count++;
-		st_nci_se_get_atr(ndev);
 	}
 
 	return !se_count;
@@ -701,7 +727,7 @@ static void st_nci_se_activation_timeout(unsigned long data)
 	complete(&info->se_info.req_completion);
 }
 
-int st_nci_se_init(struct nci_dev *ndev)
+int st_nci_se_init(struct nci_dev *ndev, struct st_nci_se_status *se_status)
 {
 	struct st_nci_info *info = nci_get_drvdata(ndev);
 
@@ -723,6 +749,8 @@ int st_nci_se_init(struct nci_dev *ndev)
 	info->se_info.wt_timeout =
 		ST_NCI_BWI_TO_TIMEOUT(ST_NCI_ATR_DEFAULT_BWI);
 
+	info->se_info.se_status = se_status;
+
 	return 0;
 }
 EXPORT_SYMBOL(st_nci_se_init);
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index b43f448..8897203 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -53,6 +53,8 @@ struct st_nci_spi_phy {
 
 	unsigned int gpio_reset;
 	unsigned int irq_polarity;
+
+	struct st_nci_se_status se_status;
 };
 
 #define SPI_DUMP_SKB(info, skb)					\
@@ -260,6 +262,11 @@ static int st_nci_spi_of_request_resources(struct spi_device *dev)
 
 	phy->irq_polarity = irq_get_trigger_type(dev->irq);
 
+	phy->se_status.is_ese_present =
+				of_property_read_bool(pp, "ese-present");
+	phy->se_status.is_uicc_present =
+				of_property_read_bool(pp, "uicc-present");
+
 	return 0;
 }
 #else
@@ -292,6 +299,9 @@ static int st_nci_spi_request_resources(struct spi_device *dev)
 		return r;
 	}
 
+	phy->se_status.is_ese_present = pdata->is_ese_present;
+	phy->se_status.is_uicc_present = pdata->is_uicc_present;
+
 	return 0;
 }
 
@@ -342,7 +352,7 @@ static int st_nci_spi_probe(struct spi_device *dev)
 
 	r = ndlc_probe(phy, &spi_phy_ops, &dev->dev,
 			ST_NCI_FRAME_HEADROOM, ST_NCI_FRAME_TAILROOM,
-			&phy->ndlc);
+			&phy->ndlc, &phy->se_status);
 	if (r < 0) {
 		nfc_err(&dev->dev, "Unable to register ndlc layer\n");
 		return r;
diff --git a/drivers/nfc/st-nci/st-nci.h b/drivers/nfc/st-nci/st-nci.h
index c68d538..b07aded 100644
--- a/drivers/nfc/st-nci/st-nci.h
+++ b/drivers/nfc/st-nci/st-nci.h
@@ -48,7 +48,13 @@ struct nci_mode_set_rsp {
 	u8 status;
 } __packed;
 
+struct st_nci_se_status {
+	bool is_ese_present;
+	bool is_uicc_present;
+};
+
 struct st_nci_se_info {
+	struct st_nci_se_status *se_status;
 	u8 atr[ST_NCI_ESE_MAX_LENGTH];
 	struct completion req_completion;
 
@@ -126,15 +132,16 @@ struct st_nci_vendor_info {
 struct st_nci_info {
 	struct llt_ndlc *ndlc;
 	unsigned long flags;
+
 	struct st_nci_se_info se_info;
 	struct st_nci_vendor_info vendor_info;
 };
 
 void st_nci_remove(struct nci_dev *ndev);
 int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
-		int phy_tailroom);
+		 int phy_tailroom, struct st_nci_se_status *se_status);
 
-int st_nci_se_init(struct nci_dev *ndev);
+int st_nci_se_init(struct nci_dev *ndev, struct st_nci_se_status *se_status);
 void st_nci_se_deinit(struct nci_dev *ndev);
 
 int st_nci_discover_se(struct nci_dev *ndev);
@@ -150,7 +157,7 @@ void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
 			struct sk_buff *skb);
 
 void st_nci_hci_loopback_event_received(struct nci_dev *ndev, u8 event,
-					 struct sk_buff *skb);
+					struct sk_buff *skb);
 int st_nci_vendor_cmds_init(struct nci_dev *ndev);
 
 #endif /* __LOCAL_ST_NCI_H_ */
diff --git a/include/linux/platform_data/st-nci.h b/include/linux/platform_data/st-nci.h
index d9d400a..f6494b3 100644
--- a/include/linux/platform_data/st-nci.h
+++ b/include/linux/platform_data/st-nci.h
@@ -24,6 +24,8 @@
 struct st_nci_nfc_platform_data {
 	unsigned int gpio_reset;
 	unsigned int irq_polarity;
+	bool is_ese_present;
+	bool is_uicc_present;
 };
 
 #endif /* _ST_NCI_H_ */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
