From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 01/25] arm64: dts: allwinner: Switch A64 dts(i) to use
 SPDX identifier
Date: Wed, 3 Jul 2019 19:52:27 +0530
Message-ID: <CAMty3ZDyx_RSkU=OndsvzS5reOzab0DBkrarSeHt+-gtsdyKuQ@mail.gmail.com>
References: <20190703124609.21435-1-jagan@amarulasolutions.com>
 <20190703124609.21435-2-jagan@amarulasolutions.com> <20190703132838.nhewz5wzsijl65s5@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703132838.nhewz5wzsijl65s5@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 6:58 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Wed, Jul 03, 2019 at 06:15:45PM +0530, Jagan Teki wrote:
> > Adopt the SPDX license identifier headers to ease license
> > compliance management on Allwinner A64 dts(i) files.
> >
> > While the text specifies "of the GPL or the X11 license"
> > but the actual license text matches the MIT license as
> > specified at [0]
> >
> > [0] https://spdx.org/licenses/MIT.html
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 39 +------------------
> >  .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 39 +------------------
> >  .../dts/allwinner/sun50i-a64-olinuxino.dts    | 39 +------------------
> >  .../dts/allwinner/sun50i-a64-orangepi-win.dts | 39 +------------------
> >  .../dts/allwinner/sun50i-a64-pine64-plus.dts  | 39 +------------------
> >  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 39 +------------------
> >  .../allwinner/sun50i-a64-sopine-baseboard.dts | 39 +------------------
> >  .../boot/dts/allwinner/sun50i-a64-sopine.dtsi | 39 +------------------
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 39 +------------------
> >  9 files changed, 9 insertions(+), 342 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > index 208373efee49..efdd84c362b0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > @@ -1,43 +1,6 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>
> You say that this is a GPL2 only license
>
> >  /*
> >   * Copyright (c) 2016 ARM Ltd.
> > - *
> > - * This file is dual-licensed: you can use it either under the terms
> > - * of the GPL or the X11 license, at your option. Note that this dual
> > - * licensing only applies to this file, and not this project as a
> > - * whole.
> > - *
> > - *  a) This library is free software; you can redistribute it and/or
> > - *     modify it under the terms of the GNU General Public License as
> > - *     published by the Free Software Foundation; either version 2 of the
> > - *     License, or (at your option) any later version.
>
> While this is GPL2 or later.

Yes, this is where I was confused with compared to existing
architectures. It seems like it is a call from author of the file or
make GPL-2.0 for generic purpose [1], not really sure.

>
> Also, I'm not sure why we need 25 patches to do that. Can't you just
> send one (there's no even need to separate arm and arm64, since we
> will do only a single PR from now as opposed to what we were doing
> before).

Just to make a clear conversion possible with individual SoC + boards
files, I did based on existing arch's does. np, if require I can send
it in single patch.

[1] https://patchwork.kernel.org/patch/10963113/
