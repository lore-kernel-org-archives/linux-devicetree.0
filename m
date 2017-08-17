From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 2/7] usb: dwc2: add support for STM32F7xx USB OTG HS
Date: Thu, 17 Aug 2017 11:33:01 +0200
Message-ID: <1502962386-6683-3-git-send-email-amelie.delaunay@st.com>
References: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds the dwc2_set_params function for STM32F7xx USB OTG HS.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/params.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index a3ffe97..015d23e 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -136,6 +136,15 @@ static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
 	p->activate_stm_fs_transceiver = true;
 }
 
+static void dwc2_set_stm32f7xx_hsotg_params(struct dwc2_hsotg *hsotg)
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
+	{ .compatible = "st,stm32f7xx-hsotg",
+	  .data = dwc2_set_stm32f7xx_hsotg_params },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.7.4
