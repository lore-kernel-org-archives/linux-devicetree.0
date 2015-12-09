From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/3] doc: dt-binding: generic onboard USB HUB
Date: Wed, 9 Dec 2015 16:09:34 +0800
Message-ID: <20151209080933.GA941@shlinux2>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
 <1449538670-7954-3-git-send-email-peter.chen@freescale.com>
 <1449568249.3691.15.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449568249.3691.15.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 08, 2015 at 10:50:49AM +0100, Philipp Zabel wrote:
> Hi Peter,
> 
> Am Dienstag, den 08.12.2015, 09:37 +0800 schrieb Peter Chen:
> > Add dt-binding documentation for generic onboard USB HUB.
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  .../bindings/usb/generic-onboard-hub.txt           | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt b/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
> > new file mode 100644
> > index 0000000..ea92205
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
> > @@ -0,0 +1,28 @@
> > +Generic Onboard USB HUB
> >+
> > +Required properties:
> > +- compatible: should be "generic-onboard-hub"
> 
> This something we don't have to define ad-hoc. The hub hangs off an USB
> controller, right? The "Open Firmware recommended practice: USB"
> document already describes how to represent USB devices in a generic
> manner:
> http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> 
> Is there a reason not to reuse this?
> 
> The usb hub node would be a child of the usb controller node, and it
> could use
> 	compatible = "usb,class9"; /* bDeviceClass 9 (Hub) */
> 

Before writing this driver, I did consider how to let the USB core
handle device tree, but without good solution.

The controller (platform) driver should not handle specific USB device
described at device tree, since we want this handling to be generic.
And the USB device may not be recognized by controller without handling
its properties, like clock, reset pins.

With your suggestion, the dts likes below

usbh1: usb@02184000 {
	compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
	reg = <0x02184000 0x200>;
	interrupts = <0 43 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&clks IMX6QDL_CLK_USBOH3>;
	usb_hub@1 {
		compatible = "usb,class9"
		clocks = <&clks USB_HUB_CLK>;
		....
	};
};

I don't know how to handle above at USB bus, if you have any
suggestions, give me some tips please.

> 
> > +Optional properties:
> > +- clocks: the input clock for HUB.
> > +
> > +- clock-names: Should be "external_clk"
> 
> Is clock-names necessary for a single clock?
> 
> > +- hub-reset-gpios: Should specify the GPIO for reset.
> 
> I'd prefer that to be just "reset-gpios", it is the only reset property
> in the hub node after all. And use the GPIO_ACTIVE_HIGH/LOW flags to
> indicate polarity.

I will change to "clk" and "reset-gpios".

> 
> > +- hub-reset-active-high: the active reset signal is high, if this property is
> > +  not set, the active reset signal is low.
> 
> Then this could be dropped.
> 
> > +- hub-reset-duration-us: the duration for assert reset signal, the time unit
> > +  is microsecond.
> 
> And consequently, this could just be called "reset-duration-us".
> It might make sense to define the same for other reset GPIOs, too.
> The Freescale FEC, for example, has "phy-reset-duration" (in ms)
> already.
> 

Agree.

By the way: Felipe suggest using generic reset gpio driver to handle
above, I find you have written similar things before [1], why it can't be
accepted?

[1]http://comments.gmane.org/gmane.linux.ports.arm.kernel/255129
-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
