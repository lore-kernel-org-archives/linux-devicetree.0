From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH v4 2/3] usb: phy: msm: fix connect/disconnect bug for dragonboard OTG port
Date: Fri, 20 Nov 2015 15:47:19 -0800
Message-ID: <1448063240-2739-2-git-send-email-tim.bird@sonymobile.com>
References: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, balbi@ti.com, Bjorn.Andersson@sonymobile.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tbird20d@gmail.com, tim.bird@sonymobile.com
List-Id: devicetree@vger.kernel.org

Add support for async_irq to wake up driver from low power mode.
Without this, the power management code never calls resume.
Remove a spurious interrupt enable in the driver resume function.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---
 drivers/usb/phy/phy-msm-usb.c | 17 ++++++++++++++++-
 include/linux/usb/msm_hsusb.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index e40a071..04fb056 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -648,7 +648,6 @@ skip_phy_resume:
 	if (motg->async_int) {
 		motg->async_int = 0;
 		pm_runtime_put(phy->dev);
-		enable_irq(motg->irq);
 	}
 
 	dev_info(phy->dev, "USB exited from low power mode\n");
@@ -1732,6 +1731,12 @@ static int msm_otg_probe(struct platform_device *pdev)
 		return motg->irq;
 	}
 
+	motg->async_irq = platform_get_irq_byname(pdev, "async");
+	if (motg->async_irq < 0) {
+		dev_err(&pdev->dev, "platform_get_irq for async irq failed\n");
+		motg->async_irq = 0;
+	}
+
 	regs[0].supply = "vddcx";
 	regs[1].supply = "v3p3";
 	regs[2].supply = "v1p8";
@@ -1781,6 +1786,16 @@ static int msm_otg_probe(struct platform_device *pdev)
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
