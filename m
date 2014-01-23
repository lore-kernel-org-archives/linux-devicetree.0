From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 2/2] ehci-platform: Add support for controllers with
 big-endian regs / descriptors
Date: Thu, 23 Jan 2014 10:46:45 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401231044110.1279-100000@iolanthe.rowland.org>
References: <20140123000330.00002567@openwrt.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140123000330.00002567-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 23 Jan 2014, Jonas Gorski wrote:

> On Wed, 22 Jan 2014 16:17:42 -0500 (EST)
> Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> 
> > On Wed, 22 Jan 2014, Jonas Gorski wrote:
> > 
> > > If it's safe to set ehci->big_endian_{desc,mmio} from the _probe()
> > > routine, then maybe the pdata sets in _reset() should be moved into here
> > > instead of adding extra cludges/checks into _reset().
> > 
> > Why?  What difference would it make?
> 
> Effectivewise none, but to me it seems to be cleaner to set them once in
> probe() instead of everytime reset() is called.
> 
> I admit I don't know the code flow good enough if reset() is called
> more than once in the lifetime of a hcd device.

Only once.

> And as I said, it would allow doing the checks the patch adds for both
> DT and !DT, not just DT only.

That's true.  Or the checks could be moved into the probe routine.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
