From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] clocksource: Provide timekeeping for efm32 SoCs
Date: Tue, 22 Oct 2013 22:10:01 +0200
Message-ID: <20131022201001.GB27227@pengutronix.de>
References: <1380830189-21553-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <5253ECC7.30700@linaro.org>
 <20131008145147.GP10079@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131008145147.GP10079-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 04:51:47PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Daniel,
>=20
> On Tue, Oct 08, 2013 at 01:30:15PM +0200, Daniel Lezcano wrote:
> > On 10/03/2013 09:56 PM, Uwe Kleine-K=F6nig wrote:
> > >An efm32 features 4 16-bit timers with a 10-bit prescaler. This dr=
iver
> > >provides clocksource and clock event device using one timer instan=
ce
> > >each.
> > >
> > >Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > >---
> >=20
> > Applied to my tree for 3.13
> Thanks
Where is your tree to be found? This commit isn't in

	git://git.linaro.org/people/dlezcano/linux.git clockevents/3.13

and also it's not included in next-20131021.

Best regards and thanks
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
