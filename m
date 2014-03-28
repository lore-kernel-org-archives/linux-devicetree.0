From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Fri, 28 Mar 2014 11:13:50 +0100
Message-ID: <20140328111350.003b9fce@ipc1.ka-ro>
References: <532BCFCC.4080205@freescale.com>
	<1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
	<20140324095902.GB11377@localhost>
	<20140326095156.3e5585b8@ipc1.ka-ro>
	<5332AEE7.2040402@freescale.com>
	<20140326125502.0e8d0657@ipc1.ka-ro>
	<20140327095956.GA29623@localhost>
	<20140327132109.06258526@ipc1.ka-ro>
	<5334D9F7.2030001@freescale.com>
	<20140328091646.1ce03f90@ipc1.ka-ro>
	<53353524.9020605@freescale.com>
	<20140328100158.042a3d68@ipc1.ka-ro>
	<533541DE.7020606@freescale.com>
	<53354329.2020909@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53354329.2020909@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi,

Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:33, Huang Shijie =E5=
=86=99=E9=81=93:
> > =E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:01, Lothar Wa=C3=9F=
mann =E5=86=99=E9=81=93:
> >> There is no need for the ROM code to access any other partition th=
an
> >> the bootloader itself. Thus Linux can perfectly well be booted fro=
m
> > Assume the ROM only access the partition which contains the=20
> > bootloader, and
> > the ROM does the swapping for the pages(but we do not do the swappi=
ng=20
> > to these pages),
> I mean the kernel do not do the swapping when we burn the uboot to th=
e NAND.
>=20
The kernel need not be able to write the bootloader to NAND.=20
If you want a kernel that can do it, you just need to boot it with one
line in the DTB removed.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
