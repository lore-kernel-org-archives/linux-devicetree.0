From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ohci and ehci-platform clks, phy and
 dt support
Date: Mon, 13 Jan 2014 11:06:13 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401131105130.1152-100000@iolanthe.rowland.org>
References: <52D40C42.2050408@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBD6LRVPZ6YGRB5U52CLAKGQENPLNQUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52D40C42.2050408-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jan 2014, Hans de Goede wrote:

> I agree that usb-Xhci would be the best compatible strings to use.
> 
> The problem with usb-ehci is that there already is a ppc specific driver binding to that
> compatible string, doing various ppc specific controller initialization.
> 
> Thinking more about this, there is one possible solution though, the ehci-ppc-of.c is
> guarded in Kconfig with:
> 
>          depends on PPC_OF
> 
> If we add an inverted check to the Kconfig option for platform-ehci.c, ie:
> 
> config USB_EHCI_HCD_PLATFORM
>          tristate "Generic EHCI driver for a platform device"
> 	depends on !PPC_OF
> 
> Then we can be certain that we don't end up with 2 drivers claiming the
> usb-ehci compatible on ppc platforms. I've done some quick research
> and it seems that ehci-platform.c is only used on arm and mips devices, so
> excluding its use on ppc should not be an issue.
> 
> Then later on someone, who has the actual hardware to test, can merge the
> ppc specific quirk handling into ehci-platform,c and ehci-ppc-of.c can go
> away entirely.
> 
> Alan, if you agree this is the best way forward, I'll do a v5 with the proposed
> changes.

That's okay with me.

Alan Stern
