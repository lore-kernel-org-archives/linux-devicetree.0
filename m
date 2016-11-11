From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: dwc2: add amcc,dwc-otg support
Date: Fri, 11 Nov 2016 23:05:34 +0100
Message-ID: <1546251.ssrfyj8Loe@debian64>
References: <b1ec4a4425388cdee36be081971484db2a7d048a.1478897792.git.chunkeey@gmail.com> <bfd8be90-930d-1648-e663-0e0e8c496e02@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bfd8be90-930d-1648-e663-0e0e8c496e02-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Friday, November 11, 2016 1:22:16 PM CET John Youn wrote:
> On 11/11/2016 12:59 PM, Christian Lamparter wrote:
> > This patch adds support for the "amcc,usb-otg" device
> > which is found in the PowerPC Canyonlands' dts.
> > 
> > The device definition was added by:
> > commit c89b3458d8cc ("powerpc/44x: Add USB DWC DTS entry to Canyonlands board")'
> > but without any driver support as the dwc2 driver wasn't
> > available at that time.
> > 
> > Note: The system can't use the generic "snps,dwc2" compatible
> > because of the special ahbcfg configuration. The default
> > GAHBCFG_HBSTLEN_INCR4 of snps,dwc2 can cause a system hang
> > when the USB and SATA is used concurrently.
> 
> I don't want to add any more of these param structures to the driver
> unless really necessary. We're trying to remove usage of them in favor
> of using auto-detected defaults and device properties to override
> them.
Ok, thanks. I think that would work. I've attached an updated patch.
Can it be applied/queued now? Or do you want me to resent it later?

> The AHB Burst is actually one of the ones we were going to do next
> because our platform also doesn't work well with INCR4. In fact I'm
> thinking of making the default INCR.
Is that actually possible to change the default still? This would
require to re-evaluate all existing archs/platforms that use 
"snps,dwc2" for INCR16 compatibility. 

>From what I can tell based would be:
bcm11351, bcm21664, bcm23550, exynos3250, stm32f429, rk3xxx,
stratix10, meson-gxbb, rt3050 and some Altera FPGAs.

> If that's all you need then a devicetree binding should be enough
> right?
Yes. The device is working fine so far.

Regards,
Christian

---
>From 70dd4be016b89655a56bc8260f04683b50f07644 Mon Sep 17 00:00:00 2001
From: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 6 Nov 2016 00:39:24 +0100
Subject: [PATCH] usb: dwc2: add amcc,dwc-otg support

This patch adds support for the "amcc,usb-otg" device
which is found in the PowerPC Canyonlands' dts.

The device definition was added by:
commit c89b3458d8cc ("powerpc/44x: Add USB DWC DTS entry to Canyonlands board")'
but without any driver support as the dwc2 driver wasn't
available at that time.

Note: The system can't use the generic "snps,dwc2" compatible
because of the special ahbcfg configuration. The default
GAHBCFG_HBSTLEN_INCR4 of snps,dwc2 can cause a system hang
when the USB and SATA is used concurrently.

Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v1->v2:
	- moved definitons to params.c
	- removed dma_enable / host_dma parameter
	- added dma_desc_fs_enable parameter
v2->v3:
	- removed parameters

Please queue this patch until GAHBCFG_HBSTLEN_INCR16 is the default
for ahbcfg.
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
 drivers/usb/dwc2/params.c                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 10a2a4b..6ccfe85 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -12,6 +12,7 @@ Required properties:
   - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
   - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
+  - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 64d5c66..9506ab0 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -239,6 +239,7 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "samsung,s3c6400-hsotg", .data = NULL},
 	{ .compatible = "amlogic,meson8b-usb", .data = &params_amlogic },
 	{ .compatible = "amlogic,meson-gxbb-usb", .data = &params_amlogic },
+	{ .compatible = "amcc,dwc-otg", .data = NULL },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.10.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
