From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ASoC: cs35l32: avoid uninitialized variable access
Date: Mon, 4 Jan 2016 16:52:20 +0000
Message-ID: <20160104165220.GL19062@n2100.arm.linux.org.uk>
References: <2884997.s8B8BuE04L@wuerfel>
 <9222694.IRNnfpj6Tn@wuerfel>
 <20160104152058.GH19062@n2100.arm.linux.org.uk>
 <3088017.xkc6Hgo0y2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3088017.xkc6Hgo0y2@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Austin <brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 04, 2016 at 05:41:05PM +0100, Arnd Bergmann wrote:
> That reminds of a different problem that has been bugging me for a
> while: We frequently have a pattern like
> 
> #ifdef CONFIG_FOO
> static int function(void)
> {
> 	...
> }
> #endif
> 
> struct operations = {
> 	...
> #ifdef CONFIG_FOO
> 	.function = function;
> #endif
> 	...
> };
> 
> Except that people constantly get it wrong, e.g. by using the
> wrong ifdef, forgetting one of the two ifdefs, or by leaving
> unused static functions that only get called indirectly from the
> other one that is built conditionally.

We already have a solution to that.  __maybe_unused against the
function, and use the correct #ifdef in the structure initialiser.
We just need reviewers to be better at picking that up.

> We could add a macro like
> 
> #define COND_PTR(config, ptr) (IS_ENABLED(config) ? (ptr) : NULL)
> 
> and then let the compiler figure out that "function" is unused even
> without an explicit __maybe_unused annotation.  The function above
> can be simplied to
> 
> static inline struct device_node *dev_of_node(struct device *dev)
> {
> 	return COND_PTR(CONFIG_OF, dev->of_node);
> }
> 
> with that, which is another benefit.

You're just inventing another way for people to get it wrong though.
Instead of having mismatched #ifdefs, we can now have a mismatched
#ifdef around the function and the COND_PTR config - and people will
add #ifdef's because they won't realise they don't need them.

You're reliant on reviewers to spotting the pattern, and suggesting
using COND_PTR() without #ifdefs around the function.  It's the same
problem with spotting the existing pattern and suggesting dropping
the #ifdef around the function and annotating the function with
__maybe_unused.

So, I don't see the benefit.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
