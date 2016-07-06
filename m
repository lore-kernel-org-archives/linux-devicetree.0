From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Question] Memory attribute reserved by Device Tree?
Date: Wed, 6 Jul 2016 10:34:58 +0100
Message-ID: <20160706093457.GA14657@leverpostej>
References: <CAK7LNATGoP-Wn-wiK_CgD_v=rQXyt937qRvr8LkUQ06jHB7FAA@mail.gmail.com>
 <577504D7.7080106@arm.com>
 <20160630122554.GC20363@leverpostej>
 <CAK7LNAQJNYVFjZyMH=kU+VJLfUCr2EwKc51HB4knZ=XM7s+MQg@mail.gmail.com>
 <CAKv+Gu_iF31mBbg1pMawq+7fPDo4iXdGWJT_nWV4Oy+AqDpFOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_iF31mBbg1pMawq+7fPDo4iXdGWJT_nWV4Oy+AqDpFOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2016 at 07:34:58AM +0200, Ard Biesheuvel wrote:
> On 6 July 2016 at 06:10, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> > My motivation is to try my own implementation of PSCI for my ARMv7 SoC.
> >
> > I put my PSCI firmware somewhere in the DRAM region and
> > protected it with /memreserve/, but I was not sure what kind of memory attribute
> > is used for the area.
> 
> As Mark implies, /memreserve/ entries are not suitable for this, and
> you should create an entry under /reserved-memory instead (please
> check the bindings under Documentation/ for details).

I'd strongly recommend that the memory in question was carved out of the
memory node, rather than using a reserved-memory node. The OS has
absolutely no reason to know about this memory in the first place.

This is more robust as other agents will similarly not poke the memory.

> This not only allows you to add a no-map attribute to prevent the
> kernel from mapping it (which allows you to map it any way you like),
> it also guarantees that the reservation is honoured even when booting
> via UEFI, as /memreserve/s are ignored in this case.

You'll still need to teach your UEFI implementation to reserve the
region (and to not give it cacheable attributes), to enable this, so
similarly I'd recommend that it is completely removed from the memory
map -- no agent other than the PSCI implementation has any reason to map
this memory.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
