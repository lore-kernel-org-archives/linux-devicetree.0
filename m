From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Fri, 18 Nov 2016 21:18:08 +0100
Message-ID: <6396482.jQaH1ArAfZ@debian64>
References: <cover.1479339900.git.johnyoun@synopsys.com> <633e5a10-1ea0-48c7-a5b7-a5ff2625e759@i2se.com> <20161118141608.r7jsu7pfc4ztjt33@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118141608.r7jsu7pfc4ztjt33@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, November 18, 2016 8:16:08 AM CET Rob Herring wrote:
> On Thu, Nov 17, 2016 at 04:35:10PM +0100, Stefan Wahren wrote:
> > Hi John,
> > 
> > Am 17.11.2016 um 00:47 schrieb John Youn:
> > > Add the "snps,ahb-burst" binding and read it in.
> > >
> > > This property controls which burst type to perform on the AHB bus as a
> > > master in internal DMA mode. This overrides the legacy param value,
> > > which we need to keep around for now since several platforms use it.
> > >
> > > Some platforms may see better or worse performance based on this
> > > value. The HAPS platform is one example where all INCRx have worse
> > > performance than INCR.
> > >
> > > Other platforms (such as the Canyonlands board) report that the default
> > > value causes system hangs.
> > >
> > > Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > > Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/dwc2.txt |  2 +
> > >  drivers/usb/dwc2/core.h                        |  9 +++++
> > >  drivers/usb/dwc2/params.c                      | 56 ++++++++++++++++++++++++++
> > >  3 files changed, 67 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> > > index 6c7c2bce..9e7b4b4 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> > > +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> > 
> > according to Documentation/devicetree/bindings/submitting-patches.txt
> > this change should be a separate patch.
> > 
> > > @@ -26,6 +26,8 @@ Optional properties:
> > >  Refer to phy/phy-bindings.txt for generic phy consumer properties
> > >  - dr_mode: shall be one of "host", "peripheral" and "otg"
> > >    Refer to usb/generic.txt
> > > +- snps,ahb-burst: specifies the ahb burst length. Valid arguments are:
> > > +  "SINGLE", "INCR", "INCR4", "INCR8", "INCR16". Defaults to "INCR4".
> > 
> > This doesn't apply in case of the bcm2835. I would prefer this option is
> > ignored in that case with a dev_warn("snps,ahb-burst is not supported on
> > this platform").
> 
> Also, perhaps you should allow that the compatible string can define the 
> default.
> 
I hoped you would say that :).

I've attached a patch (on top of John Youn changes) that does
just that for the amcc,dwc-otg. I put the GAHBCFG_HBSTLEN_INCR
value into the .data, if that's a problem, I can certainly 
respin the patch and put it in a dedicated struct.

Regards

Christian
---
>From 4c31a029dde714828810b1c3e61a5b1412ac939a Mon Sep 17 00:00:00 2001
From: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Fri, 18 Nov 2016 21:03:19 +0100
Subject: [PATCH] usb: dwc2: add a default ahb-burst setting for amcc,dwc-otg

This patch adds a of_device_id table which can be used by
existing devices to supply a ahb-burst value for the platform
without having to add a "snps,ahb-burst" entry to the dts.

Note: Adding new devices to this table is discouraged.
      please consider adding the "snps,ahb-burst" property
      with the correct configuration to your device tree
      file instead.

Signed-off-by: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/dwc2/params.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index e0fc9aa..51be266 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1097,6 +1097,22 @@ static const char *const ahb_bursts[] = {
 	[GAHBCFG_HBSTLEN_INCR16]	= "INCR16",
 };
 
+/*
+ * This table provides AHB burst configuration for existing
+ * device tree bindings that work poorly with the default setting.
+ *
+ * Note: Adding new devices to this table is discouraged.
+ *	 please consider adding the "snps,ahb-burst" property
+ *	 with the correct configuration to your device tree
+ *	 file instead.
+ */
+static const struct of_device_id dwc2_compat_ahb_bursts[] = {
+	{
+		.compatible = "amcc,dwc-otg",
+		.data = (void *) GAHBCFG_HBSTLEN_INCR16,
+	},
+};
+
 static int dwc2_get_property_ahb_burst(struct dwc2_hsotg *hsotg)
 {
 	struct device_node *node = hsotg->dev->of_node;
@@ -1107,6 +1123,12 @@ static int dwc2_get_property_ahb_burst(struct dwc2_hsotg *hsotg)
 	ret = device_property_read_string(hsotg->dev,
 					  "snps,ahb-burst", &str);
 	if (ret < 0) {
+		const struct of_device_id *match;
+
+		match = of_match_node(dwc2_compat_ahb_bursts, node);
+		if (match)
+			ret = (int)match->data;
+
 		return ret;
 	} else if (of_device_is_compatible(node, "brcm,bcm2835-usb")) {
 		dev_warn(hsotg->dev,
-- 
2.10.2





--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
