From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 3/8] ARM: sunxi: Move the clock
 protection to machine hooks
Date: Wed, 23 Apr 2014 15:31:06 +0200
Message-ID: <4987444.Zp0Prbn0Y8@wuerfel>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com> <201404231439.02913.arnd@arndb.de> <20140423131720.GS24905@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBI4B36NAKGQEM2OQ5ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140423131720.GS24905@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 23 April 2014 15:17:20 Maxime Ripard wrote:
> > > +#include <linux/clk.h>
> > >  #include <linux/init.h>
> > >  #include <linux/of_platform.h>
> > >  
> > > @@ -19,9 +20,17 @@
> > >  
> > >  static void __init sun4i_dt_init(void)
> > >  {
> > > +       struct clk *clk;
> > > +
> > >         sunxi_setup_restart();
> > >  
> > >         of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> > > +
> > > +       /* Make sure the clocks we absolutely need are enabled */
> > > +       /* DDR clock */
> > > +       clk = clk_get(NULL, "pll5_ddr");
> > > +       if (!IS_ERR(clk))
> > > +               clk_prepare_enable(clk);
> > >  }
> > 
> > Isn't there already DT syntax to do the same? If not, should there be?
> 
> I don't think there is, and I gave some thought about it too. But
> something a la regulator-always-on wouldn't work with clocks with
> multiple outputs (like pll5), because you might need to leave only one
> of the output enabled, but not the others, and I couldn't think of a
> nice way to do so.
> 
> If you have one, I'd be happy to implement it.

We had a discussion a while ago about encoding default settings for clock
providers in the clock provider nodes. I don't remember the details
unfortunately.

Mike, can you explain how this should be done?

	Arnd
