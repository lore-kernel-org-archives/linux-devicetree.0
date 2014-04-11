From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dt-binding: fix GIC example
Date: Fri, 11 Apr 2014 09:16:04 +0800
Message-ID: <20140411011602.GF28420@dragon>
References: <1396023951-32383-1-git-send-email-l.stach@pengutronix.de>
 <CAL_Jsq+_+B=TKMQ2ULkXiBJGTNmGGLkB1xjKNJkF1BK_4TRXkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+_+B=TKMQ2ULkXiBJGTNmGGLkB1xjKNJkF1BK_4TRXkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 10:21:35AM -0500, Rob Herring wrote:
> On Fri, Mar 28, 2014 at 11:25 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> >
> > When using interrupt-maps, the size of a map entry is #address-cells +
> 
> Plus what? You mean ", and "?
> 
> > address-cells should be 0 as this is not used.
> >
> > As #address-cells = <0> is the same as not specifying the
> > property, simply remove it.
> >
> > Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Did this get applied? I can't seem to find patch 2.

No.  We expect this patch to be applied on DT tree, while the
patch #2 [1] is going through IMX tree.

Shawn

[1] http://www.spinics.net/lists/arm-kernel/msg318810.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
