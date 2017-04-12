From: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v1 3/3] nvmem: dt: document SNVS LPGPR binding
Date: Wed, 12 Apr 2017 08:23:53 +0200
Message-ID: <20170412062353.s5nf5thsn2xxdlre@pengutronix.de>
References: <20170406073107.32445-1-o.rempel@pengutronix.de>
 <20170406073107.32445-3-o.rempel@pengutronix.de>
 <20170410182235.pmobyxn6kvyvcwsj@rob-hp-laptop>
 <1e0f8a71-9dca-7aaa-a603-86ed3934da4d@pengutronix.de>
 <CAL_JsqJeqYEw7v_z9zhtnP9hZEvkc5Z8TsktzbrCrmc7vorGkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJeqYEw7v_z9zhtnP9hZEvkc5Z8TsktzbrCrmc7vorGkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-rffoE+Jg25C1LGEWPFfZhQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 11, 2017 at 08:35:00AM -0500, Rob Herring wrote:
> On Mon, Apr 10, 2017 at 11:36 PM, Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > Hi,
> > On 04/10/2017 08:22 PM, Rob Herring wrote:
> >>
> >> On Thu, Apr 06, 2017 at 09:31:07AM +0200, Oleksij Rempel wrote:
> >>>
> >>> Documenation bindings for the Low Power General Purpose Registe
> >>
> > Jes, it is refereed by other driver.
> 
> What I mean is snvs-lpgpr referenced elsewhere in DT, not by some
> driver? You are not using the nvmem binding here so it doesn't seem
> like it is. If that's the case, then you don't need this node. The
> only information here is the offset which can be part of a driver for
> the parent node. To put it another way, we don't want to fill DT with
> a node per register.

This node is referenced insight of product DT. Since the system has
or may have more then one nvmem node we need to assigne aliase to it.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
