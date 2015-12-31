From: Roman Volkov <v1ron@mail.ru>
Subject: Re: [PATCH v3 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Thu, 31 Dec 2015 21:19:28 +0300
Message-ID: <20151231211928.3f9ce84b@v1ron-s7>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
	<20151224004825.4350790e@anonymous>
	<5659431.mYBM8uKUnZ@wuerfel>
	<14890370.KqS7HiJXlh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <14890370.KqS7HiJXlh@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Roman Volkov <v1ron@v1ros.org>, Roman Volkov <rvolkov@v1ros.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>, linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>
List-Id: devicetree@vger.kernel.org

=D0=92 Thu, 31 Dec 2015 16:32:59 +0100
Arnd Bergmann <arnd@arndb.de> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On Thursday 31 December 2015 16:31:02 Arnd Bergmann wrote:
> > On Thursday 24 December 2015 00:48:25 Roman Volkov wrote: =20
> > > =D0=92 Sat, 4 Apr 2015 15:27:20 +0300
> > > Roman Volkov <v1ron@v1ros.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >  =20
> > > > =D0=92 Sun, 1 Mar 2015 23:39:11 +0300
> > > > Roman Volkov <rvolkov@v1ros.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
> > > >  =20
> > > > > =D0=92 Sun, 01 Mar 2015 20:52:55 +0100
> > > > > Arnd Bergmann <arnd@arndb.de> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:=
 =20
> > > > > > > Any other suggestions?   =20
> > > > > >=20
> > > > > > According to the MAINTAINERS file, Tony Prisk should be the
> > > > > > person to pick them up, but he was not the recipient of the
> > > > > > mail.
> > > > > >=20
> > > > > >   Arnd   =20
> > > > >=20
> > > > > Thanks for the tip. Tony probably need to add these files to
> > > > > his list of maintained files. get_maintainer.pl doesn't
> > > > > mention him.
> > > > >=20
> > > > > Roman   =20
> > > >=20
> > > > Arnd,
> > > >=20
> > > > No response yet from Tony for over a month.
> > > >=20
> > > > Roman =20
> > >=20
> > > Ping. At least two patch sets for vt8500 are waiting to be picked
> > > up. vt8500 maintainer is inactive for over a year. =20
> >=20
> > I seem to have lost the original mails now, as it's been a while.
> > Can you send the entire series of patches to arm@kernel.org
> > please? =20
>=20
> To clarify, please first make sure they still apply cleanly on a
> recent kernel, then send them to arm@kernel.org with all the involved
> parties and the mailing list(s) in Cc.
>=20

Arnd,
These series are still applicable (for next-20151231). I resent both
SDHC and clocksource series, and got my emails returned with:

> <linux+armsoc@arm.linux.org.uk> (expanded from <arm@kernel.org>): hos=
t
>    mx0.arm.linux.org.uk[78.32.30.218] said: 550-We do not accept
> v1ron@mail.ru from mail.kernel.org - please use mail.ru's 550 mail
> servers (in reply to RCPT TO command)

Please confirm what you received and let me know if I must resend again=
=2E

Happy New Year,
Roman
