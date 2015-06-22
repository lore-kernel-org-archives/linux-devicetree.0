From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [PATCH v4 12/12] MIPS: Add basic support for the TL-WR1043ND
 version 1
Date: Mon, 22 Jun 2015 18:01:23 +0300
Message-ID: <20150622180123.f171a1985eb3c984465144f8@gmail.com>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
	<1433031506-7984-5-git-send-email-albeu@free.fr>
	<20150608131758.9d76be074998ea3de0e976a4@gmail.com>
	<20150610235811.0b18af9b@tock>
	<20150615104213.92258d2d0616c12e4aa7bf1a@gmail.com>
	<20150620125137.2020a855@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150620125137.2020a855@tock>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 20 Jun 2015 12:51:37 +0200
Alban <albeu@free.fr> wrote:

> On Mon, 15 Jun 2015 10:42:13 +0300
> Antony Pavlov <antonynpavlov@gmail.com> wrote:
>=20
> > On Wed, 10 Jun 2015 23:58:11 +0200
> > Alban <albeu@free.fr> wrote:
> >=20
> > > On Mon, 8 Jun 2015 13:17:58 +0300
> > > Antony Pavlov <antonynpavlov@gmail.com> wrote:
> > >=20
> > > > IMHO AR9132 SoC can't work without external oscilator.
> > > >=20
> > > > Can we just move basic extosc declaration to SoC dt file
> > > > (ar9132.dtsi)? So board dt file ar9132_tl_wr1043nd_v1.dts will
> > > > contain only oscilator clock frequency value.
> > >=20
> > > I would prefer to keep the split between the files in sync with t=
he
> > > hardware. I understand that most simple board designs use a fixed
> > > oscillator, but that might not always be the case.
> > >=20
> >=20
> > The AR9132 SoC __always__ use one external oscilator.
>=20
> Yes, but what I don't like is to impose the clock source being a
> fixed-oscillator. What if the board use a clock from another
> component that need to be represented in the DT as something else
> than a fixed-oscillator?

The absolute majority of the ar9132-based boards has fixed-oscillator
(Actually I suppose all of them has fixed oscillator).

If some board has different clock source then we can completely alter
extosc node in the board dts file. (But I have some doubts in existence
of such board.)

--=A0
Best regards,
=A0 Antony Pavlov
