From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Question] refcount of DT node
Date: Thu, 14 Apr 2016 10:59:57 +0100
Message-ID: <20160414095957.GB10273@leverpostej>
References: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com>
 <20160414084849.GT19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160414084849.GT19428-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, rank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 09:48:49AM +0100, Russell King - ARM Linux wrote:
> On Thu, Apr 14, 2016 at 04:47:57PM +0900, Masahiro Yamada wrote:
> > Hi experts.
> > 
> > My understanding of refcount of DT node is poor.
> 
> The message from DT people is... don't worry about DT node refcounting.
> Do whatever you want with it, they don't care whether you have correct
> refcounting or not.
> 
> The background behind that is that I've tried to fix the refcounting,
> and even had the coccinelle people generate some stuff to work on this
> issue, but DT people's attitude towards it is "don't bother".
> 
> So yes, people may get it wrong, but it seems it's something that DT
> people want ignored.

I'm not sure that's quite fair; the last discussion I recall about this
ended up concluding that we need a better API, rather than papering over
problems.

That said, there isn't much obvious progress on that front.

Frank, Pantelis, Rob, were there any conclusions on this from ELC, or is
this something that needs someone to propose something?

Mark.

[1] http://permalink.gmane.org/gmane.linux.drivers.devicetree/153777
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
