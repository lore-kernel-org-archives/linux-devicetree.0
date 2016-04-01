From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] doc: dt: mtd: add a DT property to enable the use
 of 4byte-address op codes
Date: Fri, 1 Apr 2016 13:42:36 -0700
Message-ID: <20160401204236.GE3645@localhost>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
 <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
 <CAL_JsqKUMhPwxrhz50D8+UAaVPT_+=xJLm6A6fVy6RgpyOnq8w@mail.gmail.com>
 <56F2B18A.3020107@atmel.com>
 <56F54ED2.3030609@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56F54ED2.3030609-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, boris brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek =?utf-8?B?VmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 25, 2016 at 03:44:34PM +0100, Cyrille Pitchen wrote:
> Hi all,
> 
> Since the framework is named spi-nor, what about spi-nor-4byte-opcodes?
> Is it okay for everyone?
> 
> It would follow the same pattern as spi-max-frequency which applies to all SPI
> devices.

"spi-nor-" as a prefix seems better, thanks.

I'm still not confident we've settled the discussion on the need for
this property. I really don't like having a mixture of ways to specify
the same thing, so if we can avoid it in any way (e.g., by just being
more specific about device names), then I'd probably prefer that.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
