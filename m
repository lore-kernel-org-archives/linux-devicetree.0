From: Huang Rui <ray.huang@amd.com>
Subject: [PATCH v4 01/20] usb: dwc3: enable hibernation if to be supported
Date: Thu, 30 Oct 2014 18:08:26 +0800
Message-ID: <1414663725-2195-2-git-send-email-ray.huang@amd.com>
References: <1414663725-2195-1-git-send-email-ray.huang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414663725-2195-1-git-send-email-ray.huang@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Zimmerman <Paul.Zimmerman@synopsys.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Jason Chang <jason.chang@amd.com>, Vincent Wan <vincent.wan@amd.com>, Tony Li <tony.li@amd.com>, linux-usb@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Huang Rui <ray.huang@amd.com>
List-Id: devicetree@vger.kernel.org

It enables hibernation if the function is set in coreConsultant.

Suggested-by: Felipe Balbi <balbi@ti.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Felipe Balbi <balbi@ti.com>
---
 drivers/usb/dwc3/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fa396fc..5a47482 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -447,8 +447,14 @@ static int dwc3_core_init(struct dwc3 *dwc)
 			reg &= ~DWC3_GCTL_DSBLCLKGTNG;
 		break;
 	case DWC3_GHWPARAMS1_EN_PWROPT_HIB:
-		/* enable hibernation here */
 		dwc->nr_scratch = DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(hwparams4);
+		/*
+		 * Enable hibernation here.
+		 *
+		 * Enabling this bit so that host-mode hibernation will
+		 * work, device-mode hibernation is not implemented yet.
+		 */
+		reg |= DWC3_GCTL_GBLHIBERNATIONEN;
 		break;
 	default:
 		dev_dbg(dwc->dev, "No power optimization available\n");
-- 
1.9.1
