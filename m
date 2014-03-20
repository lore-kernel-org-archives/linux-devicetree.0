From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 11:09:14 +0100
Message-ID: <20140320110914.731db7cf@ipc1.ka-ro>
References: <1395235406-13449-1-git-send-email-y>
	<532AB1A2.9010702@freescale.com>
	<20140320102153.7106f915@ipc1.ka-ro>
	<532AB94D.1050406@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <532AB94D.1050406@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: y@KARO-electronics.de, Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, b47714@freescale.com
List-Id: devicetree@vger.kernel.org

Hi,

Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8820=E6=97=A5 17:21, Lothar Wa=C3=9Fm=
ann =E5=86=99=E9=81=93:
> > Hi,
> >
> > Huang Shijie wrote:
> >> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8819=E6=97=A5 21:23, y@karo-electr=
onics.de =E5=86=99=E9=81=93:
> >>> configurable via DT. This is required for the Ka-Ro electronics
> >>> platforms.
> >>>
> >> If you disable the swapping, you will disable the NAND boot in act=
ually.
> >>
> > No. All our modules do boot from NAND and none of them does the
> > swapping.
> >
> >
> It seems the NAND boot runs well by luck.
>=20
> The ROM will do the swapping when it reads the BBT table written by t=
he=20
> kobs-ng (or something else?).
>=20
This can be disabled by parameter in the FCB (at least according to
the i.MX6 reference Manual):
|DISBBM 172 4 If 0 ROM will swap BadBlockMarkerByte with
|             metadata[0] after reading a page using BCH40.
|             If the value set is 1 then ROM will not do
|             swapping


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
