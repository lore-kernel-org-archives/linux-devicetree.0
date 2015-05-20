From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 3/5] soc: Mediatek: Add SCPSYS power domain driver
Date: Wed, 20 May 2015 16:03:25 +0200
Message-ID: <20150520140325.GN6325@pengutronix.de>
References: <1431372206-1237-1-git-send-email-s.hauer@pengutronix.de>
 <1431372206-1237-4-git-send-email-s.hauer@pengutronix.de>
 <CAGS+omDJ-7+L_46vwMyewHMkMNj69odhp=JY5i6Xj3-Loe6UNA@mail.gmail.com>
 <20150519103010.GA6325@pengutronix.de>
 <CABuKBeKiw8MkG5kWaUBqfDzopwvrX8Kh8XpNfRiC_uJD67OcEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABuKBeKiw8MkG5kWaUBqfDzopwvrX8Kh8XpNfRiC_uJD67OcEg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Sasha Hauer <kernel@pengutronix.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 01:06:10PM +0200, Matthias Brugger wrote:
> 2015-05-19 12:30 GMT+02:00 Sascha Hauer <s.hauer@pengutronix.de>:
> >
> > I'll check for errors next round. However, I cannot bail out in this
> > case since once pm_genpd_init() is called the domain cannot be
> > unregistered anymore.
> 
> We should think of implementing this.
> I had a quick look on it, and from what I understand as long as you
> don't have any subdomains, devices and masters added, it's just
> deleting an element from a linked list.

In my error path I would have subdomains added though, so I would need
that to be handled.

> Maybe we should split this in pm_genpd_prepare and pm_genpd_add, with
> the last one actually adding the generic_pm_domain to gpd_list.
> 
> This way we could also get rid of the two for loops.

Well, with pm_genpd_prepare and pm_genpd_add I would still need two
loops, one for preparing and one for adding.

I'm not sure how useful it really is to be able to unregister power
domains. For now I suggest to continue with the domains that are
successfully registered. I'll look into it should the pm domain
maintainers request it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
