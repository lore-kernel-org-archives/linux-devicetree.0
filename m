From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv2 2/7] usb: dwc2: add support for STM32F7 USB OTG HS
Date: Mon, 28 Aug 2017 16:20:13 +0200
Message-ID: <1503930018-536-3-git-send-email-amelie.delaunay@st.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds the dwc2_set_params function for STM32F7 USB OTG HS.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/params.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index a3ffe97..d5b672d 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -136,6 +136,15 @@ static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
 	p->activate_stm_fs_transceiver = true;
 }
 
+static void dwc2_set_stm32f7_hsotg_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->host_rx_fifo_size = 622;
+	p->host_nperio_tx_fifo_size = 128;
+	p->host_perio_tx_fifo_size = 256;
+}
+
 const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "brcm,bcm2835-usb", .data = dwc2_set_bcm_params },
 	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params  },
@@ -154,6 +163,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
 	{ .compatible = "st,stm32f4x9-hsotg" },
+	{ .compatible = "st,stm32f7-hsotg",
+	  .data = dwc2_set_stm32f7_hsotg_params },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.7.4
