From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Wed, 28 Aug 2013 13:13:20 +0100
Message-ID: <20130828121320.GK6617@n2100.arm.linux.org.uk>
References: <20130828113459.48ecbb34@armhf> <521DCD33.2070008@gmail.com> <20130828121943.1c8327ca@skate> <521DD057.4040208@gmail.com> <20130828131548.0009d613@skate> <521DE2B3.9050508@gmail.com> <20130828135827.2307c89e@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130828135827.2307c89e@skate>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2013 at 01:58:27PM +0200, Thomas Petazzoni wrote:
> Dear Sebastian Hesselbarth,
>=20
> On Wed, 28 Aug 2013 13:44:51 +0200, Sebastian Hesselbarth wrote:
>=20
> > > For 3.12, right? So 3.12 hasn't been released yet, so it's still =
time
> > > to fix this.
> >=20
> > I guess, yes.
>=20
> Jean-Fran=E7ois, could you cook and submit a patch to change the
> compatible string?

I don't think this is a good idea.  The configuration of this IP is
not based on the SoC as a single SoC can have a mixture of different
configurations.

I think marvell,mvebu-audio is a reasonable compatible string for this,
and that the different configurations should be described by properties
indicating which inputs and outputs have been implemented.

=46or instance, on the Dove, there are two of these blocks.  One has I2=
S
in and out only, but the other block has I2S in and out, and SPDIF out.
On some other Marvell devices, this block has I2S in and out and SPDIF
in and out.

Otherwise, they're functionally the same.

> Though, if the difference between the two units is the availability o=
f
> SPDIF support, then we shouldn't encode the channel number, but inste=
ad
> the availability of SPDIF, i.e:
>=20
> 	audio0 {
> 		reg =3D <... ...>;
> 		compatible =3D "marvell,kirkwood-audio";
> 		marvell,has-spdif;
> 	};
>=20
> 	audio1 {
> 		reg =3D <... ...>;
> 		compatible =3D "marvell,kirkwood-audio";
> 	};

=2E.. which means there's no problem with using marvell,mvebu-audio as =
the
compatible string if you're going to use properties to describe what
facilities are available.

In any case "marvell,has-spdif" is too generic - as I've indicated abov=
e,
there's versions with spdif out, and other versions with spdif in and
out.
