From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Date: Tue, 14 May 2019 17:17:24 +0200
Message-ID: <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com> <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 14 May 2019 at 12:29, Neil Armstrong <narmstrong@baylibre.com> wrot=
e:
>
> Hi,
>
> On 13/05/2019 17:14, Daniel Vetter wrote:
> > On Sun, May 12, 2019 at 07:46:00PM +0200, peron.clem@gmail.com wrote:
> >> From: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >>
> >> Hi,
> >>
> >> The Allwinner H6 has a Mali-T720 MP2. The drivers are
> >> out-of-tree so this series only introduce the dt-bindings.
> >
> > We do have an in-tree midgard driver now (since 5.2). Does this stuff w=
ork
> > together with your dt changes here?
>
> No, but it should be easy to add.
I will give it a try and let you know.

>
> Cl=C3=A9ment, no need to resend the first patch, it's now on
> linus master.
Ok

Thanks,
Clement

>
> Could you also add support for the bus clock in panfrost
> in the same patchset since it's also on master now ?
>
> Neil
>
> > -Daniel
> >
> >> The first patch is from Neil Amstrong and has been already
> >> merged in linux-amlogic. It is required for this series.
> >>
> >> The second patch is from Icenowy Zheng where I changed the
> >> order has required by Rob Herring.
> >> See: https://patchwork.kernel.org/patch/10699829/
> >>
> >> Thanks,
> >> Cl=C3=A9ment
> >>
> >> Changes in v4:
> >>  - Add Rob Herring reviewed-by tag
> >>  - Resent with correct Maintainers
> >>
> >> Changes in v3 (Thanks to Maxime Ripard):
> >>  - Reauthor Icenowy for her patch
> >>
> >> Changes in v2 (Thanks to Maxime Ripard):
> >>  - Drop GPU OPP Table
> >>  - Add clocks and clock-names in required
> >>
> >> Cl=C3=A9ment P=C3=A9ron (6):
> >>   dt-bindings: gpu: mali-midgard: Add H6 mali gpu compatible
> >>   arm64: dts: allwinner: Add ARM Mali GPU node for H6
> >>   arm64: dts: allwinner: Add mali GPU supply for Pine H64
> >>   arm64: dts: allwinner: Add mali GPU supply for Beelink GS1
> >>   arm64: dts: allwinner: Add mali GPU supply for OrangePi Boards
> >>   arm64: dts: allwinner: Add mali GPU supply for OrangePi 3
> >>
> >> Icenowy Zheng (1):
> >>   dt-bindings: gpu: add bus clock for Mali Midgard GPUs
> >>
> >> Neil Armstrong (1):
> >>   dt-bindings: gpu: mali-midgard: Add resets property
> >>
> >>  .../bindings/gpu/arm,mali-midgard.txt         | 27 ++++++++++++++++++=
+
> >>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  5 ++++
> >>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    |  5 ++++
> >>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  5 ++++
> >>  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  5 ++++
> >>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 14 ++++++++++
> >>  6 files changed, 61 insertions(+)
> >>
> >> --
> >> 2.17.1
> >>
> >
>
