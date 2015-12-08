From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] doc: dt-binding: generic onboard USB HUB
Date: Tue, 08 Dec 2015 10:58:48 +0100
Message-ID: <19094869.VEiW4FjBL1@wuerfel>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com> <1449538670-7954-3-git-send-email-peter.chen@freescale.com> <1449568249.3691.15.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449568249.3691.15.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 08 December 2015 10:50:49 Philipp Zabel wrote:
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

Good point, I had not thought of that when I looked at the patches.

Yes, let's do this way. I don't know if we ever implemented the simple
patch to associate a USB device with a device_node, but if not, then
let's do it now for this driver. A lot of people have asked for it in
the past.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
