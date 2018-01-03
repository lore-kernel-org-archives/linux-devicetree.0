From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6: RDU2: disable internal watchdog
Date: Wed, 3 Jan 2018 15:06:54 -0200
Message-ID: <CAOMZO5BAH4Dv7VFucBe080XQWoQ8pfmo1=4-sCa9L8PXJp_TfA@mail.gmail.com>
References: <20180101212451.11516-1-andrew.smirnov@gmail.com>
 <CAOMZO5AZU0LOcz6s2w-mThJfJeO0_mXga_1Cc2-aBkMOXk_-dA@mail.gmail.com> <CAHQ1cqGE8GzHiHq0NRPoAKmrqv6ZDcFO+0=hnAEtog8jcnapyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHQ1cqGE8GzHiHq0NRPoAKmrqv6ZDcFO+0=hnAEtog8jcnapyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 3, 2018 at 3:04 PM, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> It seems that with exception of "audmux" and "iomuxc" the nodes are in
> alphabetical order (and I suspect "audmux" falls under the same
> exception "iomuxc" does?). What did you have in mind for that node?
> Placing it after "audmux"?

Yes, putting 'wdog' after audmux would be better.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
