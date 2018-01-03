From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v17 0/5] ZII RAVE platform driver
Date: Wed, 3 Jan 2018 09:46:21 +0000
Message-ID: <20180103094621.su4umg2l5hggktlj@dell>
References: <20171221065118.29726-1-andrew.smirnov@gmail.com>
 <20180102151722.padevvmko7cmh7qv@dell>
 <CAHQ1cqEbesz4esB2Y79a5VERnR3O=hbX00ikH35psO2b-HNJ6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHQ1cqEbesz4esB2Y79a5VERnR3O=hbX00ikH35psO2b-HNJ6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Well I guess we better at least include them in the conversation.

Stephen and Andrew added.

On Tue, 02 Jan 2018, Andrey Smirnov wrote:
> On Tue, Jan 2, 2018 at 7:17 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, 20 Dec 2017, Andrey Smirnov wrote:
> >
> >> Everyone:
> >>
> >> This patch series is v17 of the driver for supervisory processor found
> >> on RAVE series of devices from ZII. Supervisory processor is a PIC
> >> microcontroller connected to various electrical subsystems on RAVE
> >> devices whose firmware implements protocol to command/qery them.
> >>
> >> NOTE:
> >>
> >>  * This driver dependends on crc_ccitt_false(), added by
> >>    2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next', the patch
> >>    was pulled in by Andrew Morton and is currently avaiting users, so
> >>    this series might have to go in through Andrew's tree
> >
> > Hmm... well that's annoying!  I just attempted to merge this set, but
> > early build tests fail due to a dependency already merged into -next.
> >
> > ../drivers/mfd/rave-sp.c:227:25: error:
> >     implicit declaration of function ‘crc_ccitt_false’
> >     [-Werror=implicit-function-declaration]
> >
> > We need to figure out if either of the following are true:
> >
> >  - Patch [0] can be dropped from Andrew's tree
> >    - ... and I can take it via the MFD tree instead

> FWIW, it seems to me that the path above should be doable (and might
> be simpler?). Let me know if any action needs to be taken on my part.
> 
> Thanks,
> Andrey Smirnov

> >  - Patch [0] is on an immutable branch I can pull in to my PR
> > 
> > If not, it will have to wait until the next cycle.
> > 
> > [0]:
> > 
> > Author: Andrey Vostrikov <andrey.vostrikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > Date:   Mon Dec 25 22:39:57 2017 +1100
> > 
> >     lib/crc-ccitt: add CCITT-FALSE CRC16 variant
> > 
> >     In support of a soon to be published MFD driver using serdev to talk to
> >     a supervisory processor that uses the CCITT-FALSE CRC16 variant in it's
> >     protocol, this patch was tested successfully on an i.MX6 ARM platform.
> > 
> >     Link: http://lkml.kernel.org/r/20170413142932.27287-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> >     Signed-off-by: Andrey Vostrikov <andrey.vostrikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >     Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >     Tested-by: Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >     Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> >     Signed-off-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
