From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for dragonboard OTG port
Date: Tue, 10 Nov 2015 16:46:51 -0800
Message-ID: <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, balbi@ti.com, Bjorn.Andersson@sonymobile.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tbird20d@gmail.com, tim.bird@sonymobile.com
List-Id: devicetree@vger.kernel.org

This fixes a bug where if you disconnect and re-connect the USB cable,
the gadget driver stops working.

Add support for async_irq to wake up driver from low power mode.
Without this, the power management code never calls resume.
Also, have the phy driver kick the gadget driver (chipidea otg)
by having the chipidea driver register with it, for vbus connect
notifications.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---
 drivers/usb/chipidea/udc.c    |  6 ++++++
 drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
 include/linux/usb/msm_hsusb.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8223fe7..06234cd 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1890,6 +1890,12 @@ static int udc_start(struct ci_hdrc *ci)
 
 	ci->gadget.ep0 = &ci->ep0in->ep;
 
+	if (ci->usb_phy) {
+		retval = otg_set_peripheral(ci->usb_phy->otg, &ci->gadget);
+		if (retval)
+			goto destroy_eps;
+	}
+
 	retval = usb_add_gadget_udc(dev, &ci->gadget);
 	if (retval)
 		goto destroy_eps;
diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 80eb991..eb80f92 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -1731,6 +1731,12 @@ static int msm_otg_probe(struct platform_device *pdev)
 		return motg->irq;
 	}
 
+	motg->async_irq = platform_get_irq_byname(pdev, "async_irq");
+	if (motg->async_irq < 0) {
+		dev_info(&pdev->dev, "platform_get_irq for async_irq failed\n");
+		motg->async_irq = 0;
+	}
+
 	regs[0].supply = "vddcx";
 	regs[1].supply = "v3p3";
 	regs[2].supply = "v1p8";
@@ -1780,6 +1786,16 @@ static int msm_otg_probe(struct platform_device *pdev)
 		goto disable_ldo;
 	}
 
+	if (motg->async_irq) {
+		ret = devm_request_irq(&pdev->dev, motg->async_irq,
+				      msm_otg_irq, IRQF_TRIGGER_RISING,
+				      "msm_otg", motg);
+		if (ret) {
+			dev_err(&pdev->dev, "request irq failed (ASYNC INT)\n");
+			goto disable_ldo;
+		}
+	}
+
 	phy->init = msm_phy_init;
 	phy->set_power = msm_otg_set_power;
 	phy->notify_disconnect = msm_phy_notify_disconnect;
diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
index 8c8f685..08c67a3 100644
--- a/include/linux/usb/msm_hsusb.h
+++ b/include/linux/usb/msm_hsusb.h
@@ -164,6 +164,7 @@ struct msm_otg {
 	struct usb_phy phy;
 	struct msm_otg_platform_data *pdata;
 	int irq;
+	int async_irq;
 	struct clk *clk;
 	struct clk *pclk;
 	struct clk *core_clk;
-- 
1.8.2.2
