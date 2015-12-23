From: Roman Volkov <v1ron@mail.ru>
Subject: Re: [PATCH v3 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Thu, 24 Dec 2015 00:48:25 +0300
Message-ID: <20151224004825.4350790e@anonymous>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
	<1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
	<2119510.55A8Br1LeL@wuerfel>
	<20150301233911.2352ce48@v1ron-s7>
	<20150404152720.1059e741@v1ron-s7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150404152720.1059e741@v1ron-s7>
Sender: linux-kernel-owner@vger.kernel.org
To: Roman Volkov <v1ron@v1ros.org>
Cc: Roman Volkov <rvolkov@v1ros.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>, linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>
List-Id: devicetree@vger.kernel.org

=D0=92 Sat, 4 Apr 2015 15:27:20 +0300
Roman Volkov <v1ron@v1ros.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> =D0=92 Sun, 1 Mar 2015 23:39:11 +0300
> Roman Volkov <rvolkov@v1ros.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>=20
> > =D0=92 Sun, 01 Mar 2015 20:52:55 +0100
> > Arnd Bergmann <arnd@arndb.de> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> > > On Sunday 01 March 2015 19:06:45 Roman Volkov wrote: =20
> > > > This patch set enables SD controller support for WM8650 and
> > > > fixes minor errors in WM8505 Device Tree file.
> > > >=20
> > > > Changes in v3:
> > > > 1. Add minor fixes for WM8505 SDHC node
> > > >=20
> > > > Tested on both WM8505 and WM8650.
> > > >=20
> > > > Roman Volkov (2):
> > > >   dts: vt8500: Add SDHC node to DTS file for WM8650
> > > >   dts: vt8500: Fix errors in SDHC node for WM8505
> > > >=20
> > > >  arch/arm/boot/dts/wm8505.dtsi | 4 ++--
> > > >  arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
> > > >  2 files changed, 11 insertions(+), 2 deletions(-)
> > > >=20
> > > > --=20
> > > > Hi maintainers, I see my previous versions were not applied.
> > > > Could this little patch set be applied for the linux-next? I
> > > > don't think this is new functionality, this must be considered
> > > > as bugfix for existing Device Tree.
> > > >=20
> > > > Any other suggestions? =20
> > >=20
> > > According to the MAINTAINERS file, Tony Prisk should be the perso=
n
> > > to pick them up, but he was not the recipient of the mail.
> > >=20
> > > 	Arnd =20
> >=20
> > Thanks for the tip. Tony probably need to add these files to his
> > list of maintained files. get_maintainer.pl doesn't mention him.
> >=20
> > Roman =20
>=20
> Arnd,
>=20
> No response yet from Tony for over a month.
>=20
> Roman

Ping. At least two patch sets for vt8500 are waiting to be picked up.
vt8500 maintainer is inactive for over a year.

Regards,
Roman
