From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: uniphier: add outer cache support
Date: Fri, 28 Aug 2015 10:44:13 +0100
Message-ID: <20150828094412.GH21084@n2100.arm.linux.org.uk>
References: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com>
 <2021253.vgeYqalDfp@wuerfel>
 <CAK7LNAQ_oymnQNEcP+FDqyxNKtMyiCwgxSRMmg5HAKQW9C6eRg@mail.gmail.com>
 <4027826.UsiXogeDbt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4027826.UsiXogeDbt@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Joe Perches <joe@per>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 26, 2015 at 02:52:45PM +0200, Arnd Bergmann wrote:
> On Wednesday 26 August 2015 10:38:59 Masahiro Yamada wrote:
> > Moreover, outer-cache init seems to be unrelated to
> > IRQ init.
> 
> Agreed, this is also just a historic artifact, as we don't really
> have a place to put cache controller initialization, and the

Arnd, I'm afraid you're completely wrong there.  It's not a historic
artifact by any of the kind.

I explicitly placed the L2 cache initialisation there based upon
which callbacks into architecture code were available from init/main.c
and where in the initialisation sequence I wanted the L2 cache to be
initialised _for_ _everyone_.

That being, before SMP is brought up, preferably before the delay
loop calibration (so we don't calibrate the loop without the L2 cache,
and then invalidate that calibration when we enable the cache), but
sufficiently late that various services that the L2 cache code wants
(like kmalloc) have been initialised.

That rules out setup_arch(), leaving trap_init(), init_IRQ(), time_init()
and late_time_init().  I chose init_IRQ() out of that lot because it
seemed to be a sensible point to initialise it, though trap_init()
looks like it could have been another good site.

All L2 caches should be initialised at a similar point IMHO - not only
does this give us a more consistent initialisation sequence, but it
avoids issues such as the one I mention above with delay loop calibration
being wrong.

> A first step would be to add the tauros2 and uniphier outer cache
> init to the init_IRQ() function, and then have another patch
> that moves all the outercache initialization into a new place
> like arch/arm/mm/outercache.c so we don't clutter up irq.c

arch/arm/mm/l2c-common.c

> with unrelated stuff.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
