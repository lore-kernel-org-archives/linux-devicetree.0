From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation
 for USB root-hub
Date: Fri, 13 Oct 2017 10:15:05 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1710131008390.1364-100000@iolanthe.rowland.org>
References: <CAFBinCBwzzzj-ew-VTb9zojfzC9gedHd0uu0ez4WejBRTpnsWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCBwzzzj-ew-VTb9zojfzC9gedHd0uu0ez4WejBRTpnsWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 12 Oct 2017, Martin Blumenstingl wrote:

> Hi Alan,
> 
> On Thu, Oct 12, 2017 at 11:17 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> > On Thu, 12 Oct 2017, Martin Blumenstingl wrote:
> >
> >> I haven't tested the described use-case. however, this patch is not
> >> supposed to change the binding for actual devices.
> >> USB device numbering starts at 1, while 0 is reserved for the root-hub
> >> (at least from what I know).
> >
> > Actually 1 is reserved for the root hub.  External devices are numbered
> > starting from 2.  (We can't use 0 for the root hub because, as you
> > said, USB device numbering starts at 1!)
> I just had a look at lsusb again:
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
> 
> however, for the devicetree bindings the devices are supposed to use 1-31: [0]
> 
> Alan: just to make sure I understood you correctly: do you agree with
> this patch?

I have no idea.  I haven't read the patch and I'm not familiar with the
details of DeviceTree.  I was just trying to clear up your
misunderstanding of USB device numbering.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
