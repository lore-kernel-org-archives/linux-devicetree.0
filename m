From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Date: Thu, 11 Jul 2019 21:35:39 +0200
Message-ID: <20190711193539.GA5912@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
 <20190628171342.GA2238@ravnborg.org>
 <2169143.hEFa8b2HQR@diego>
 <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>, Brian Norris <briannorris@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>, Ez
List-Id: devicetree@vger.kernel.org

Hi Dough.

> > So Thierry was able to look at the patches yesterday it seems and has Acked
> > all the relevant ones. As a drm-misc-contributor I could also apply them
> > myself, but now don't want to preempt any additional comments you might
> > have ;-) . So I guess my question would be if you still want to do a review
> > or if I should apply them.
> 
> Hopefully you saw, but I responded to all of your review feedback.  In
> the end, I thought it'd be OK to land the series as-is and I can fix
> up nits in a follow-up series, though I'm waiting for your responses
> to a couple questions first.
> 
> It would be ideal if you could confirm that you're OK with this plan
> even if you don't have time to respond in detail to my emails yet.  I
> think Heiko can land them all through the appropriate channels since
> the patches have all the proper Acks.
My main concern was the bug cocerning override_mode - which turned out to
be me confused.
There is one part about flags that does not yet makes sense but
we can fix it later.

Please resend a series that applies to drm-misc-next so
we can land this.

	Sam
