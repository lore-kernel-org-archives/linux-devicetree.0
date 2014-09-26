From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] clk: sun6i: Unify AHB1 clock and fix
 rate calculation
Date: Thu, 25 Sep 2014 17:25:44 -0700
Message-ID: <20140926002544.19023.39287@quantum>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <20140911203623.GJ31276@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDO333VC4INBBIHFSKQQKGQERSCTFQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140911203623.GJ31276@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Maxime Ripard (2014-09-11 13:36:23)
> Hi Chen-Yu,
> 
> On Sat, Sep 06, 2014 at 06:47:21PM +0800, Chen-Yu Tsai wrote:
> > Hi everyone,
> > 
> > This series unifies the mux and divider parts of the AHB1 clock found
> > on sun6i and sun8i, while also adding support for the pre-divider on
> > the PLL6 input.
> > 
> > The rate calculation logic must factor in which parent it is using to
> > calculate the rate, to decide whether to use the pre-divider or not.
> > This is beyond the original factors clk design in sunxi. To avoid
> > feature bloat, this is implemented as a seperate composite clk.
> > 
> > The new clock driver is registered with a separate OF_CLK_DECLARE.
> > This is done so that assigned-clocks* properties on the clk provider
> > node can actually work. The clock framework arranges the clock setup
> > order by checking whether all clock parents are available, by checking
> > the node matching OF_CLK_DECLARE.
> > 
> > However, the sunxi clk driver is based on the root node compatible,
> > has no defined dependencies (parents), and is setup before the fixed-rate
> > clocks. Thus when the ahb1 clock is added, all parents have rate = 0.
> > There is no way to calculate the required clock factors to set a default
> > clock rate under these circumstances. This happens when we set the
> > defaults in the clock node (provider), rather than a clock consumer.
> >
> > I can think of 2 ways to solve the dependency issue, but neither is
> > pretty. One would be to move the root fixed-rate clocks into the sunxi
> > clk driver. The other would be separating all the clocks into individual
> > OF_CLK_DECLARE statements, which adds a lot of boilerplate code.
> 
> I don't know what Mike thinks of this, but I'd prefer the second.

I do not fully understand the problem. Ideally the clock driver should
have some way to fail with EPROBE_DEFER until the fixed-rate clocks are
registered. Those fixed-rate parents are enumerated in your dts, right?
Why isn't this enough?

Thanks,
Mike

> 
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
