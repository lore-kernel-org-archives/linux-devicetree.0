From: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Fri, 14 Aug 2015 11:45:56 -0600
Message-ID: <1439574356.242.60.camel@freebsd.org>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
	 <1438954951-13329-2-git-send-email-sjg@chromium.org>
	 <CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>
	 <CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>
	 <55CCBFB2.7050301@wwwdotorg.org> <20150813181346.GS25532@bill-the-cat>
	 <1439492679.242.35.camel@freebsd.org>
	 <CAL_JsqL8tcECpdwCxatd6ULS8z0UU160OXr8S0ZGTTRRrUaeSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL8tcECpdwCxatd6ULS8z0UU160OXr8S0ZGTTRRrUaeSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-08-14 at 09:27 -0500, Rob Herring wrote:
> On Thu, Aug 13, 2015 at 2:04 PM, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > On Thu, 2015-08-13 at 14:13 -0400, Tom Rini wrote:
> >> On Thu, Aug 13, 2015 at 10:02:58AM -0600, Stephen Warren wrote:
> >> 
[...]
> >>
> >> This always makes me ask if the FreeBSD folks or VxWorks folks have
> >> adopted the "Linux" bindings or if the DT files continue to be
> >> "OS-agnostic" and "only functional with Linux".  It was a while ago last
> >> I looked but it made my head hurt a little doing a quick translation for
> >> an SoC that I was familiar with.
> >>
> >
> > As the FreeBSD person who got our first SoC (imx6, only partially
> > supported) converted to use the Linux DT files rather than our own
> > homebrew mess we started with, I would say that my opinion of the
> > existing DT information is that it is an extension of Linux device
> > drivers written in a different language.
> 
> Sadly, we see little non-Linux participation on DT lists. We've tried
> to separate core (devicetree-spec) and driver lists, but pretty much
> everything still goes to one list and it is a fire hose. I'm open for
> ideas on how to get more non-Linux participation.
> 

I've been lurking on the 3 devtree lists I know about for over a year.
This was the first time something came up that I could make a useful
reply to.  I think part of that has to do with us being years behind in
DT adoption in FreeBSD, and not having the resources to catch up quickly
(or, probably to keep up if we ever caught up).

[...]

> >
> > A great case in point would be i2c eeproms.  What a perfect opportunity
> > DT would be to describe everything about the eeprom parts (total
> > capacity, page read/write size, whether the page address bits extend
> > into the bus-slave address bits, etc).  It seems to me that anything
> > claiming to be an independent description of the hardware would have to
> > include such things.  Instead, all the bindings define is the compatible
> > string.  That's crazy.  Why?  Well, when I went and looked at the Linux
> > eeprom drivers it became clear why:  that's all they need to know,
> > because everything else is hard-coded in tables in the driver source.
> 
> Think of compatible as a PID/VID pair like USB or PCI. It is simply a
> unique identifier. You don't get any more information with PCI or
> non-class USB devices. DT was originally only solving the problem of
> finding the non-probeable h/w. It's grown to be a lot more with
> today's SOCs.
> 
> The more we put into DT the more chance it can be wrong and then we
> have to work around not h/w quirks, but DT quirks.
> 
> That said we can always add to the bindings. It would have to be
> worded something like "optional, but required for new dts's". You
> would have to have a new DTB if the OS is dependent on the new
> properties.
> 
> > So if I want to write a FreeBSD i2c eeprom driver that uses DT data,
> > what are my choices?  I have exactly one:  make my driver essentially a
> > clone of the Linux driver, with all the same data hard-coded in source.
> 
> Don't you already have these drivers w/o using DT? If you did, you
> would have this information already in the drivers. It wouldn't be a
> question of the binding being Linux specific, but rather can we move
> more of the data out of drivers and into DT. That is fundamentally a
> different issue than is a binding Linux specific.

This last paragraph most eloquently illustrates the point I was trying
to make:  From the point of view of someone who only knows about the
existing linux driver and how it is written, the current DT data is
perfect.  It's exactly what that existing driver needs to know, and from
that position you can argue that it is thus the ONLY thing any driver
written by anyone would need to know.  That assumes that everyone wants
to just clone the linux drivers (or in our case, because of licensing,
rewrite the drivers in a completely linux-compatible way that somehow
isn't simply copying them in violation of the GPL).

Until now we've always used an older sideband metadata mechanism,
"device hints".  It basically consists of putting strings into the
kernel environment in a structured way that allows drivers to find the
ones they need at runtime (dev.driver.unitnum.attribute="whatever").  So
our i2c eeprom driver has never before had any idea what type of eeprom
it was servicing.  All it knows is what it needs to know to work with
the chip: the addressing, the page sizes, the capacity, etc.

I don't consider it especially onerous to have to hard-code a table of
eeprom chip attributes into a driver.  All in all, it'll be easier than
parsing the equivelent DT data.  But for me, this dichotomy between the
goal of "an OS-agnostic description of the hardware" and reality of
"exactly the data the linux driver needs, no more, no less" was pefectly
illustrated by the very simple i2c eeprom case.

Imagine how much more harder the problem is for us to deal with for
devices more complex than a 2-wire eeprom.

-- Ian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
