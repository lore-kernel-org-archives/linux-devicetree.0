From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: Add panel-timing subnode to simple-panel
Date: Fri, 29 Mar 2019 09:14:43 -0700
Message-ID: <CAD=FV=UeGChy6iJH1r9tDLmBHP1UR3f3N+7ofJ-pqWC5jYgo5A@mail.gmail.com>
References: <20190328171710.31949-1-dianders@chromium.org> <20190328171710.31949-2-dianders@chromium.org>
 <f2f82f439f2b7586cb4c83f15122d8d19952d596.camel@collabora.com>
 <CAD=FV=WOKSHWCHPv9kQT7np6v_ZYBmAsnTpAHJv7zRS_3b46JQ@mail.gmail.com> <CAL_JsqJNPMnVLyPGeK5Jd=QVSO1zWvPEiPcgas03yP_P66M-uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJNPMnVLyPGeK5Jd=QVSO1zWvPEiPcgas03yP_P66M-uw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Ezequiel Garcia <ezequiel@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, Eric Anholt <eric@anholt.net>, Jeffy Chen <jeffy.chen@rock-chips.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 29, 2019 at 9:13 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Mar 28, 2019 at 6:50 PM Doug Anderson <dianders@chromium.org> wro=
te:
> >
> > Hi,
> >
> >
> > On Thu, Mar 28, 2019 at 1:27 PM Ezequiel Garcia <ezequiel@collabora.com=
> wrote:
> > >
> > > On Thu, 2019-03-28 at 10:17 -0700, Douglas Anderson wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > This patch adds a new subnode to simple-panel allowing us to overri=
de
> > > > the typical timing expressed in the panel's display_timing.
> > > >
> > > > Changes in v2:
> > > >  - Split out the binding into a new patch (Rob)
> > > >  - display-timings is a new section (Rob)
> > > >  - Use the full display-timings subnode instead of picking the timi=
ng
> > > >    out (Rob/Thierry)
> > > > Changes in v3:
> > > >  - Go back to using the timing subnode directly, but rename to
> > > >    panel-timing (Rob)
> > > > Changes in v4:
> > > >  - Simplify desc. for when override should be used (Thierry/Laurent=
)
> > > >  - Removed Rob H review since it's been a year and wording changed
> > > >
> > > > Cc: Doug Anderson <dianders@chromium.org>
> > > > Cc: Eric Anholt <eric@anholt.net>
> > > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > > Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: linux-rockchip@lists.infradead.org
> > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  .../bindings/display/panel/simple-panel.txt   | 24 +++++++++++++++=
++++
> > > >  1 file changed, 24 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/simple=
-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.t=
xt
> > > > index b2b872c710f2..6157f86ddce4 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/simple-panel.=
txt
> > > > +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.=
txt
> > > > @@ -15,6 +15,18 @@ Optional properties:
> > > >    (hot plug detect) signal, but the signal isn't hooked up so we s=
hould
> > > >    hardcode the max delay from the panel spec when powering up the =
panel.
> > > >
> > > > +panel-timing subnode
> > > > +--------------------
> > > > +
> > > > +This optional subnode is for devices which require a mode differin=
g
> > > > +from the panel's "typical" display timing.  The panel timings prov=
ided
> > > > +here will be ignored if they are found to be outside of allowable
> > > > +ranges for the given panel.
> > > > +
> > >
> > > Is it OK to put this comment about how the implementation
> > > will behave when values are out of range, given this is just a bindin=
g
> > > spec?
> > >
> > > Perhaps -if needed- this sentence can be rephrased to state that,
> > > e.g. the OS may not be able to apply these values, if the controller
> > > or device is unable to?
> >
> > I will defer to Rob H. on this one, but I'm happy to simply remove the
> > last sentence.  I was trying to add a more OS-agnostic version of the
> > bullet points from V3 but agree that we could just remove this from
> > the bindings completely.
>
> Following my opinion that it's not the kernel's job to validate
> bindings, I would say it's fine for the OS to blindly apply them if it
> chooses.
>
> Plus with schema, you can provide the ranges of values and validate
> DTs up front (unless you want to validate some result of math
> operations).

OK, I'll remove the sentence and repost sometime early next week.  Thanks!

-Doug
