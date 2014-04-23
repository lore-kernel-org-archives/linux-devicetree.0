From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 2/8] ARM: sunxi: Split out the various
 machines into separate files
Date: Wed, 23 Apr 2014 15:33:29 +0200
Message-ID: <6249453.RCSRl1Jr3F@wuerfel>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com> <201404231433.51129.arnd@arndb.de> <20140423132829.GT24905@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBMUC36NAKGQEIWXR5MI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140423132829.GT24905@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 April 2014 15:28:29 Maxime Ripard wrote:
> On Wed, Apr 23, 2014 at 02:33:50PM +0200, Arnd Bergmann wrote:
> > On Thursday 17 April 2014, Maxime Ripard wrote:
> > > This will allow to add per-SoC hooks more easily.
> > > 
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >  arch/arm/mach-sunxi/Makefile  |   6 +-
> > >  arch/arm/mach-sunxi/restart.c | 104 +++++++++++++++++++++++++++
> > >  arch/arm/mach-sunxi/restart.h |  20 ++++++
> > >  arch/arm/mach-sunxi/sun4i.c   |  36 ++++++++++
> > >  arch/arm/mach-sunxi/sun5i.c   |  37 ++++++++++
> > >  arch/arm/mach-sunxi/sun6i.c   |  49 +++++++++++++
> > >  arch/arm/mach-sunxi/sun7i.c   |  36 ++++++++++
> > >  arch/arm/mach-sunxi/sunxi.c   | 164 ------------------------------------------
> > >  8 files changed, 287 insertions(+), 165 deletions(-)
> > 
> > This doesn't look like a move in the right direction, and I don't see
> > the connection with the DMA driver.
> 
> This is actually not adding any code at all, just reorganizing it.
> 
> This was also something that would allow to have per-family
> configuration options, and hence not select drivers like the pinctrl
> one that are pretty huge if they're not needed.

I don't mind having split Kconfig entries to control which drivers
are used. It was more about the absolute growth in C source code
lines above.

> > Splitting out the restart code is good, but please complete this by
> > moving it into a driver directory. My preferred location would be
> > within the watchdog driver, since it's really the same registers.
> > You can turn on the watchdog driver as built-in in the defconfig.
> > While it's not ideal that you can end up without a restart function
> > if the driver does not get loaded, I would still prefer that over
> > having the driver in the mach-sunxi directory.
> 
> Ok. The thing is, we don't have any watchdog driver for the A31 for
> the moment, so the restart code will have to stay there. But I can
> totally do that for the A10/A20.
> 
> > An alternative would be to move the restart code into
> > drivers/power/reset.
> 
> That would be a good place for the A31 code then.

Ok, good.

> > > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> > > deleted file mode 100644
> > > index 460b5a4962ef..000000000000
> > > --- a/arch/arm/mach-sunxi/sunxi.c
> > 
> > Instead of splitting up this file, I think it would be better to
> > reduce the number of special hacks required per machine. Note that
> > for arm64 we require platforms not to have any code outside of
> > the drivers directory, and I'd like to get to the same situation
> > for much of arch/arm/mach-* as well.
> 
> I think it's fair.
> 
> How would you enforce default clock parenting and/or rate then?

See my other reply.

	Arnd
