From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/15] ARM: dts: imx: fix PCI bus dtc warnings
Date: Fri, 24 Mar 2017 09:28:36 +0800
Message-ID: <20170324012831.GB30608@dragon>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-5-robh@kernel.org>
 <20170322081942.GM3443@dragon>
 <CAL_JsqKmbLP07zKN1SJAoe0xHjzjn80HQDRvqASXvhnUOBgAyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKmbLP07zKN1SJAoe0xHjzjn80HQDRvqASXvhnUOBgAyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Tim who is the owner of Gateworks Ventana boards.

On Wed, Mar 22, 2017 at 08:53:34AM -0500, Rob Herring wrote:
> On Wed, Mar 22, 2017 at 3:19 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Mar 21, 2017 at 09:03:03PM -0500, Rob Herring wrote:
> >> dtc recently added PCI bus checks. Fix these warnings.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> >
> > Applied with a couple of changes below.
> 
> Thanks. BTW, forget to mention there's still one i.MX warning I did
> not fix. It's with the "sky2@8" PCI device node. The unit address is
> completely wrong. The comment says bus #8 which doesn't seem right
> either. The unit address should be "<device num>[,<function]". There
> should be a reg property which also has the bus number.

@Tim, these DTC warnings come from Ventana boards.  Can you take care of
them?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
