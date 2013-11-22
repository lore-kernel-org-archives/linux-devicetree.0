From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 4/7] clocksource/cadence_ttc: Adjust interval in clock
 notifier
Date: Fri, 22 Nov 2013 10:06:34 -0800
Message-ID: <e1bb716e-96dc-4da0-ba92-3a5492b5ba59@CO1EHSMHS007.ehs.local>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com>
 <1383945677-29674-5-git-send-email-soren.brinkmann@xilinx.com>
 <52825779.2050106@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52825779.2050106@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Tue, Nov 12, 2013 at 05:29:45PM +0100, Daniel Lezcano wrote:
> On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> >The clockevent has to be reprogrammed if the timer's input
> >clock frequency changes and the timer is in periodic mode, in order =
to
> >maintain the correct timer interval.
> >
> >Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> >---
> >  drivers/clocksource/cadence_ttc_timer.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> >diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clock=
source/cadence_ttc_timer.c
> >index a92350b55d32..68a336038d8f 100644
> >--- a/drivers/clocksource/cadence_ttc_timer.c
> >+++ b/drivers/clocksource/cadence_ttc_timer.c
> >@@ -338,6 +338,10 @@ static int ttc_rate_change_clockevent_cb(struct=
 notifier_block *nb,
> >  		/* update cached frequency */
> >  		ttc->freq =3D ndata->new_rate;
> >
> >+		if (ttcce->ce.mode =3D=3D CLOCK_EVT_MODE_PERIODIC)
> >+			ttc_set_interval(ttc, DIV_ROUND_CLOSEST(ttc->freq,
> >+						PRESCALE * HZ));
> >+
>=20
> Couldn't be racy ?
I guess you're right. What would be the proper way to resolve it? If we
look at a little more code things look like this:

	local_irq_save(flags);                                          =20
	clockevents_update_freq(&ttcce->ce,                             =20
	                ndata->new_rate / PRESCALE);                    =20
	local_irq_restore(flags);                                       =20
	                                                                =20
	/* update cached frequency */                                   =20
	ttc->freq =3D ndata->new_rate;                                    =20
	                                                                =20
	if (ttcce->ce.mode =3D=3D CLOCK_EVT_MODE_PERIODIC)                  =20
	        ttc_set_interval(ttc, DIV_ROUND_CLOSEST(ttc->freq,      =20
	                                PRESCALE * HZ));

Would it be enough to move the ttc_set_interval() call within the
section where local IRQs are disabled? I have the feeling for this time=
r
the local_irq_save() may in general not be the right option since the
timer is not CPU local.
Should we probably change this do irq_disable(ttcce->ce.irq)?

	Thanks,
	S=C3=B6ren
