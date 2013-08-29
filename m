From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Thu, 29 Aug 2013 12:07:04 +0200
Message-ID: <20130829120704.410ad309@armhf>
References: <20130828113459.48ecbb34@armhf>
	<521DCD33.2070008@gmail.com>
	<20130828121943.1c8327ca@skate>
	<521DD057.4040208@gmail.com>
	<20130828131548.0009d613@skate>
	<521DE2B3.9050508@gmail.com>
	<20130828135827.2307c89e@skate>
	<521DEA20.8020103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <521DEA20.8020103@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2013 14:16:32 +0200
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

	[snip]
> > Though, if the difference between the two units is the availability=
 of
> > SPDIF support, then we shouldn't encode the channel number, but ins=
tead
> > the availability of SPDIF, i.e:
> >
> > 	audio0 {
> > 		reg =3D <... ...>;
> > 		compatible =3D "marvell,kirkwood-audio";
> > 		marvell,has-spdif; =20
>=20
> Agree, if you make it "marvell,has-spdif-in" and "marvell,has-spdif-o=
ut"
> Dove has either i2s-only or i2s+spdifo, kirkwood has i2s+spdifo+spdif=
i
> for the one audio controller available. Can't tell for Armada 370.
>=20
> BTW, you might have followed some of the DT discussions with Mark
> before; as he insists on having a separate sound card node, he might
> argue that above property should be part of that node instead.

Yes. For the Cubox, the card will be described by something like:

	sound {
		compatible =3D "simple-audio";
		audio-controller =3D <&audio1>;
		audio-codec =3D <&spdif>;
		codec-dai-name =3D "dit-hifi";
	};

with:

	spdif: spdif {
 		compatible =3D "linux,spdif-dit";
	};

Then, the audio driver will know about s/pdif on the first open.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
