From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] clk: sunxi: unify sun6i AHB1 clock with
 proper PLL6 pre-divider
Date: Thu, 25 Sep 2014 16:03:40 -0700
Message-ID: <20140925230340.19023.22674@quantum>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-4-git-send-email-wens@csie.org>
 <20140911210211.GM31276@lukather>
 <CAGb2v66L36nsoucSgLY8pV8f=wjKTvtjJby43Z=Ct+NiRonptQ@mail.gmail.com>
 <20140913102603.GZ31276@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDO333VC4INBBY56SKQQKGQE5H7JAQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140913102603.GZ31276@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Maxime Ripard (2014-09-13 03:26:03)
> On Fri, Sep 12, 2014 at 11:16:26AM +0800, Chen-Yu Tsai wrote:
> > Hi,
> > 
> > On Fri, Sep 12, 2014 at 5:02 AM, Maxime Ripard
> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > Hi,
> > >
> > > On Sat, Sep 06, 2014 at 06:47:24PM +0800, Chen-Yu Tsai wrote:
> > >> This patch unifies the sun6i AHB1 clock, originally supported
> > >> with separate mux and divider clks. It also adds support for
> > >> the pre-divider on the PLL6 input, thus allowing the clock to
> > >> be muxed to PLL6 with proper clock rate calculation.
> > >>
> > >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > >
> > > It looks fine, but I'd rather see this in a separate file, especially
> > > since we don't seem to have any order dependency.
> > 
> > Sorry, just to be clear, separate file under clk/sunxi?
> 
> Yes
> 
> > This cannot be in a separate file, as it shares a spinlock with apb1
> > divider. They share the same register.
> > 
> > We could move apb1 out though. But i would prefer to do that when
> > we split out all the clocks into individual OF_CLK_DECLAREs.
> 
> Ah right, my bad :)
> 
> My plan on the long term is to kill clk-sunxi as a place where all the
> clocks are defined, and only leave the "policy" there, for example the
> clock protection code (even if that should probably be removed too,
> together with clkdev), the various rates / parenting enforcements,
> etc.

Interesting! Where are you planning to store the clock data?

Regards,
Mike

> 
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
