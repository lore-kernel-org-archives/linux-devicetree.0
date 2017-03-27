From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/9] clk: meson: update clock controller for audio support
Date: Mon, 27 Mar 2017 12:52:52 -0700
Message-ID: <149064437219.54062.14490095828514639237@resonance>
References: <20170309104154.28295-1-jbrunet@baylibre.com> <m2r324bq9s.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2r324bq9s.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Kevin Hilman (2017-03-10 16:39:27)
> Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
> =

> > This patchset is a first round of update to the meson clock controllers
> > to bring audio support. The patchset is based on clk-next. It could be
> > rebased on amlogic tree later on, if you prefer the patches to go throu=
gh
> > Kevin's tree.
> =

> I'd prefer these go through the clk tree, and get an immutable branch
> that I can use for my stuff that goes through the arm-soc tree.

Applied to clk-meson, a stable branch, which has been merged into
clk-next.

Kevin, feel free to use clk-meson or any commit id therein: they will
not be rebased.

Regards,
Mike

> =

> Kevin
> =

> > First patch fix an issue found while writing patch 5 (Giving ternary
> > operator to SET_PARM)
> >
> > Following Stephen comment on the v1, patch 2 adds the const qualifiers
> > missing upstream.
> >
> > Patches 3 and 4 put the generic muxes and divisors declaration in table=
s so
> > the register address fixup works in the same way as the clock gates. We=
 are
> > going to add more of these clock types for audio or gpu support, so we
> > can't continue to fix addresses individually like it is currently done.
> >
> > Patches 5 to 8 improve the support of the mpll clocks, now allowing the
> > rate to be set. Among other things, the mplls are the parent clocks of =
the
> > i2s and spdif clocks.
> >
> > Patch 9 expose the clock gates required to power on the i2s output.
> >
> > These patches have been tested on the meson gxbb p200 board, as part of=
 the
> > ongoing work to bring audio support to meson SoC family.
> >
> > Changes since v1 [0]:
> >  * Add SET_PARM fix to the series
> >  * Add missing const qualifiers to the clock arrays
> >  * No more additional patches required as SAR clocks have been merged
> >
> > [0]: http://lkml.kernel.org/r/20170228133002.17894-1-jbrunet@baylibre.c=
om
> >
> > Jerome Brunet (9):
> >   clk: meson: fix SET_PARM macro
> >   clk: meson: add missing const qualifiers on gate arrays
> >   clk: meson8b: put dividers and muxes in tables
> >   clk: gxbb: put dividers and muxes in tables
> >   clk: meson: mpll: add rw operation
> >   clk: meson: gxbb: mpll: use rw operation
> >   clk: meson8b: add the mplls clocks 0, 1 and 2
> >   clk: meson: mpll: correct N2 maximum value
> >   dt-bindings: clk: gxbb: expose i2s output clock gates
> >
> >  drivers/clk/meson/clk-mpll.c          | 152 ++++++++++++++++++++++++++=
++++++--
> >  drivers/clk/meson/clkc.h              |   6 +-
> >  drivers/clk/meson/gxbb.c              |  66 ++++++++++++---
> >  drivers/clk/meson/gxbb.h              |  10 +--
> >  drivers/clk/meson/meson8b.c           | 127 ++++++++++++++++++++++++++=
--
> >  drivers/clk/meson/meson8b.h           |  20 ++++-
> >  include/dt-bindings/clock/gxbb-clkc.h |   5 ++
> >  7 files changed, 356 insertions(+), 30 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
