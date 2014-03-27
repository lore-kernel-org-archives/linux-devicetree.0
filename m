From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] Serial port aliases in DT
Date: Thu, 27 Mar 2014 18:34:55 +0000
Message-ID: <1395945295.7339.8.camel@hornet>
References: <5448979.WQPtOb56tW@avalon>
	 <CAL_Jsq+SWZUz4D+3pdDs5yfi_XbTODC0ytt1S5KpmR_C5vVL=A@mail.gmail.com>
	 <20140327151829.GX17250@pengutronix.de> <4966076.uASvrV0Iy2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4966076.uASvrV0Iy2@wuerfel>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-03-27 at 18:26 +0000, Arnd Bergmann wrote:
> >  Many
> > devicetrees specify aliases for i2c/spi/mmc controllers aswell.  Should
> > they order their i2c controllers in the order of preference now?
> > 
> > Most dtsi files in the kernel specify a SoC specific order of aliases
> > and I think this makes the most sense.
> 
> I disagree with this one: the aliases should be a board specific
> property, if not settable in the boot loader. This is how it traditionally
> work on OF, and I think it's the most sensible approach for end users:
> If the machine has multiple serial ports coming out the back, they are
> normally numbered in some way, and the numbers should match what you
> see in the OS, regardless of what the SoC calls them.

I'm with you on this one, for what it's worth.

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
