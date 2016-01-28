From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 03/26] clk: Add regmap support
Date: Wed, 27 Jan 2016 23:56:21 -0800
Message-ID: <20160128075621.GF12841@codeaurora.org>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-4-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDHZXHXDRAMBBKMTU62QKGQEBBJI2ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452785109-6172-4-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/14, Maxime Ripard wrote:
> From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Some devices like SoCs from Mediatek need to use the clock
> through a regmap interface.
> This patch adds regmap support for the simple multiplexer clock,
> the divider clock and the clock gate code.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Nak.

The whole anonymous union thing and clk-io.c file is not
appealing at all. I'd prefer we remove clk_readl/writel, not add
to it. Plus we're bloating the basic clock types and adding a
bunch of parallel registration APIs to assign a regmap pointer.
Really, let's stop adding stuff to the basic clock types, it's
getting out of hand.

To move forward on making regmap clks generic for everyone, let's
make sure that regmap clk code is a library that any driver can
use. No OF_CLK_DECLARE should exist because it doesn't make any
sense. No clk_register_regmap_{div,mux,gate}() functions, just a
clk_register_regmap() function to assign the regmap pointer from
the device. Drivers that want to use the code should need to
select a Kconfig symbol, so that we don't compile in support for
regmap clocks unless we really need them.

If we had a clk_regmap structure with a regmap pointer and a
clk_hw inside it I think that's all we would need. Once we had
that, we could let driver writers wrap that in their own
structures for dividers, muxes, gates, etc. and then have them
call library functions from their clk_ops that takes a regmap (or
clk_regmap struct), and offset to do the get_div/set_div,
get_parent/set_parent, enable/disable stuff.

The policy part can be shared with the basic clock types, because
we've already started libifying them. For example, we can ask the
divider code what the hardware value should be for a particular
divider type and it will tell us without writing any registers.
I had a patch for libifying muxes, not sure where it went. The
point being to leave the I/O part to the regmap code without
putting it behind another layer of indirection buried inside the
basic types. Make things flat and easy to follow.

I haven't thought through making new structs to hold the data for
offsets, masks, etc. but I guess we would want those so that we
could assign functions directly to clk_ops and not require any
boiler plate clk_ops implementations in drivers. There are a few
approaches here: different regmap structs for different basic
types, one mega struct that combines all the needs of the basic
types, or some private void pointer inside struct clk_regmap that
points to different basic type structs. Let's see how that goes.

Maybe we can lift drivers/clk/qcom/clk-regmap.c up into the
drivers/clk/ directory too. In the qcom design I put the
enable/disable bits (gate functionality) directly into the
clk_regmap structure. That may need some more thought if it was
the right idea to force enable/disable on every regmap clock
though. If we remove that and introduce a clk_regmap_gate things
should turn out alright.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
