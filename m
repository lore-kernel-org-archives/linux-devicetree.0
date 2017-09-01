From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: rockchip: Add rk3288 vyasa board
Date: Fri, 01 Sep 2017 19:20:28 +0200
Message-ID: <3424135.KE5FrDYz9C@phil>
References: <1503742164-3926-1-git-send-email-jteki@openedev.com> <20170831210421.l2zmpexisagoxdks@rob-hp-laptop> <CAD6G_RSR35sX2x8xpdht0XUbnjeEBML9bxwCqtHYC7oM5fazEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD6G_RSR35sX2x8xpdht0XUbnjeEBML9bxwCqtHYC7oM5fazEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 1. September 2017, 22:36:08 CEST schrieb Jagan Teki:
> On Fri, Sep 1, 2017 at 2:34 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Sat, Aug 26, 2017 at 03:39:24PM +0530, Jagan Teki wrote:
> >> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >>
> >> This patch adds initial support for rk3288 based
> >> Vyasa board, which is made by Amarula Solutions.
> >>
> >> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> ---
> >> Changes for v2:
> >> - Added entry in Documentation/devicetree/bindings/arm/rockchip.txt
> >>
> >>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
> >>  arch/arm/boot/dts/Makefile                         |   3 +-
> >>  arch/arm/boot/dts/rk3288-vyasa.dts                 | 312 +++++++++++++++++++++
> >>  3 files changed, 318 insertions(+), 1 deletion(-)
> >>  create mode 100644 arch/arm/boot/dts/rk3288-vyasa.dts
> >
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > I assume the regulator node names are consistent with other platforms,
> > but at some point please fix them to be lowercase and not use '_'. IOW,
> > build the dtbs with "W=2" and fix the warnings.
> 
> Out-off these [1], only /i2c@ff650000 and  /memory are related to this
> dts and these are consistent across rk3288 dts node name, so there is
> nothing that I can fix here. If not please let me know if you find
> any.

And the regulator node-names are actually part of the rk808 binding,
so should also stay that way.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
