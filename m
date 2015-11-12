From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 01/19] clk: sunxi: Add display clock
Date: Thu, 12 Nov 2015 12:31:54 -0800
Message-ID: <20151112203154.GE15032@codeaurora.org>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151030212902.GG19782@codeaurora.org>
 <20151106233926.GN6114@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151106233926.GN6114@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On 11/06, Maxime Ripard wrote:
> Hi Stephen,
> 
> Thanks for your feedback!
> 
> On Fri, Oct 30, 2015 at 02:29:02PM -0700, Stephen Boyd wrote:
> > > +
> > > +	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
> > > +	if (!mux)
> > [..]
> > > +		goto free_reset;
> > > +	}
> > > +
> > > +	return;
> > > +
> > > +free_reset:
> > > +	kfree(reset_data);
> > > +free_clk:
> > > +	clk_unregister(clk);
> > 
> > We really ought to have a clk_composite_unregister() API.
> 
> Can we?
> 
> We can always unregister the clock itself, but do we have a way to
> retrieve the structure that has been allocated in there?
> 
> (note that it also applies to the generic clocks registration: muxes,
> dividers, and so on).

Yes we have a way. We've done the same sort of design for other
generic clocks. Do the __clk_get_hw() thing like in clk-divider.c

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
