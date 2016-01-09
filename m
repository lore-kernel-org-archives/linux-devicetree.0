From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] USB: core: let USB device know device node
Date: Sat, 9 Jan 2016 17:05:12 +0800
Message-ID: <20160109090512.GD27759@shlinux2>
References: <1452231864-11171-1-git-send-email-peter.chen@freescale.com>
 <1452231864-11171-2-git-send-email-peter.chen@freescale.com>
 <CAL_JsqKwATxGiqJ_MNV6_pur1dUEVOzH+iB8yY+kWA0y2gWbNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKwATxGiqJ_MNV6_pur1dUEVOzH+iB8yY+kWA0y2gWbNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 08:32:45AM -0600, Rob Herring wrote:
> On Thu, Jan 7, 2016 at 11:44 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > Although most of USB devices are hot-plug's, there are still some devices
> > are hard wired on the board, eg, for HSIC and SSIC interface USB devices.
> > If these kinds of USB devices are multiple functions, and they can supply
> > other interfaces like i2c, gpios for other devices, we may need to
> > descirbe these at device tree.
> >
> > In this commit, it uses "reg" in dts as port number to match the port
> > number decided by USB core, if they are the same, then the device node
> > is for the device we are creating for USB core.
> >
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/usb-device.txt         |  8 ++++
> >  drivers/usb/core/Makefile                          |  2 +-
> >  drivers/usb/core/of.c                              | 48 ++++++++++++++++++++++
> >  drivers/usb/core/usb.c                             |  8 +++-
> >  include/linux/usb.h                                |  2 +
> >  include/linux/usb/of.h                             |  6 +++
> >  6 files changed, 71 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
> >  create mode 100644 drivers/usb/core/of.c
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
> > new file mode 100644
> > index 0000000..d35facd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.txt
> > @@ -0,0 +1,8 @@
> > +Generic USB Device Properties
> > +
> > +Usually, we only use device tree for hard wired USB device.
> > +The reference binding doc is from:
> > +http://playground.sun.com/1275/bindings/usb/usb-1_0.ps.
> 
> This path doesn't exist anymore. Use
> http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> 

Ok.

> > +
> > +Required properties:
> > +- reg: the port number which this device is connecting to.
> 
> At least compatible should also be here.
> 

What format for USB device compatible string has still not been decided.
Would you suggest something? At my example, I use "vid,pid".

> > + */
> > +struct device_node *usb_of_find_node(struct device_node *parent, int portnum)
> > +{
> > +       struct device_node *node;
> > +       u32 port;
> > +
> > +       for_each_child_of_node(parent, node) {
> > +               if (!of_property_read_u32(node, "reg", &port)) {
> > +                       if (port == portnum)
> > +                               return node;
> 
> This needs to match on the compatible string too. Otherwise, this
> could match in lots of cases.
> 

No, the port number is unique under the USB HUB (including host
controller, which is roothub), and there are some many compatible
string for USB devices.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
