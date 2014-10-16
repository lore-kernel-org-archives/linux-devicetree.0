From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Date: Thu, 16 Oct 2014 14:39:47 +0100
Message-ID: <20141016133947.GB24714@leverpostej>
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
 <20141013111611.GC15326@leverpostej>
 <543BB7FE.3030604@atmel.com>
 <543CFC41.2060506@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <543CFC41.2060506-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[...]

> >> That said, if we can build this dynamically, can't we always do so, and
> >> never need this property?
> >
> > Since board like at91sam9x5, sama5d3xek has a rom lookup table. And 
> > the sama5d4ek has no rom lookup table.
> > To present this, I make this property as optional.
> >
> > But yes, the pmecc lookup table related properties can be removed as 
> > driver can build it in runtime.
> > The cost is we need to use more memory to store the table.
> 
> In precisely, the table need to 32k bytes memory for 512-sector, and 64k 
> bytes for 1024-sector.
> 
> Also I spend time to testing the performance of this version.
> Compare with the version which use the SRAM rom lookup table, this 
> version (build table in runtim) cost about 5~10ms more.
> 
> So I prefer to keep this property as optional.

Sure. It sounds like it's always possible to ignore it later if we
choose to.

I just wouldn't mention what the driver should do in the binding --
whether or not the property is optional, the behaviour of the driver is
not a detail of the device.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
