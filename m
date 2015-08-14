From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [U-Boot] [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Fri, 14 Aug 2015 18:42:36 +0000
Message-ID: <31536443bf1d4391bca294bc24d71aef@DRHQMAIL105.nvidia.com>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
	 <1438954951-13329-2-git-send-email-sjg@chromium.org>
	 <CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>
	 <CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>
	 <55CCBFB2.7050301@wwwdotorg.org> <20150813181346.GS25532@bill-the-cat>
	 <1439492679.242.35.camel@freebsd.org>
	 <CAL_JsqL8tcECpdwCxatd6ULS8z0UU160OXr8S0ZGTTRRrUaeSQ@mail.gmail.com>
 <1439574356.242.60.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439574356.242.60.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ian Lepore  wrote at Friday, August 14, 2015 11:46 AM:
> On Fri, 2015-08-14 at 09:27 -0500, Rob Herring wrote:
> > On Thu, Aug 13, 2015 at 2:04 PM, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > > On Thu, 2015-08-13 at 14:13 -0400, Tom Rini wrote:
> > >> On Thu, Aug 13, 2015 at 10:02:58AM -0600, Stephen Warren wrote:

...
 (Replying from my NVIDIA address, since one of the mail servers in the path to
you bounced my last reply. Apologies for any formatting issues.)

> > > A great case in point would be i2c eeproms.  What a perfect
> > > opportunity DT would be to describe everything about the eeprom
> > > parts (total capacity, page read/write size, whether the page
> > > address bits extend into the bus-slave address bits, etc).  It seems
> > > to me that anything claiming to be an independent description of the
> > > hardware would have to include such things.  Instead, all the
> > > bindings define is the compatible string.  That's crazy.  Why?
> > > Well, when I went and looked at the Linux eeprom drivers it became
> > > clear why:  that's all they need to know, because everything else is hard-
> > > coded in tables in the driver source.
> >
> > Think of compatible as a PID/VID pair like USB or PCI. It is simply a
> > unique identifier. You don't get any more information with PCI or
> > non-class USB devices. DT was originally only solving the problem of
> > finding the non-probeable h/w. It's grown to be a lot more with
> > today's SOCs.
> >
> > The more we put into DT the more chance it can be wrong and then we
> > have to work around not h/w quirks, but DT quirks.
> >
> > That said we can always add to the bindings. It would have to be
> > worded something like "optional, but required for new dts's". You
> > would have to have a new DTB if the OS is dependent on the new
> > properties.
> >
> > > So if I want to write a FreeBSD i2c eeprom driver that uses DT data,
> > > what are my choices?  I have exactly one:  make my driver
> > > essentially a clone of the Linux driver, with all the same data hard-coded
> > in source.
> >
> > Don't you already have these drivers w/o using DT? If you did, you
> > would have this information already in the drivers. It wouldn't be a
> > question of the binding being Linux specific, but rather can we move
> > more of the data out of drivers and into DT. That is fundamentally a
> > different issue than is a binding Linux specific.
> 
> This last paragraph most eloquently illustrates the point I was trying to make:
> From the point of view of someone who only knows about the existing linux
> driver and how it is written, the current DT data is perfect.  It's exactly what
> that existing driver needs to know, and from that position you can argue that
> it is thus the ONLY thing any driver written by anyone would need to know.
> That assumes that everyone wants to just clone the linux drivers (or in our
> case, because of licensing, rewrite the drivers in a completely linux-
> compatible way that somehow isn't simply copying them in violation of the
> GPL).

I believe this is nothing to do with encoding Linuxisms into the DT. It's part of
DT itself. DT practice is generally to encode the device model name/number
into DT (perhaps with a few properties for extra details) rather than to encode
a completely generic device type (e.g. "I2C EEPROM") along with all the possible
information anyone could ever want to know about that device.

As Rob and Geert mentioned before, "all the possible information" is something
that's generally not possible to enumerate fully and/or correctly.

If DT weren't an ABI, that might not be a problem; we'd just change the schema,
fix the bug and move on. However since DT is an ABI, we can't just go back and
fix mistakes.

The fact the way DT represents devices aligns well with some aspects of the Linux
driver model is nice, but in no way a Linuxism; I believe DT was like this well before
Linux used DT.

-- 
nvpbulic

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
