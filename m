From: Philipp Puschmann <philipp.puschmann@emlix.com>
Subject: [PATCH v2,2/2] usb: chipidea: imx: set power polarity
Date: Wed, 16 Jan 2019 11:51:03 +0100
Message-ID: <20190116105103.28842-2-philipp.puschmann@emlix.com>
References: <20190115123113.20577-1-philipp.puschmann@emlix.com>
 <20190116105103.28842-1-philipp.puschmann@emlix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116105103.28842-1-philipp.puschmann@emlix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Peter.Chen@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, philipp.puschmann@emlix.com
List-Id: devicetree@vger.kernel.org

This patch adds support to set the power line polarity for i.MX6q/dl.

To let the USB controller control the power it may be necessary to configure
the polarity of the power line. So far the polarity was configured
by Bootloader or alternatively the power line was muxed as gpio and
driven by a regulator.

Signed-off-by: Philipp Puschmann <philipp.puschmann@emlix.com>
---

V2: fixed wrong variable name ...

---
 drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
 drivers/usb/chipidea/ci_hdrc_imx.h | 1 +
 drivers/usb/chipidea/usbmisc_imx.c | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index e81de9ca8729..32dc120680fa 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -152,6 +152,9 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 		dev_warn(dev, "No over current polarity defined\n");
 	}
 
+	if (of_find_property(np, "power-active-high", NULL))
+		data->pwr_pol = 1;
+
 	if (of_find_property(np, "external-vbus-divider", NULL))
 		data->evdo = 1;
 
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 7cc53e2ce564..c842e03f8767 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -18,6 +18,7 @@ struct imx_usbmisc_data {
 	/* true if dt specifies polarity */
 	unsigned int oc_pol_configured:1;
 
+	unsigned int pwr_pol:1; /* power polarity */
 	unsigned int evdo:1; /* set external vbus divider option */
 	unsigned int ulpi:1; /* connected to an ULPI phy */
 	unsigned int hsic:1; /* HSIC controlller */
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 097ffbca0bd9..64a7c7ff4b35 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -63,6 +63,7 @@
 #define MX6_BM_NON_BURST_SETTING	BIT(1)
 #define MX6_BM_OVER_CUR_DIS		BIT(7)
 #define MX6_BM_OVER_CUR_POLARITY	BIT(8)
+#define MX6_BM_PWR_POLARITY		BIT(9)
 #define MX6_BM_WAKEUP_ENABLE		BIT(10)
 #define MX6_BM_UTMI_ON_CLOCK		BIT(13)
 #define MX6_BM_ID_WAKEUP		BIT(16)
@@ -383,6 +384,9 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
 		else if (data->oc_pol_configured)
 			reg &= ~MX6_BM_OVER_CUR_POLARITY;
 	}
+	/* If the polarity is not set keep it as setup by the bootlader */
+	if (data->pwr_pol == 1)
+		reg |= MX6_BM_PWR_POLARITY;
 	writel(reg, usbmisc->base + data->index * 4);
 
 	/* SoC non-burst setting */
-- 
2.20.1
