From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: ventana: fix eth1 pci dev node
Date: Tue, 18 Mar 2014 14:15:19 -0600
Message-ID: <20140318201519.GA8637@obsidianresearch.com>
References: <1394747064-4106-1-git-send-email-tharvey@gateworks.com>
 <20140314132805.GD813@S2101-09.ap.freescale.net>
 <CAJ+vNU2Av-n1-efbFbXNvO4SmoobL_WpQKApFRS1Zjy0egLLzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2Av-n1-efbFbXNvO4SmoobL_WpQKApFRS1Zjy0egLLzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 18, 2014 at 01:02:55PM -0700, Tim Harvey wrote:
> > Is this whole bridge/switch hierarchy binding documented somewhere
> > or is this just something that work for you?
> 
> I'm not sure where its 'best' documented, but it is the way the
> kernel works.

It is documented in the 'PCI Bus Binding to Open Firware'
publication from IEEE.

> >> +             pcie@0,0 {
> >> +                     /* 01:00.0 PCIe switch */
> >> +                     #address-cells = <3>;
> >> +                     #size-cells = <2>;
> >> +                     device_type = "pci";
> >> +                     reg = <0x0 0 0 0 0>;
> >> +
> >> +                     pcie@8,0 {
> >
> > What's the naming schema for all these pcie nodes?  Generally, we should
> > have the numbers encoded in the node name coming from the address cells
> > in 'reg' property.

The 'reg' property for PCI encodes the device and function number, and
the suffix in the device path is of the form @DEVICE,FUNCTION (see
2.2.1.3 of the spec)

So device=8, function=0 is @8,0 and reg = 0x4000.

> I was hoping there was a way to reference PCI nodes by BDF values as
> I'm simply trying to define a marvell,sky2 device at 08:00.0.  I found
> that the kernel's OF parsing code for PCI requires you to nest the
> nodes to match the bus hierarchy.  In order to map a dt node to a PCI
> device, the bus the device is on must have a dt node itself, which is
> what creates the need for the nesting.  Note that the bus topology
> here rc -> P2P bridge -> GigE.

Right, otherwise the kernel and firmware would have to agree on bus
numbering. With nesting it only has to agree on the device numbering,
which is a fixed property of PCI.

> >> +                             /* 02:08.0 PCIe switch port */
> >> +                             #address-cells = <3>;
> >> +                             #size-cells = <2>;
> >> +                             device_type = "pci";
> >> +                             reg = <0x4000 0 0 0 0>;
> >> +                             eth1: pcie@0,0 {
> >> +                                     /* 08:00.0 GigE */
> >> +                                     #address-cells = <3>;
> >> +                                     #size-cells = <2>;
> >> +                                     device_type = "pci";
> >> +                                     reg = <0x0 0 0 0 0>;
> >> +                                     compatible = "marvell,sky2";
> >> +                             };

Don't forget your interrupts and interrupt-map - every DT nodes need
to describe how its interrupts are routed.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
