From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC/PATCH] drivers/of/platform: Add powerpc 4xx embedded
 busses to default list
Date: Sat, 02 Sep 2017 09:47:52 +1000
Message-ID: <1504309672.4974.93.camel@kernel.crashing.org>
References: <1504237861.4974.59.camel@kernel.crashing.org>
         <CAL_JsqLYMeV6XsBOtZKJHFbC2+_cG+gF7L+LurH5keTtzp2wVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLYMeV6XsBOtZKJHFbC2+_cG+gF7L+LurH5keTtzp2wVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-09-01 at 10:24 -0500, Rob Herring wrote:
> On Thu, Aug 31, 2017 at 10:51 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > This allow to (slowly) migrate those embedded platforms
> > to of_platform_default_populate()
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > ---
> > 
> > I'm here to collect acks (or comments :-) I'd like this to go via
> > the powerpc tree along with the patches converting some of the
> > platforms. I'll be adding more bus types if/when I start tackling
> > other powerpc embedded families but for now I'm dealing with 4xx.
> 
> Glad to see it.

So my end game is to remove the #ifndef CONFIG_PPC around
of_platform_default_populate_init(void). However, for that
to work, I need to add a way to disable that on some platforms.

However, it might take time, especially when it comes to dealing
with the old Macs or some more obscure embedded platforms.

So in the meantime, I'm thinking adding some kind of runtime way
of disabling this default populate. Would you be ok with that ?

Something like:

	bool arch_wants_of_platform_defaults(void)

With a weak implementation returning true.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
