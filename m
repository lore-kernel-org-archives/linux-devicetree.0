From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix fifo size for EP 6,7
Date: Sat, 18 Nov 2017 21:21:40 +0100 (CET)
Message-ID: <2145990636.312534.1511036500613@email.1und1.de>
References: <1507371414-21688-1-git-send-email-stefan.wahren@i2se.com>
 <160210128.18582.1509137904239@email.1und1.de> <871slkw3ms.fsf@anholt.net>
 <1506055926.93787.1509439381859@email.1und1.de>
 <2056429546.196128.1510871632211@email.1und1.de>
 <410670D7E743164D87FA6160E7907A560113A3F8F0@am04wembxa.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <410670D7E743164D87FA6160E7907A560113A3F8F0-ouFQeoKRuQ8bQ7k9MBbv4fufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Minas Harutyunyan <Minas.Harutyunyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Minas,

> Minas Harutyunyan <Minas.Harutyunyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> hat am 17. November 2017 um 08:48 geschrieben:
> 
> 
> On 11/17/2017 2:35 AM, Stefan Wahren wrote:
> > Hi Eric,
> > 
> >> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 31. Oktober 2017 um 09:43 geschrieben:
> >>
> >>
> >> Hi Eric,
> >>
> >>> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> hat am 31. Oktober 2017 um 01:40 geschrieben:
> >>>
> >>>
> >>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> >>>
> >>>>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 7. Oktober 2017 um 12:16 geschrieben:
> >>>>>
> >>>>>
> >>>>> In case the RPi Zero has at least a device connected to the OTG port
> >>>>> at boot time, the upper limit of tx fifo size for endpoint 6 and 7 is
> >>>>> also reduced to 512 bytes. So fix this accordingly.
> >>>>>
> >>>>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> >>>>> Fixes: 1aa1d858f582 ("ARM: dts: bcm283x: Add dtsi for OTG mode")
> >>>>
> >>>> gentle ping ...
> >>>
> >>> I've tried to make sense of this a couple of times, but I don't get it:
> >>> why does EP 6/7 get reduced to 512 bytes in this case?
> >>
> >> i cannot give you an answer for this specific case.
> >>
> >> Since the dwc2 databook isn't public, i started a thread on linux-usb [1] about proper fifo size configuration. But i didn't get any reply.
> >>
> >> The problem here is there different contraints:
> >> * the sum of all fifo values must not exceed 3776 bytes
> >> * each slot have its individual upper limit (available in the BCM2835 datasheet)
> >>
> >> During my tests for OTG mode i missed the specific case above. Now my determined limits of 512 for EP 6 and 7 are contrary to the BCM2835 datasheet. Maybe the Synopsys guys have an answer?
> >>
> >> Btw the values in the downstream tree also violate the contraints.
> >>
> >> [1] - https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_linux-2Dusb_msg157200.html&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=6z9Al9FrHR_ZqbbtSAsD16pvOL2S3XHxQnSzq8kusyI&m=O2ngUGajgx3MfHk4IQKp5iRlwOOpG62gkji4R2gE64k&s=8ClOBwWN5B69mL1TDjnN3l78JBrvd1YHunRdzei-xrA&e=
> > 
> > still concerns about this patch, because it's not included in dt-fixes?
> > 
> 
> Hi Stefan,
> 
> According BCM2835 datasheet Total Data FIFO RAM Depth is 4096. I assume 
> that in datasheet assumed 4096 dwords, not a bytes. DFIFO depth in 
> dwords stored GHWCFG3[31:16].
> 
> So, for buffer DMA mode max space in dwords which available to allocate 
> to FIFO's is 4096-8*2=4080, where 8 EP count including EP0 and 2 for 
> both directions of EP's. Based on bcm283x-rpi-usb-otg.dtsi:
> g-rx-fifo-size + g-np-tx-fifo-size + g-tx-fifo-size[1..7] = 
> 256+32+256+256+512+512+512+768+768 = 3872 < 4080.
> So, I don't see any reason to change EP 6,7 TxFIFO sizes.

that's a nice calculation, but not relevant in my case.

Let's step back to the original problem. If i try to boot the Raspberry Pi Zero (Linux 4.14, U-Boot 2017-07) in OTG mode with at least 1 USB device connected, i will get the following warnings:

[    2.997476] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: Invalid parameter g_tx_fifo_size[6]=768
[    3.015754] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: Invalid parameter g_tx_fifo_size[7]=768

These warnings doesn't appear if there are no devices connected during boot.

In order to understand how i came to the "real" constraints 3776 bytes and to the new values for EP 6,7 i add some debug:

--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -462,6 +462,8 @@ static void dwc2_check_param_tx_fifo_sizes(struct dwc2_hsotg *hsotg)
 	for (fifo = 1; fifo <= fifo_count; fifo++)
 		total += hsotg->params.g_tx_fifo_size[fifo];
 
+	dev_warn(hsotg->dev, "%s: g-tx-fifo-size: %d\n", __func__, dwc2_hsotg_tx_fifo_total_depth(hsotg));
+
 	if (total > dwc2_hsotg_tx_fifo_total_depth(hsotg) || !total) {
 		dev_warn(hsotg->dev, "%s: Invalid parameter g-tx-fifo-size, setting to default average\n",
 			 __func__);
@@ -472,6 +474,8 @@ static void dwc2_check_param_tx_fifo_sizes(struct dwc2_hsotg *hsotg)
 		dptxfszn = (dwc2_readl(hsotg->regs + DPTXFSIZN(fifo)) &
 			FIFOSIZE_DEPTH_MASK) >> FIFOSIZE_DEPTH_SHIFT;
 
+		dev_warn(hsotg->dev, "%s: g_tx_fifo_size[%d]=%d\n", __func__, fifo, dptxfszn);
+
 		if (hsotg->params.g_tx_fifo_size[fifo] < min ||
 		    hsotg->params.g_tx_fifo_size[fifo] >  dptxfszn) {
 			dev_warn(hsotg->dev, "%s: Invalid parameter g_tx_fifo_size[%d]=%d\n",

After applying the patch i will get the following output if 1 device is connected during boot:

[    2.939493] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g-tx-fifo-size: 3776
[    2.947650] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[1]=512
[    2.955972] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[2]=512
[    2.964294] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[3]=512
[    2.972630] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[4]=512
[    2.980949] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[5]=512
[    2.989174] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[6]=512
[    2.997476] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: Invalid parameter g_tx_fifo_size[6]=768
[    3.007439] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: g_tx_fifo_size[7]=512
[    3.015754] dwc2 20980000.usb: dwc2_check_param_tx_fifo_sizes: Invalid parameter g_tx_fifo_size[7]=768
[    3.025763] dwc2 20980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
[    3.034534] dwc2 20980000.usb: DWC OTG Controller
[    3.039802] dwc2 20980000.usb: new USB bus registered, assigned bus number 1
[    3.047399] dwc2 20980000.usb: irq 33, io mem 0x20980000

As can see from dwc2 perspective the sum of EP 1 - 7 must be 3776 bytes and the upper limits for EP 6 + 7 changed to 512 instead of 768. Datasheets are nice, but as long as they apply only in specific cases they aren't helpful.

This might be not the right fix, but as long as i didn't get any reply to my mails this is my best solution. Sorry but as BCM2835 maintainer the dwc2 driver is a real problem child to us.

Best regards
Stefan

> 
> More probably comment in dtsi not correct:
> "* fifo sizes shouldn't exceed 3776 bytes."
> Please check FIFO depth in GHWCFG3 and if it 4096 then update the comment.
> 
> Thanks,
> Minas
> 
> 
> 
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
