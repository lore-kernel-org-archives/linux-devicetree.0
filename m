From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v4 3/3] usb: dwc3: core: Suspend PHYs on runtime suspend in host mode
Date: Wed,  9 May 2018 23:09:21 +0530
Message-ID: <1525887562-2687-4-git-send-email-mgautam@codeaurora.org>
References: <1525887562-2687-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525887562-2687-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, robh@kernel.org, andy.gross@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Some PHY drivers (e.g. for Qualcomm QUSB2 and QMP PHYs) support
runtime PM to reduce PHY power consumption during bus_suspend.
Add changes to let core auto-suspend PHYs on host bus-suspend
using GUSB2PHYCFG register if needed for a platform. Also perform
PHYs runtime suspend/resume and let platform glue drivers e.g.
dwc3-qcom handle remote wakeup during bus suspend by waking up
devices on receiving wakeup event from PHY.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 drivers/usb/dwc3/core.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index a15648d..449a098 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1394,6 +1394,7 @@ static int dwc3_remove(struct platform_device *pdev)
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	unsigned long	flags;
+	u32 reg;
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
@@ -1403,9 +1404,25 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		/* do nothing during host runtime_suspend */
-		if (!PMSG_IS_AUTO(msg))
+		if (!PMSG_IS_AUTO(msg)) {
 			dwc3_core_exit(dwc);
+			break;
+		}
+
+		/* Let controller to suspend HSPHY before PHY driver suspends */
+		if (dwc->dis_u2_susphy_quirk ||
+		    dwc->dis_enblslpm_quirk) {
+			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+			reg |=  DWC3_GUSB2PHYCFG_ENBLSLPM |
+				DWC3_GUSB2PHYCFG_SUSPHY;
+			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+
+			/* Give some time for USB2 PHY to suspend */
+			usleep_range(5000, 6000);
+		}
+
+		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
+		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
 		break;
 	case DWC3_GCTL_PRTCAP_OTG:
 		/* do nothing during runtime_suspend */
@@ -1433,6 +1450,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	unsigned long	flags;
 	int		ret;
+	u32		reg;
 
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
@@ -1446,13 +1464,25 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		/* nothing to do on host runtime_resume */
 		if (!PMSG_IS_AUTO(msg)) {
 			ret = dwc3_core_init(dwc);
 			if (ret)
 				return ret;
 			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
+			break;
 		}
+		/* Restore GUSB2PHYCFG bits that were modified in suspend */
+		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		if (dwc->dis_u2_susphy_quirk)
+			reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
+
+		if (dwc->dis_enblslpm_quirk)
+			reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
+
+		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+
+		phy_pm_runtime_get_sync(dwc->usb2_generic_phy);
+		phy_pm_runtime_get_sync(dwc->usb3_generic_phy);
 		break;
 	case DWC3_GCTL_PRTCAP_OTG:
 		/* nothing to do on runtime_resume */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
