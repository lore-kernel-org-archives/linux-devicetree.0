From: Andy Gross <agross@codeaurora.org>
Subject: [PATCH 2/4] usb: dwc3: qcom: Configure TCSR phy mux register
Date: Fri, 20 Nov 2015 02:35:07 -0600
Message-ID: <1448008509-8913-3-git-send-email-agross@codeaurora.org>
References: <1448008509-8913-1-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448008509-8913-1-git-send-email-agross@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds automatic configuration of the TCSR phy mux register based on
the syscon-tcsr devicetree entry.  This configuration is optional, as some
platforms may not require the mux selection.

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0880260..fcf264c 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -17,6 +17,8 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 struct dwc3_qcom {
 	struct device		*dev;
@@ -30,6 +32,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct dwc3_qcom *qdwc;
+	struct regmap *regmap;
+	u32 mux_offset;
+	u32 mux_bit;
 	int ret;
 
 	qdwc = devm_kzalloc(&pdev->dev, sizeof(*qdwc), GFP_KERNEL);
@@ -58,6 +63,26 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		qdwc->sleep_clk = NULL;
 	}
 
+	/* look for tcsr and if present, provision it */
+	regmap = syscon_regmap_lookup_by_phandle(node, "syscon-tcsr");
+	if (!IS_ERR(regmap)) {
+		if (of_property_read_u32_index(node, "syscon-tcsr", 1,
+					       &mux_offset)) {
+			dev_err(qdwc->dev, "missing USB TCSR mux offset\n");
+			return -EINVAL;
+		}
+		if (of_property_read_u32_index(node, "syscon-tcsr", 2,
+					       &mux_bit)) {
+			dev_err(qdwc->dev, "missing USB TCSR mux bit\n");
+			return -EINVAL;
+		}
+
+		regmap_update_bits(regmap, mux_offset, BIT(mux_bit),
+				   BIT(mux_bit));
+	} else {
+		dev_info(qdwc->dev, "missing syscon tcsr entry\n");
+	}
+
 	ret = clk_prepare_enable(qdwc->core_clk);
 	if (ret) {
 		dev_err(qdwc->dev, "failed to enable core clock\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
