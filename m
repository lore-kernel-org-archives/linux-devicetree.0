From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Wed, 26 Mar 2014 12:55:02 +0100
Message-ID: <20140326125502.0e8d0657@ipc1.ka-ro>
References: <532BCFCC.4080205@freescale.com>
	<1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
	<20140324095902.GB11377@localhost>
	<20140326095156.3e5585b8@ipc1.ka-ro>
	<5332AEE7.2040402@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5332AEE7.2040402@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi,

Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8826=E6=97=A5 16:51, Lothar Wa=C3=9Fm=
ann =E5=86=99=E9=81=93:
> > I don't see why this should not be supported on i.MX28 (i.MX23 does=
n't
> > do byteswapping anyway, so this wouldn't change anything for i.MX23=
).
> > The partitions used by Linux need not necessarily be accessible for=
 the
> > Boot ROM code (and vice versa).
> But the first partition used to store the u-boot is accessible for th=
e ROM.
>=20
Whether this partition is available to Linux depends on the partition t=
able
passed in the DT.

> Please see "Figure 12-13" in the 12.12.1.12:
>    "In order to preserve the BI (bad block information), flash update=
r=20
> or gang programmer
> applications need to swap Bad Block Information (BI) data to byte 0 o=
f=20
> metadata area for
> every page before programming NAND Flash. ROM when loading firmware,=20
> copies back
> the value at metadata[0] to BI offset in page data. The following fig=
ure=20
> shows how the
> factory bad block marker is preserved."
>=20
The inspection of the BB markers is only a fallback for the case that
there is no DBBT. From the same chapter that you quoted above:
| ROM uses DBBT to skip any bad block that falls within firmware data
| on NAND Flash device.
| If the address of DBBT Search Area in FCB is 0, ROM will rely on
| factory marked bad block markers to find out if a block is good or ba=
d.

Thus, even the boot ROM of i.MX28 can well live without blockmark
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
