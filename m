From: Roman Volkov <v1ron@mail.ru>
Subject: Re: [PATCH v3 RESEND 0/2] WM8505/WM8650 DT fixes for SD card
 controller
Date: Sat, 2 Jan 2016 12:12:39 +0300
Message-ID: <20160102121239.01b64a0c@v1ron-s7>
References: <1451655492-2569-1-git-send-email-v1ron@mail.ru>
	<7786478.TezhYjHkEF@wuerfel>
	<20160101203230.1dc5e655@v1ron-s7>
	<9863929.DgKyDlgJ1e@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9863929.DgKyDlgJ1e@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, linux+armsoc@arm.linux.org.uk, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Alexey Charkov <alchark@gmail.com>, Roman Volkov <rvolkov@v1ros.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

=D0=92 Fri, 01 Jan 2016 22:53:33 +0100
Arnd Bergmann <arnd@arndb.de> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On Friday 01 January 2016 20:32:30 Roman Volkov wrote:
> > > Applied both to next/dt, thanks a lot for following up!
> > >=20
> > > Let me know if you think this should go into stable backports as
> > > well, I did not apply it to the fixes branch as you don't have a
> > > 'Cc: stable@vger.kernel.org' tag and it has never worked so far. =
=20
> >=20
> > Yes, this must go into the stable too. Let me know if I must change
> > something or resend. =20
>=20
> I can put them in the fixes branch with the appropriate stable
> tag myself, but please clarify whether we need just the first or
> both patches there. It looks to me that the second one while
> correct only addresses a cosmetic problem and everything works
> without it.

Correct, everything works without the second one. One of reviewers
noticed that addresses are different between WM8505 and WM8650 where
the hardware is the same. If such trivial changes are not accepted,
please do not apply.

Happy New Year,
Roman
