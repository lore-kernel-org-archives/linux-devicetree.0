From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 01/25] arm64: dts: allwinner: Switch A64
 dts(i) to use SPDX identifier
Date: Wed, 3 Jul 2019 17:30:56 +0200
Message-ID: <20190703153056.jhks4yb4ag56rrx5@flea>
References: <20190703124609.21435-1-jagan@amarulasolutions.com>
 <20190703124609.21435-2-jagan@amarulasolutions.com>
 <20190703132838.nhewz5wzsijl65s5@flea>
 <CAMty3ZDyx_RSkU=OndsvzS5reOzab0DBkrarSeHt+-gtsdyKuQ@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSMR6TUAKGQEYZJIIJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZDyx_RSkU=OndsvzS5reOzab0DBkrarSeHt+-gtsdyKuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2019 at 07:52:27PM +0530, Jagan Teki wrote:
> On Wed, Jul 3, 2019 at 6:58 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Wed, Jul 03, 2019 at 06:15:45PM +0530, Jagan Teki wrote:
> > > Adopt the SPDX license identifier headers to ease license
> > > compliance management on Allwinner A64 dts(i) files.
> > >
> > > While the text specifies "of the GPL or the X11 license"
> > > but the actual license text matches the MIT license as
> > > specified at [0]
> > >
> > > [0] https://spdx.org/licenses/MIT.html
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > >  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 39 +------------------
> > >  .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 39 +------------------
> > >  .../dts/allwinner/sun50i-a64-olinuxino.dts    | 39 +------------------
> > >  .../dts/allwinner/sun50i-a64-orangepi-win.dts | 39 +------------------
> > >  .../dts/allwinner/sun50i-a64-pine64-plus.dts  | 39 +------------------
> > >  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 39 +------------------
> > >  .../allwinner/sun50i-a64-sopine-baseboard.dts | 39 +------------------
> > >  .../boot/dts/allwinner/sun50i-a64-sopine.dtsi | 39 +------------------
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 39 +------------------
> > >  9 files changed, 9 insertions(+), 342 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > > index 208373efee49..efdd84c362b0 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > > @@ -1,43 +1,6 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >
> > You say that this is a GPL2 only license
> >
> > >  /*
> > >   * Copyright (c) 2016 ARM Ltd.
> > > - *
> > > - * This file is dual-licensed: you can use it either under the terms
> > > - * of the GPL or the X11 license, at your option. Note that this dual
> > > - * licensing only applies to this file, and not this project as a
> > > - * whole.
> > > - *
> > > - *  a) This library is free software; you can redistribute it and/or
> > > - *     modify it under the terms of the GNU General Public License as
> > > - *     published by the Free Software Foundation; either version 2 of the
> > > - *     License, or (at your option) any later version.
> >
> > While this is GPL2 or later.
>
> Yes, this is where I was confused with compared to existing
> architectures. It seems like it is a call from author of the file or
> make GPL-2.0 for generic purpose [1], not really sure.

What are you confused about? This is GPL2 or later, and it shouldn't
really be changed (unless we have the consent of all the contributors
of all the DTs, but that's a can of worm I don't want to reopen).

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
