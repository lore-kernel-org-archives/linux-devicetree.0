From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Thu, 22 Jan 2015 18:27:07 +0000
Message-ID: <20150122182707.GD12911@leverpostej>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
 <20150121162938.GJ5044@leverpostej>
 <CAL_JsqJDNziqcX-8cq0PkSE61NVpmSBUM+fo3vmD3WrBG3=R7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDNziqcX-8cq0PkSE61NVpmSBUM+fo3vmD3WrBG3=R7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[...]

> >> * A mechanism would be needed to pass an additional device tree.
> >>
> >> 2) Modify the standard device tree blob to include annotations or
> >> modifications to describe which resources are secure or not.  In this
> >> case, secure software would use the single device tree to identify the
> >> secure resources.  The added information could be used by secure
> >> software to trim the device tree before passing it.  Alternatively,
> >> the information could be passed on to non-secure software with the
> >> expectation that it would honor the device security.   It would be
> >> crucial that any data added to the device tree adhere to existing
> >> conventions or expectations.
> >
> > This approach assumes assumes that the secure and non-secure physical
> > address spaces are identical bar some portions being masked out on the
> > non-secure side. This is not necessarily the case.
> 
> True, but I would guess this is the common case.

In practically every system I can think of, the address spaces are
essentially the same bar masking.

However, if we're trying to model the architectural envelope, then the
fact that a single DTB can't encode that needs some consideration in
this matter.

> > Architecturally the secure and non-secure physical address spaces are
> > entiorely separate, and do not necessarily mirror each other.
> >
> > It's entirely valid for some devices/RAM to only exist in one of the
> > address spaces (we typically see secure-only devices, but
> > non-secure-only devices are also possible). It's also entirely valid for
> > the same device to be mapped at different addresses in each address
> > space (e.g. the same UART could be mapped at both S:0xffff0000 and also
> > at NS:0xcccc0000 and nowhere else in either address space).
> >
> > So approach (2) does not fit the architecture generally. From what I
> > recall of previous discussions, we eventually figured out that you
> > either need separate trees or a higher level container to address the
> > secure vs nonsecure split.
> 
> Though there's no reason both approaches can't be supported. If the 2
> views are radically different, then use 2 DTs. If they are similar and
> just a matter of partitioning, then you can fix up the DT before
> passing to non-secure world (or even do this with a script offline
> (i.e. 1 dts and 2 dtb's)).

That sounds possible, yes.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
