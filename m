From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix fifo size for EP 6,7
Date: Wed, 22 Nov 2017 12:21:50 +0100 (CET)
Message-ID: <1338829163.31850.1511349710527@email.1und1.de>
References: <1507371414-21688-1-git-send-email-stefan.wahren@i2se.com>
 <160210128.18582.1509137904239@email.1und1.de> <871slkw3ms.fsf@anholt.net>
 <1506055926.93787.1509439381859@email.1und1.de>
 <2056429546.196128.1510871632211@email.1und1.de>
 <410670D7E743164D87FA6160E7907A560113A3F8F0@am04wembxa.internal.synopsys.com>
 <2145990636.312534.1511036500613@email.1und1.de>
 <410670D7E743164D87FA6160E7907A560113A409A8@am04wembxa.internal.synopsys.com>
 <56581c3c-9159-8e07-288b-5ccc793e1fa1@i2se.com>
 <410670D7E743164D87FA6160E7907A560113A41084@am04wembxa.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <410670D7E743164D87FA6160E7907A560113A41084-ouFQeoKRuQ8bQ7k9MBbv4fufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Minas Harutyunyan <Minas.Harutyunyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Minas,

> Minas Harutyunyan <Minas.Harutyunyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> hat am 21. November 2017 um 13:02 geschrieben:
>
> Hi Stefan,
> 
> We have prepared patch for this issue in July-August'17.
> Find attached 2 patch files. Please apply patches and test. If issue 
> gone, we will send these patches to LKML by regular flow.

thanks, but the first patch doesn't apply. My version see below, i hope i didn't break anything.

Unfortunately after applying both patches the issue still persists (EP 1-7 fifo size to 512) and the EP 1-7 TX total size increases from 3776 to 3792. I will follow my u-boot theory  ...

>From 12fcc090bc7588275c1d942009676cb3fa5129f2 Mon Sep 17 00:00:00 2001
From: Gevorg Sahakyan <sahakyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Date: Wed, 22 Nov 2017 11:15:16 +0100
Subject: [PATCH] usb: dwc2: Fix TxFIFO setup issue

In host mode reading from DPTXSIZn returning invalid value(0) in
dwc2_check_param_tx_fifo_sizes function.

Added g_tx_fifo_size array in dwc2_hw_params structure in which stored
power on reset valus of DPTXSIZn registers in device mode (forced to
device).

Updated dwc2_get_hwparams function to write DPTXFSIZn to array.

Modyfied dwc2_check_param_tx_fifo_sizes function accordingly.

Change-Id: I61d3db753b1bc06f0f2caf40df350a09655f18fd
Signed-off-by: Gevorg Sahakyan <sahakyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 drivers/usb/dwc2/core.h   |  1 +
 drivers/usb/dwc2/params.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 8367d4f..47e9092 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -587,6 +587,7 @@ struct dwc2_hw_params {
 	unsigned utmi_phy_data_width:2;
 	u32 snpsid;
 	u32 dev_ep_dirs;
+	u32 g_tx_fifo_size[MAX_EPS_CHANNELS];
 };
 
 /* Size of control and EP0 buffers */
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index a3ffe97..04f1868 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -469,8 +469,7 @@ static void dwc2_check_param_tx_fifo_sizes(struct dwc2_hsotg *hsotg)
 	}
 
 	for (fifo = 1; fifo <= fifo_count; fifo++) {
-		dptxfszn = (dwc2_readl(hsotg->regs + DPTXFSIZN(fifo)) &
-			FIFOSIZE_DEPTH_MASK) >> FIFOSIZE_DEPTH_SHIFT;
+		dptxfszn = hsotg->hw_params.g_tx_fifo_size[fifo];
 
 		if (hsotg->params.g_tx_fifo_size[fifo] < min ||
 		    hsotg->params.g_tx_fifo_size[fifo] >  dptxfszn) {
@@ -617,6 +616,7 @@ int dwc2_get_hwparams(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_hw_params *hw = &hsotg->hw_params;
 	unsigned int width;
+	int fifo, fifo_count;
 	u32 hwcfg1, hwcfg2, hwcfg3, hwcfg4;
 	u32 grxfsiz;
 
@@ -705,6 +705,13 @@ int dwc2_get_hwparams(struct dwc2_hsotg *hsotg)
 	hw->rx_fifo_size = (grxfsiz & GRXFSIZ_DEPTH_MASK) >>
 				GRXFSIZ_DEPTH_SHIFT;
 
+	fifo_count = dwc2_hsotg_tx_fifo_count(hsotg);
+
+	for (fifo = 1; fifo <= fifo_count; fifo++) {
+		u32 val = dwc2_readl(hsotg->regs + DPTXFSIZN(fifo));
+		hw->g_tx_fifo_size[fifo] = (val & FIFOSIZE_DEPTH_MASK) >>
+					   FIFOSIZE_DEPTH_SHIFT;
+	}
 	return 0;
 }
 
-- 
2.7.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
