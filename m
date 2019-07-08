From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Date: Mon, 8 Jul 2019 08:58:41 -0700
Message-ID: <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
 <20190628171342.GA2238@ravnborg.org> <2169143.hEFa8b2HQR@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2169143.hEFa8b2HQR@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>, Brian Norris <briannorris@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Ezequiel Garcia <ezequi>
List-Id: devicetree@vger.kernel.org

Hi Sam,

On Sat, Jun 29, 2019 at 7:09 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Sam,
>
> Am Freitag, 28. Juni 2019, 19:13:42 CEST schrieb Sam Ravnborg:
> > Hi Doug.
> >
> > > Sam: Oh!  I hadn't noticed that you've been added as a panel
> > > maintainer in commit ef0db94f94a0 ("MAINTAINERS: Add Sam as reviewer
> > > for drm/panel").  Does that mean you are able to provide some advice
> > > for how to land this series?
> > Reviewer only, not maintainer....
> >
> > It is on my TODO list for the weekend to go through the patch set in
> > details and provide feedback. I have read them before, but I miss to do
> > a more detailed read through.
> >
> > But I cannot apply this unless Thierry or one of the DRM maintainers
> > ack it.
> > We simply need someone with a better general knowledge of DRM to ack it
> > than I have.
>
> So Thierry was able to look at the patches yesterday it seems and has Ack=
ed
> all the relevant ones. As a drm-misc-contributor I could also apply them
> myself, but now don't want to preempt any additional comments you might
> have ;-) . So I guess my question would be if you still want to do a revi=
ew
> or if I should apply them.

Hopefully you saw, but I responded to all of your review feedback.  In
the end, I thought it'd be OK to land the series as-is and I can fix
up nits in a follow-up series, though I'm waiting for your responses
to a couple questions first.

It would be ideal if you could confirm that you're OK with this plan
even if you don't have time to respond in detail to my emails yet.  I
think Heiko can land them all through the appropriate channels since
the patches have all the proper Acks.

Thanks!

-Doug
