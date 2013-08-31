From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Sat, 31 Aug 2013 13:55:19 +0200
Message-ID: <20130831135519.6ab0e163@armhf>
References: <20130828113521.35c53365@armhf>
	<521DCD80.9010105@gmail.com>
	<20130831125128.0e3a23c7@armhf>
	<20130831112430.GD6617@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130831112430.GD6617@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 31 Aug 2013 12:24:31 +0100
Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:

> > According to the Dove specification, the audio controller works wit=
h
> > the samples rates 44.1, 48 and 96 kHz, so, I don't see the usage of=
 the
> > external clock, except when using the two audio controllers with
> > different sample rates.
	[snip]
> > But, BTW, as the kirkwood-i2 driver is written, this last case does=
 not
> > work: for 44.1, 48 and 96 kHz, the external clock is never used and
> > there is only one DCO. =20
>=20
> This doesn't make sense.  "this last case" - what "case" are you refe=
rring
> to?  "there is only one DCO" ?  Yes, there is only one DCO, what is i=
ts
> relevance to the statement you're making?  And yes, in mainline we
> currently use the DCO for the standard 44.1, 48 and 96kHz sample rate=
s.
> That's fine.  Confused.

Sorry, it was clear in my head :)

The last case was "when using the two audio controllers with different
sample rates" (I should have added "in the set [44.1, 48, 96 kHz]").
Then, with or without the availability of external clocks, both
controllers will set the unique DCO to two different rates.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
