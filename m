From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ASoC: cs35l32: avoid uninitialized variable access
Date: Mon, 04 Jan 2016 17:41:05 +0100
Message-ID: <3088017.xkc6Hgo0y2@wuerfel>
References: <2884997.s8B8BuE04L@wuerfel> <9222694.IRNnfpj6Tn@wuerfel> <20160104152058.GH19062@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160104152058.GH19062-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Austin <brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 04 January 2016 15:20:58 Russell King - ARM Linux wrote:
> On Mon, Jan 04, 2016 at 04:17:47PM +0100, Arnd Bergmann wrote:
> > On Saturday 02 January 2016 14:17:46 Mark Brown wrote:
> > > On Sat, Jan 02, 2016 at 12:19:52AM +0100, Arnd Bergmann wrote:
> > > 
> > > > -             if (i2c_client->dev.of_node) {
> > > > +             if (IS_ENABLED(CONFIG_OF) && i2c_client->dev.of_node) {
> > > 
> > > This would be a lot nicer if there was an __always_null annotation we
> > > could put on of_node for !OF configurations, that'd Just Work and this
> > > can't be the only case where we have this idiom.
> > > 
> > 
> > How about an inline helper like
> > 
> > static inline struct device_node *dev_of_node(struct device *dev)
> > {
> >       if (IS_ENABLED(CONFIG_OF))
> >               return dev->of_node;    
> 
> ITYM:
> 
>         return IS_ENABLED(CONFIG_OF) ? dev->of_node : NULL;
> 
> or
> 
>         if (IS_ENABLED(CONFIG_OF))
>                 return dev->of_node;
>         else
>                 return NULL;
> 

Right, yes.

That reminds of a different problem that has been bugging me for a
while: We frequently have a pattern like

#ifdef CONFIG_FOO
static int function(void)
{
	...
}
#endif

struct operations = {
	...
#ifdef CONFIG_FOO
	.function = function;
#endif
	...
};

Except that people constantly get it wrong, e.g. by using the
wrong ifdef, forgetting one of the two ifdefs, or by leaving
unused static functions that only get called indirectly from the
other one that is built conditionally.

We could add a macro like

#define COND_PTR(config, ptr) (IS_ENABLED(config) ? (ptr) : NULL)

and then let the compiler figure out that "function" is unused even
without an explicit __maybe_unused annotation.  The function above
can be simplied to

static inline struct device_node *dev_of_node(struct device *dev)
{
	return COND_PTR(CONFIG_OF, dev->of_node);
}

with that, which is another benefit.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
