From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/9] clk: sunxi-ng: mux: Add clk notifier functions
Date: Wed, 27 Jul 2016 09:43:26 +0200
Message-ID: <20160727074326.GI6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-8-git-send-email-wens@csie.org>
 <20160727073005.GG6560@lukather>
 <CAGb2v67KcvzxadXYTWSg42+gpRxt4fhNmiWmtAD5D7r0+K4T8g@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBH6M4G6AKGQEFZMOTAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67KcvzxadXYTWSg42+gpRxt4fhNmiWmtAD5D7r0+K4T8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Jul 27, 2016 at 03:32:58PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jul 27, 2016 at 3:30 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Tue, Jul 26, 2016 at 03:04:29PM +0800, Chen-Yu Tsai wrote:
> >> On sunxi we support cpufreq by changing the clock rate of PLL-CPU.
> >> It's possible the clock output of the PLL goes out of the CPU's
> >> operational limits when the PLL's multipliers / dividers are changed
> >> and it hasn't stabilized yet. This would result in the CPU hanging.
> >>
> >> To circumvent this, we temporarily switch the CPU mux clock to another
> >> stable clock before the rate change, and switch it back after the PLL
> >> stabilizes. This is done with clk notifiers registered on the PLL.
> >>
> >> This patch adds common functions for notifiers to reparent mux clocks.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu_mux.c | 36 ++++++++++++++++++++++++++++++++++++
> >>  drivers/clk/sunxi-ng/ccu_mux.h | 14 ++++++++++++++
> >>  2 files changed, 50 insertions(+)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
> >> index f96eabb5d1f3..8a6e9065cb85 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> >> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> >> @@ -8,7 +8,9 @@
> >>   * the License, or (at your option) any later version.
> >>   */
> >>
> >> +#include <linux/clk.h>
> >>  #include <linux/clk-provider.h>
> >> +#include <linux/delay.h>
> >>
> >>  #include "ccu_gate.h"
> >>  #include "ccu_mux.h"
> >> @@ -199,3 +201,37 @@ const struct clk_ops ccu_mux_ops = {
> >>       .determine_rate = __clk_mux_determine_rate,
> >>       .recalc_rate    = ccu_mux_recalc_rate,
> >>  };
> >> +
> >> +/*
> >> + * This clock notifier is called when the frequency of the of the parent
> >> + * PLL clock is to be changed. The idea is to switch the parent to a
> >> + * stable clock, such as the main oscillator, while the PLL frequency
> >> + * stabilizes.
> >> + */
> >> +static int ccu_mux_notifier_cb(struct notifier_block *nb,
> >> +                            unsigned long event, void *data)
> >> +{
> >> +     struct ccu_mux_nb *mux = to_ccu_mux_nb(nb);
> >> +     int ret = 0;
> >> +
> >> +     if (event == PRE_RATE_CHANGE) {
> >> +             mux->original_index = ccu_mux_helper_get_parent(mux->common,
> >> +                                                             mux->cm);
> >> +             ret = ccu_mux_helper_set_parent(mux->common, mux->cm,
> >> +                                             mux->bypass_index);
> >> +     } else if (event == POST_RATE_CHANGE) {
> >> +             ret = ccu_mux_helper_set_parent(mux->common, mux->cm,
> >> +                                             mux->original_index);
> >> +     }
> >> +
> >> +     udelay(mux->delay_us);
> >
> > Are you sure we need that delay?
> >
> > set_rate will end and notify you once the PLL rate is stable, so it
> > looks redundant.
> 
> The delay requirement is on the cpu mux clk, not the PLL. The
> datasheet says you should wait for up to 8 clock cycles after
> changing the parent. Not sure how this factors with the CPU
> actually doing the waiting though.
> 
> So this is separate from the PLL lock delay.

Ok, thanks :)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--yzvKDKJiLNESc64M--
