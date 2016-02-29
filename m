From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv2 16/16] ARM: dts: imx6ul: add support for Ka-Ro
 electronics TXUL modules
Date: Mon, 29 Feb 2016 12:21:39 +0100
Message-ID: <20160229122139.6a560304@ipc1.ka-ro>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
	<1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
	<1453284549-16363-17-git-send-email-LW@KARO-electronics.de>
	<20160228064326.GG22051@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160228064326.GG22051@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, 28 Feb 2016 14:43:26 +0800 Shawn Guo wrote:
> On Wed, Jan 20, 2016 at 11:09:09AM +0100, Lothar Wa=C3=9Fmann wrote:
[...]
> > +/dts-v1/;
> > +#include "imx6ul.dtsi"
> > +#include "imx6ul-txul.dtsi"
> > +
> > +/ {
> > +	model =3D "Ka-Ro electronics TXUL-0010 Module";
> > +	compatible =3D "karo,imx6ul-tx6ul", "fsl,imx6ul";
> > +
> > +	aliases {
> > +		mmc0 =3D &usdhc1;
> > +		/delete-property/ mmc1;
>=20
> Why is this deletion of mmc1 needed?
>=20
Its not actually necessary, but for convenience of U-Boot users who may
want to enable/disable the mmc interface dynamically. Since the
USDHC2 interface is not available on this module, I prefer not to have
a dangling alias that points to an interface that is not actually
useable.

> > diff --git a/arch/arm/boot/dts/imx6ul-txul-0011.dts b/arch/arm/boot=
/dts/imx6ul-txul-0011.dts
> > new file mode 100644
> > index 0000000..dd3055b
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6ul-txul-0011.dts
> > @@ -0,0 +1,85 @@
> > +/*
> > + * Copyright 2015 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > + *
> > + * This file is dual-licensed: you can use it either under the ter=
ms
> > + * of the GPL or the X11 license, at your option. Note that this d=
ual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License
> > + *     version 2 as published by the Free Software Foundation.
> > + *
> > + *     This file is distributed in the hope that it will be useful=
,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See t=
he
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentat=
ion
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use=
,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/o=
r
> > + *     sell copies of the Software, and to permit persons to whom =
the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall=
 be
> > + *     included in all copies or substantial portions of the Softw=
are.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY K=
IND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRAN=
TIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY=
,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx6ul.dtsi"
> > +#include "imx6ul-txul.dtsi"
> > +
> > +/ {
> > +	model =3D "Ka-Ro electronics TXUL-0011 Module";
> > +	compatible =3D "karo,imx6ul-tx6ul", "fsl,imx6ul";
> > +
> > +	aliases {
> > +		mmc0 =3D &usdhc2;
> > +		mmc1 =3D &usdhc1;
> > +	};
> > +};
> > +
> > +&gpmi {
> > +	status =3D "disabled";
> > +};
> > +
> > +&iomuxc {
> > +	imx6ul-txul {
>=20
> Since commit 5fcdf6a7ed95 (pinctrl: imx: Allow parsing DT without
> function nodes), we can save this container node.
>=20
I already reworked the file in the meantime, so that this and your
remaining comments are addressed.


Lothar Wa=C3=9Fmann
