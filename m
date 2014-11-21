From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: Add clock driver for mb86s7x
Date: Fri, 21 Nov 2014 15:34:05 +0100
Message-ID: <2147877.AXJukoovHQ@wuerfel>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com> <2396055.pBuh1YtUHT@wuerfel> <CAJe_ZhcxHnoUeBUk3w=_xyk5oMAuena9RjDnyRvzLtV2=LpQxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZhcxHnoUeBUk3w=_xyk5oMAuena9RjDnyRvzLtV2=LpQxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 21 November 2014 18:52:47 Jassi Brar wrote:
> On 21 November 2014 18:33, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Thursday 20 November 2014 20:36:15 Vincent Yang wrote:
> >> +#define __DTS_MB86S70_CLK_H
> >> +
> >> +#define MB86S70_CRG11_ALW      0
> >> +#define MB86S70_CRG11_DDR3     1
> >> +#define MB86S70_CRG11_MAIN     2
> >> +#define MB86S70_CRG11_CA15     3
> >> +#define MB86S70_CRG11_HDMI     4
> >> +#define MB86S70_CRG11_DPHY     5
> >> +
> >> +#define MB86S70_CRG11_UNGPRT   8
> >>
> >
> > The clock driver doesn't seem to use those macros at all, how does the
> > driver know which clock you are referring to?
> >
> That was just an attempt to make a bit verbose the controller
> instance. Instead of specifying controller:=4, it reads better
> controller:=MB86S70_CRG11_HDMI in the clock DT nodes. The clock driver
> simply fills in controller+domain+port of the given clock into mailbox
> payload.

See my other comments on the clock nodes. If these are hardware properties,
just leave them as numbers in the DT, the header files are only used to
establish an interface between the binding and the driver in case there
is no sensible way to express which one you have.
 
> Only MB86S70_CRG11_UNGPRT is marked to mean one special (non-maskable)
> port on the controller, which the clock driver does make use of.

Is this the actual port number that is known to be non-maskable?
How about adding a property to the clock node to mark the logical
controller nonmaskable (in case you go for #clock-cells=2)?

For the #clock-cells=3 case, you should probably just hardcode this
in the driver based on the compatible string.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
