From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] clocksource: Do not drop unheld reference on device node
Date: Mon, 25 Nov 2013 08:29:23 +0100
Message-ID: <20131125072923.GB28642@pengutronix.de>
References: <1382136588-15320-1-git-send-email-treding@nvidia.com>
 <20131122161607.GA5088@ulmo.nvidia.com>
 <528F86F2.40706@linaro.org>
 <20131122192257.GX28642@pengutronix.de>
 <52926F6F.3050104@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52926F6F.3050104-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Daniel,

On Sun, Nov 24, 2013 at 10:28:15PM +0100, Daniel Lezcano wrote:
> On 11/22/2013 08:22 PM, Uwe Kleine-K=F6nig wrote:
> >On Fri, Nov 22, 2013 at 05:31:46PM +0100, Daniel Lezcano wrote:
> >>On 11/22/2013 05:16 PM, Thierry Reding wrote:
> >>>On Sat, Oct 19, 2013 at 12:49:48AM +0200, Thierry Reding wrote:
> >>Yes. Sounds like I missed it.
> >>
> >>This regression has been introduced by:
> >>
> >>commit 326e31eebe61dc838e031ea16968b2cfb43443e3
> >>Author: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>Date:   Tue Oct 1 11:00:53 2013 +0200
> >>
> >>     clocksource: Put nodes passed to CLOCKSOURCE_OF_DECLARE
> >>callbacks centrally
> >>
> >>     Instead of letting each driver call of_node_put do it centrall=
y in the
> >>     loop that also calls the CLOCKSOURCE_OF_DECLARE callbacks. Thi=
s is less
> >>     prone to error and also moves getting and putting the referenc=
es
> >>into the
> >>     same function.
> >>
> >>     Consequently all respective of_node_put calls in drivers are r=
emoved.
> >>
> >>     Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix=
=2Ede>
> >>     Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>     Acked-by: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >Still all but the hook in clocksource_of_init of this commit was
> >correct, right? (Well, but this buggy hunk makes the commit log wron=
g.)
>=20
> I don't understand your comment, can you elaborate ?
My patch added an of_node_put in clocksource_of_init and dropped severa=
l
of_node_puts in drivers. This thread is about the first being wrong. My
question was if dropping the others was correct.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
