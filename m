From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: Add class of phase
 clocks supporting MMC new timing modes
Date: Fri, 5 May 2017 09:58:24 +0200
Message-ID: <20170505075824.d35sr2pehm6g42ig@lukather>
References: <20170503031658.29299-1-wens@csie.org>
 <20170503031658.29299-4-wens@csie.org>
 <20170503203402.5mwhx5wjniav24nd@lukather>
 <CAGb2v67VhJCZuu4EGHgTATe=z6ab9meRSWpGYU-cCjWmDh6aUA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m5t5xavcy7hthe5m"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBIXBWDEAKGQEQAKPTDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67VhJCZuu4EGHgTATe=z6ab9meRSWpGYU-cCjWmDh6aUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--m5t5xavcy7hthe5m
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, May 04, 2017 at 11:08:43AM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, May 4, 2017 at 4:34 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Wed, May 03, 2017 at 11:16:53AM +0800, Chen-Yu Tsai wrote:
> >> The MMC clocks on newer SoCs, such as the A83T and H3, support the
> >> "new timing mode". Under this mode, the output of the clock is divided
> >> by 2, and the clock delays no longer apply.
> >>
> >> Due to how the clock tree is modeled and setup, we need to model
> >> this function in two places, the master mmc clock and the two
> >> child phase clocks. In the mmc clock, we can easily model the
> >> mode bit as an extra variable post-divider. In the phase clocks,
> >> we check the bit and return -ENOTSUPP if the bit is set, signaling
> >> that the phase clocks are not to be used.
> >>
> >> This patch introduces a class of phase clocks that checks the
> >> timing mode bit.
> >
> > We've been over this quite some times already...
> >
> > How do you retrieve the mode used in the clock so that you can also
> > switch the MMC driver in the new mode?
> 
> This part is covered. As mentioned above, the phase clks will return
> -ENOTSUPP if the mmc clk is set in the new timing mode. The MMC driver
> would try getting the current phase, check if it fails, and if it does,
> realizes the clk is in new timing mode, and will switch the mmc controller
> to it as well. I think this semantic fits the hardware well enough,
> though it might be confusing without the accompanying comments.

This is confusing, and impossible to debug without getting your hands
in the driver. Triggerring the new mode is also not really something
that is rate-based. We might want to switch to it explicitly, without
any doubt. This is what we're doing for the A64 for example.

Since some rates can be obtained both in the old and new modes
likewise, you don't have that guarantee in the MMC driver and might
end up in the old mode, even though you actually want it. And you
can't.

Which is why I argued several times for a custom function calls. Every
other solutions that we evaluated so far was a hack, at best, and was
not entirely predictable and debuggable, which is not a very nice
combination.

> See this commit for an example on how it should work.
> https://github.com/wens/linux/commit/41e386f1f945a0a135a20a00601b977a001353da

This is unrelated, but it breaks A64. A64 doesn't have the phase
clocks at all, and need to be switched to the new mode all the time,
without any cooperation from the CCU. Your code will try to change the
phase, fail since you don't have any phase clock, and fall back to not
using the new mode. I think we need to make a distinction between MMC
controllers that can use both the old and new mode (A23, A33, H3,
A83T, etc.) and the one that always need to use it (A64 eMMC).

You should also retrieve whether you can use the new mode or not after
changing the rate and not at probe time. Each call to clk_set_rate
might change that.

> > And do you prevent that from happening on the DT we already have that
> > use the old clock drivers that do not support this new timing at all?
> 
> I admit this is not taken care of in this patch. Mostly because there
> is no existing DT for the A83T to cater to. For the H3 and other SoCs
> that do, we need some way of asking the CCU to switch the mode.
> 
> IIRC the output and sample clocks do not support a phase delay of 0.

That's a weak assumption, since we're not even sure what the phase
actually is. My recollection is that it doesn't, but I'm not entirely
sure, and both the datasheet and the BSP code are not really clear on
that part either.

> So what if we design the semantic for this class of clocks as, if
> phase == 0, switch to new timing mode, otherwise use old timing mode?
> That would allow us to support this without adding extra functions,
> and kind of matches what the hardware does. If you're using the new
> timing mode, the delays in the mmc clk are bypassed.

To be honest, I have the feeling that it should be a separate
discussion.

The whole A83T support has been completely stalled because of a single
board's eMMC. This is pretty much a cross-SoC issue, at least 4 other
SoCs have that issue already, and we need to deal with this for all of
them.

Merging a clock driver without the support for the MMC new mode would
just bring us in the same situation than the A33 or H3, which I
believe quite good.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--m5t5xavcy7hthe5m--
