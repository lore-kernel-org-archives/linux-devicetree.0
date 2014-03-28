From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Fri, 28 Mar 2014 11:18:05 +0100
Message-ID: <20140328111805.76b6513d@ipc1.ka-ro>
References: <1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
	<20140324095902.GB11377@localhost>
	<20140326095156.3e5585b8@ipc1.ka-ro>
	<5332AEE7.2040402@freescale.com>
	<20140326125502.0e8d0657@ipc1.ka-ro>
	<20140327095956.GA29623@localhost>
	<20140327132109.06258526@ipc1.ka-ro>
	<5334D9F7.2030001@freescale.com>
	<20140328091646.1ce03f90@ipc1.ka-ro>
	<53353524.9020605@freescale.com>
	<20140328090023.GB17250@pengutronix.de>
	<53354057.6030004@freescale.com>
	<20140328103147.3fdadfd7@ipc1.ka-ro>
	<53354A46.9040807@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53354A46.9040807@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:31, Lothar Wa=C3=9Fm=
ann =E5=86=99=E9=81=93:
> > Hi,
> >
> > Huang Shijie wrote:
> >> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:00, Sascha Hauer =
=E5=86=99=E9=81=93:
> >>> - disables swapping of BB marks in the FCB the ROM won't swap byt=
es.
> >> We can not disable the swapping in the FCB in the imx28.
> >> The DISBBM bit in the FCB does _NOT_ exit in the imx28's FCB.
> >>
> > The Linux kernel does not have any business with the FCB, so it is
> > completely irrelevant for Linux whether byte swapping can be disabl=
ed
> > in the FCB or not.
> >
> But the gpmi is relevant to the ROM.
> the gpmi driver should keep consistency with the ROM.
>=20
> I do not object you add the swapping optional the gpmi driver(since i=
t's=20
> ok for imx50/imx6q/imx6sx),
> i just object that you enable this feature for imx28.
>=20
We are talking about a Linux Kernel Driver here, not about a flashtool
for i.MX28.
It is a valid usecase for Linux not being able to write the bootloader,
so there is no reason to disallow this feature in the driver code.
Since it is a DT option it can be trivially switched on and off without
having to change anything in the kernel.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
