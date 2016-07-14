From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v7 1/5] usb: dwc3: of-simple: add compatible for rockchip rk3399
Date: Thu, 14 Jul 2016 16:59:18 +0800
Message-ID: <1468486762-21960-2-git-send-email-william.wu@rock-chips.com>
References: <1468486762-21960-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468486762-21960-1-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Rockchip platform merely enable usb3 clocks and
populate its children. So we can use this generic
glue layer to support Rockchip dwc3.

Signed-off-by: William Wu <william.wu@rock-chips.com>
---
Changes in v7:
- None

Changes in v6:
- None

Changes in v5:
- change compatible from "rockchip,dwc3" to "rockchip,rk3399-dwc3" (Heiko)

Changes in v4:
- None

Changes in v3:
- None

Changes in v2:
- sort the list of_dwc3_simple_match (Doug)

 drivers/usb/dwc3/dwc3-of-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 9743353..05c9349 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -161,6 +161,7 @@ static const struct dev_pm_ops dwc3_of_simple_dev_pm_ops = {
 
 static const struct of_device_id of_dwc3_simple_match[] = {
 	{ .compatible = "qcom,dwc3" },
+	{ .compatible = "rockchip,rk3399-dwc3" },
 	{ .compatible = "xlnx,zynqmp-dwc3" },
 	{ /* Sentinel */ }
 };
-- 
1.9.1
