From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Date: Fri, 28 Jun 2019 08:55:38 -0700
Message-ID: <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190626130007.GE23428@ravnborg.org> <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>, Brian Norris <briannorris@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Ezequiel Garcia <ezequ>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jun 26, 2019 at 7:41 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jun 26, 2019 at 6:00 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Douglas.
> >
> > On Mon, Apr 01, 2019 at 10:17:17AM -0700, Douglas Anderson wrote:
> > > I'm reviving Sean Paul's old patchset to get mode support in device
> > > tree.  The cover letter for his v3 is at:
> > > https://lists.freedesktop.org/archives/dri-devel/2018-February/165162.html
> > >
> > > No code is different between v4 and v5, just commit messages and text
> > > in the bindings.
> > >
> > > I've pulled together the patches that didn't land in v3, addressed
> > > outstanding feedback, and reposted.  Atop them I've added patches for
> > > rk3288-veyron-chromebook (used for jaq, jerry, mighty, speedy) and
> > > rk3288-veryon-minnie.
> > >
> > > Please let me know how they look.
> > >
> > > In general I have added people to the whole series who I think would
> > > like the whole series and then let get_maintainer pick extra people it
> > > thinks are relevant to each individual patch.  If I see you respond to
> > > any of the patches in the series, though, I'll add you to the whole
> > > series Cc list next time.
> > >
> > > Changes in v5:
> > > - Removed bit about OS may ignore (Rob/Ezequiel)
> > > - Added Heiko's Tested-by
> > > - It's not just jerry, it's most rk3288 Chromebooks (Heiko)
> >
> > What are the plans to move forward with this?
> > Or did you drop the whole idea again?
>
> At the moment I'm blocked on Thierry responding, either taking the
> patch or telling me what I need to do to fix it.  I saw Sean Paul ping
> Thierry on IRC on June 3rd and as far as I could tell there was no
> response.
>
> https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&highlight_names=&date=2019-06-03&show_html=true
>
> ...and as you can see Heiko pinged this thread on June 14th.
>
> Thierry: can you help give us some direction?  Are you uninterested in
> reviewing them and would prefer that I find someone to land them in
> drm-misc directly?

Sam: Oh!  I hadn't noticed that you've been added as a panel
maintainer in commit ef0db94f94a0 ("MAINTAINERS: Add Sam as reviewer
for drm/panel").  Does that mean you are able to provide some advice
for how to land this series?  As far as I know everything is in order
for it to land, but if you are aware of something I need to do to spin
it then please let me know!

Thanks!

-Doug
