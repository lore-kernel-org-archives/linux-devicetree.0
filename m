From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 0/8] clk: meson: gxbb: more clock controller update for audio
 support
Date: Wed, 29 Mar 2017 13:42:53 -0700
Message-ID: <149082017390.31513.12254031076684821992@resonance>
References: <20170328144605.25278-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170328144605.25278-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, narmstrong@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Jerome,

Adding Neil Armstong to Cc.

Quoting Jerome Brunet (2017-03-28 07:45:57)
> The patchset is the 2nd round of update to the meson gxbb clock controller
> to add initial audio support. The patchset is based on clk-next.
> =

> There is not much out of the ordinary here (adding new clocks and exposing
> them) except maybe for 2 patches:
> Patch #2: Adds a safety check while registering clocks to protect against
>           holes in clk_hw_onecell_data, if it ever happens. Same thing is
>           done for the meson8b clock controller. =

> Patch #3: Adds a new clock divider driver to implement the necessary
>           policy for the i2s master clock (see patch changelog)
> =

> This patchset has been test on the gxbb p200 and gxl p230.

First off, this series looks fine to me. Please add,

Acked-by: Michael Turquette <mturquette@baylibre.com>

Secondly, it seems the AmLogic clock drivers have mostly calmed down and
things are in the "add new clocks when we need them" phase, which is
nice. Since you and Neil are doing a lot of this work, might I suggest
that you both start collecting patches for the AmLogic/meson clock
drivers begin submitting pull requests to Stephen and myself?

As usual the rules are the same as always: all patches in the PR must
first be posted for review on the list. PRs should correspond to signed
tags. Stephen and I might ignore PRs sent after -rc4, and will
definitely ignore PRs sent after -rc6 since we want some stabilization
time before the merge window. Base your branch on -rc1, not on clk-next.

Also feel free to submit a patch to MAINTAINERS with either one or both
of you maintaining the meson clk stuff, assuming that you're OK to
review all of those patches and collect them into a PR.

Thoughts?

If it sounds good to you then I suggest grabbing the clk-meson branch
from the clk tree and using that as a baseline for your first PR. In the
future you'll just Linus' -rc1, but I have already created a branch for
this cycle. You can apply these 8 patches with my Ack and send a PR by
-rc6 (possibly with other stuff collected from Martin, etc).

Thanks,
Mike

> =

> Jerome Brunet (8):
>   dt-bindings: clock: gxbb: expose spdif clock gates
>   clk: meson: gxbb: protect against holes in the onecell_data array
>   clk: meson: add audio clock divider support
>   clk: meson: gxbb: add cts_amclk
>   clk: meson: gxbb: add cts_mclk_i958
>   clk: meson: gxbb: add cts_i958 clock
>   dt-bindings: clock: gxbb: expose i2s master clock
>   dt-bindings: clock: gxbb: expose spdif master clock
> =

>  drivers/clk/meson/Makefile            |   2 +-
>  drivers/clk/meson/clk-audio-divider.c | 149 ++++++++++++++++++++++++++++=
++++++
>  drivers/clk/meson/clkc.h              |  10 +++
>  drivers/clk/meson/gxbb.c              | 144 ++++++++++++++++++++++++++++=
++++
>  drivers/clk/meson/gxbb.h              |  13 ++-
>  include/dt-bindings/clock/gxbb-clkc.h |   5 ++
>  6 files changed, 319 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/clk/meson/clk-audio-divider.c
> =

> -- =

> 2.9.3
>=20
