From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 10:21:53 +0100
Message-ID: <20140320102153.7106f915@ipc1.ka-ro>
References: <1395235406-13449-1-git-send-email-y>
	<532AB1A2.9010702@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <532AB1A2.9010702@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: y@karo-electronics.de, Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8819=E6=97=A5 21:23, y@karo-electroni=
cs.de =E5=86=99=E9=81=93:
> > configurable via DT. This is required for the Ka-Ro electronics
> > platforms.
> >
> If you disable the swapping, you will disable the NAND boot in actual=
ly.
>=20
No. All our modules do boot from NAND and none of them does the
swapping.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
