From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: Add Oceanic A64-5inMFD initial support
Date: Wed, 27 Feb 2019 21:49:23 +0530
Message-ID: <CAMty3ZDSZvaxMjcQJLNaTDJQ5OjJ9NbjpOJKWMUE5PhRCzYvqw@mail.gmail.com>
References: <20190226060240.8783-1-jagan@amarulasolutions.com>
 <20190226060240.8783-2-jagan@amarulasolutions.com> <20190227153346.dwd3stsbsvf7rwly@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190227153346.dwd3stsbsvf7rwly@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ryan Pannell <ryan@osukl.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 9:03 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Tue, Feb 26, 2019 at 11:32:40AM +0530, Jagan Teki wrote:
> > Oceanic A64-5inMFD is a 5 inch Multi function display baseboard
> > designed to mount SoPine SOM.
> >
> > Key features:
> > - Allwinner A64 Cortex-A53
> > - Mali-400MP2 GPU
> > - AXP803 PMIC
> > - 2GB DDR3 RAM
> > - SD Slot
> > - SPI-NOR flash
> > - EMAC, RTL8211E
> > - MCP2515 CAN
> > - MIPI-DSI
> > - Goodix 911 CTP
> > - USB Host
> > - 12V DC power supply
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
> >  .../allwinner/sun50i-a64-oceanic-5inmfd.dts   | 46 +++++++++++++++++++
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index a5fb1eaa8acf..ec39fe856117 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -2,6 +2,7 @@
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-amarula-relic.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb sun50i-a64-bananapi-m64-icn6211.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-oceanic-5inmfd.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
> > new file mode 100644
> > index 000000000000..d73d1f55acb9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2019 Oceanic Systems (UK) Ltd.
> > + * Copyright (C) 2019 Amarula Solutions B.V.
> > + * Author: Jagan Teki <jagan@amarulasolutions.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-a64-sopine.dtsi"
> > +
> > +/ {
> > +     model = "Oceanic A64-5inMFD";
> > +     compatible = "oceanic,a64-5inmfd", "allwinner,sun50i-a64";
>
> The name of the DT is Oceanic 5inMFD, while you call the board
> A64-5inMFD here, which name is the actual name?

Yes, this is something that we discussed during "Amarula A64-Relic"
naming convention.

Since these boards are not famous like teres-i we agreed to add vendor
name after sun50i-a64- followed by real board name.

Here A64 already covered during sun50i-a64- so the dts name simply the
<vendor_name>-<real_board_name>

>
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +};
> > +
> > +&ehci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status = "okay";
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_pb_pins>;
> > +     status = "okay";
> > +};
> > +
> > +&usb_otg {
> > +     dr_mode = "host";
> > +     status = "okay";
> > +};
> > +
> > +&usbphy {
> > +     status = "okay";
> > +};
>
> Is the OTG controller really is only capable of running in host mode?

Yes, USB on baseboard is similar like sopine-baseboard
