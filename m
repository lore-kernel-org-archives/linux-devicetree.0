From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to simple-panel
Date: Mon, 20 May 2019 11:35:43 -0700
Message-ID: <CAD=FV=WKkfhS8q2Wnx6PfHyq8m6oGhu=RideOykdTQ4dJrwfUg@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-2-dianders@chromium.org> <20190408103240.GF6644@ulmo> <CAD=FV=UJXLeEDPRAHY5-f2D4qJ4rq0LmKUDf4MANrb5KOm_x=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=UJXLeEDPRAHY5-f2D4qJ4rq0LmKUDf4MANrb5KOm_x=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Eric Anholt <eric@anholt.net>, Jeffy Chen <jeffy.chen@rock-chips.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

Thierry,

On Mon, Apr 8, 2019 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Thierry,
>
> On Mon, Apr 8, 2019 at 3:32 AM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >
> > On Mon, Apr 01, 2019 at 10:17:18AM -0700, Douglas Anderson wrote:
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > This patch adds a new subnode to simple-panel allowing us to override
> > > the typical timing expressed in the panel's display_timing.
> > >
> > > Changes in v2:
> > >  - Split out the binding into a new patch (Rob)
> > >  - display-timings is a new section (Rob)
> > >  - Use the full display-timings subnode instead of picking the timing
> > >    out (Rob/Thierry)
> > > Changes in v3:
> > >  - Go back to using the timing subnode directly, but rename to
> > >    panel-timing (Rob)
> > > Changes in v4:
> > >  - Simplify desc. for when override should be used (Thierry/Laurent)
> > >  - Removed Rob H review since it's been a year and wording changed
> > > Changes in v5:
> > >  - Removed bit about OS may ignore (Rob/Ezequiel)
> > >
> > > Cc: Doug Anderson <dianders@chromium.org>
> > > Cc: Eric Anholt <eric@anholt.net>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-rockchip@lists.infradead.org
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../bindings/display/panel/simple-panel.txt   | 22 +++++++++++++++++=
++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/simple-p=
anel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> > > index b2b872c710f2..93882268c0b9 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/simple-panel.tx=
t
> > > +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.tx=
t
> > > @@ -15,6 +15,16 @@ Optional properties:
> > >    (hot plug detect) signal, but the signal isn't hooked up so we sho=
uld
> > >    hardcode the max delay from the panel spec when powering up the pa=
nel.
> > >
> > > +panel-timing subnode
> >
> > Is there any reason why we need the panel- prefix? This is already part
> > of a panel definition, so it's completely redundant. Why not just name
> > the subnode "timing"?
>
> It was a really long time ago since this patch series was idle for a
> while, but you previous had similar feedback in v3 but ended up OK
> with it.  See:
>
> https://patchwork.kernel.org/patch/10207583/
>
> I believe the original node name came out of some back and forth
> between Rob and Sean.  As far as I can tell, the context is back in
> <https://patchwork.kernel.org/patch/10203483/>.  I think Rob wanted it
> to follow other similar node names.
>
>
> That all being said, if you feel strongly about it being called
> "timing" and Rob's OK w/ that too then I'll re-spin the series.

With 5.2-rc1 out, maybe this series is ready to land?  If you'd like
me to change things as per above I can.  ...but it feels like keeping
the already-agreed-upon name might be easiest / best?  Presumably
you'd land patches 1, 2, 4, and 5 and then Heiko could land the dts
patches?

Thanks!

-Doug
