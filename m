From: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when
 CONFIG_OF isn't set
Date: Tue, 11 Feb 2014 20:15:25 -0600
Message-ID: <20140212021525.GK841@joshc.qualcomm.com>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <1596542.hkJp71u3OJ@avalon>
 <20140211164825.GC841@joshc.qualcomm.com>
 <6446980.WMjvBYStRY@avalon>
 <20140211180845.GG841@joshc.qualcomm.com>
 <CAMuHMdVkPLe5986hYPApoQr7oJSb6U2P71=nP+9mtvtaskdHXg@mail.gmail.com>
 <CAL_JsqKnsr-9nSjCGvroC0nDK36vQUnwMWj=cPjvUbRymmHFOQ@mail.gmail.com>
 <20140211215519.GJ841@joshc.qualcomm.com>
 <CAL_JsqJdbBuv0TgN7Okrxa4MmEon6a74hv458VFS=8RpcyX5tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJdbBuv0TgN7Okrxa4MmEon6a74hv458VFS=8RpcyX5tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 05:14:51PM -0600, Rob Herring wrote:
> On Tue, Feb 11, 2014 at 3:55 PM, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
[..]
> > Okay, so maybe caching a pointer in the device isn't the best option,
> > what if we considered extending the platform_driver callbacks to include
> > a set of per-method (?) probe callbacks which do provide a handle to
> > matched identifiers.
> >
> > In the case of a totally contrived platform_driver supporting ACPI, OF,
> > and !OF configurations, it might look something like:
> >
> >         static const struct of_device_id acme_of_table[] = {
> >                 /* ... */
> >                 { },
> >         };
> >         MODULE_DEVICE_TABLE(of, acme_of_table);
> >
> >         static int acme_probe_of(struct platform_device *pdev,
> >                                  const struct of_device_id *id)
> 
> I don't think this is the right direction. You might want to look at
> of_platform_driver in git history...

Thanks for the pointer, of_platform_driver was on it's way out the door
while I was still coming up to speed on devicetree.

To be clear, I'm not proposing that we reintroduce a new bus_type, or
duplicate driver instances, or anything that made of_platform_driver a
pain to deal with.

I'm only suggesting that we consider providing a set of interfaces that
1) provide a simpler/more convenient way for a driver to get at matched
id table entries, and 2) provide a clearer, declarative mechanism by
which a platform driver might isolate it's firmware-specific glue bits
from core driver logic.

Anyway, thanks for hearing me out!

  Josh

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
