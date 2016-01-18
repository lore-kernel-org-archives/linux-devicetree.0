From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Mon, 18 Jan 2016 15:10:54 +0800
Message-ID: <20160118071054.GB8150@shlinux2>
References: <1452849447-25025-1-git-send-email-peter.chen@freescale.com>
 <1452877630.6067.97.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452877630.6067.97.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 15, 2016 at 06:07:10PM +0100, Philipp Zabel wrote:
> Am Freitag, den 15.01.2016, 17:17 +0800 schrieb Peter Chen:
> > Although most of USB devices are hot-plug's, there are still some devices
> > are hard wired on the board, eg, for HSIC and SSIC interface USB devices.
> > If these kinds of USB devices are multiple functions, and they can supply
> > other interfaces like i2c, gpios for other devices, we may need to
> > describe these at device tree.
> > 
> > In this commit, it uses "reg" in dts as port number to match the port
> > number decided by USB core, if they are the same, then the device node
> > is for the device we are creating for USB core.
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> > Changes for v3:
> > - typo: s/descirbe/describe/
> > 
> > Changes for v2:
> > - Fix build error reported by kbuild robot, lack of "static" for
> >   inline usb_of_get_child_node  
> > - Fix typo, "devcie_node" -> "device_node"
> > - Add kernel-doc for of_node at struct usb_device
> > 
> > Changes from RFC:
> > - Fix the error address for binding doc, and add compatible for binding doc
> > - Change get child node API from "usb_of_find_node" to
> >     "usb_of_get_child_node"
> > - Delete unecessary header files
> > - One typo
> > 
> >  .../devicetree/bindings/usb/usb-device.txt         | 17 ++++++++
> >  drivers/usb/core/Makefile                          |  2 +-
> >  drivers/usb/core/of.c                              | 47 ++++++++++++++++++++++
> >  drivers/usb/core/usb.c                             |  8 +++-
> >  include/linux/usb.h                                |  3 ++
> >  include/linux/usb/of.h                             |  7 ++++
> >  6 files changed, 81 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
> >  create mode 100644 drivers/usb/core/of.c
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
> > new file mode 100644
> > index 0000000..0468834
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.txt
> > @@ -0,0 +1,17 @@
> > +Generic USB Device Properties
> > +
> > +Usually, we only use device tree for hard wired USB device.
> > +The reference binding doc is from:
> > +http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> > +
> > +Required properties:
> > +- compatible: usbVID,PID
> 
> According to the binding doc that could be any of:
> 1) usbVID,PID.REV.configCN
> 2) usbVID,PID.REV
> 3) usbVID,PID.configCN
> 4) usbVID,PID
> 5) usbVID,classDC.DSC.DPROTO
> 6) usbVID,classDC.DSC
> 7) usbVID,classDC
> 8) usb,classDC.DSC.DPROTO
> 9) usb,classDC.DSC
> 10) usb,classDC
> 11) usb,device

But it includes too many patterns, I would like to limit it as specific
pattern to avoid user in future.

> 
> > +- reg: the port number which this device is connecting to.
> 
> Should it be noted here that the port number range is 1-255?
> 

I will note it as Alan suggested, thanks.

> > +
> > +
> > +Example:
> > +
> > +hub: genesys@01 {
> 
> According to the referenced document, the address representation should
> be "hexadecimal with leading zeroes suppressed".

Thanks, I will change, and note it.

> > @@ -502,11 +503,14 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
> >  	dev->connect_time = jiffies;
> >  	dev->active_duration = -jiffies;
> >  #endif
> > -	if (root_hub)	/* Root hub always ok [and always wired] */
> > +	if (root_hub) {	/* Root hub always ok [and always wired] */
> >  		dev->authorized = 1;
> > -	else {
> > +		dev->of_node = bus->controller->of_node;
> 
> Why can't the root_hub reuse dev->dev.of_node?
> 

This device is created by code dynamically, it doesn't know any
information about device node.

The devices belong to platform bus contains device node.
The devices belong to USB bus which are created dynamically do
not contain device node.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
