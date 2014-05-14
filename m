From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] of: Keep track of populated platform devices
Date: Wed, 14 May 2014 12:05:47 +0100
Message-ID: <20140514110547.295CEC4153D@trevor.secretlab.ca>
References: <1399473437.3706.25.camel@hornet>
	<1399981716-24618-1-git-send-email-pawel.moll@arm.com>
	<CAL_Jsq+8xZO0LEhVa4tmOfq6CD2a0O+0CaGCnZLqDguz=yN_zg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+8xZO0LEhVa4tmOfq6CD2a0O+0CaGCnZLqDguz=yN_zg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 13 May 2014 07:24:50 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, May 13, 2014 at 6:48 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> > In "Device Tree powered" systems, platform devices are usually
> > massively populated with of_platform_populate() call, executed
> > at some level of initcalls, either by generic architecture
> > or by platform-specific code.
> >
> > There are situations though where certain devices must be
> > created (and bound with drivers) before all the others.
> > This presents a challenge, as devices created explicitly
> > would be created again by of_platform_populate().
> >
> > This patch tries to solve that issue in a generic way,
> > adding a "populated" flag for a DT node description.
> > Once set, this device will never be created again via
> > of_* API, so of_platform_populate() will skip such nodes
> > (and its children) in a similar way to the non-available
> > ones.
> >
> > The flag is cleared when a device is being removed and
> > returns the DT node by calling of_device_node_put() (it
> > was missing from the amba device release function, added).
> >
> > Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> 
> A few formatting nits, but otherwise:
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
