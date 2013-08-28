From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Wed, 28 Aug 2013 14:29:09 +0200
Message-ID: <20130828142909.3521064b@skate>
References: <20130828113459.48ecbb34@armhf>
	<521DCD33.2070008@gmail.com>
	<20130828121943.1c8327ca@skate>
	<521DD057.4040208@gmail.com>
	<20130828131548.0009d613@skate>
	<521DE2B3.9050508@gmail.com>
	<20130828135827.2307c89e@skate>
	<20130828121320.GK6617@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828121320.GK6617@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Dear Russell King - ARM Linux,

On Wed, 28 Aug 2013 13:13:20 +0100, Russell King - ARM Linux wrote:

> > > I guess, yes.
> >=20
> > Jean-Fran=C3=A7ois, could you cook and submit a patch to change the
> > compatible string?
>=20
> I don't think this is a good idea.  The configuration of this IP is
> not based on the SoC as a single SoC can have a mixture of different
> configurations.

Using the name of the oldest SoC in the family that had the IP block is
the norm, because it's really what "compatible" means: the IP block in
Dove is *compatible* with the one that was originally introduced in
Kirkwood.

See what Rob Herring (one of the DT maintainer) says in
http://lists.infradead.org/pipermail/linux-mtd/2012-March/040417.html:

"""
There is no reason all machines can't use "st,spear600-smi" in their
dts. It doesn't have to be a spear600, just compatible with it. Really
you want the string to be the oldest SOC the block is in and then newer
SOCs can claim compatibility with the old version.
"""

The thread was precisely about replacing a SoC-specific compatible
string "st,spear600-smi" by a more generic "st,spear-smi" and Rob
Herring (above) was opposing to that.

> I think marvell,mvebu-audio is a reasonable compatible string for thi=
s,
> and that the different configurations should be described by properti=
es
> indicating which inputs and outputs have been implemented.
>=20
> For instance, on the Dove, there are two of these blocks.  One has I2=
S
> in and out only, but the other block has I2S in and out, and SPDIF ou=
t.
> On some other Marvell devices, this block has I2S in and out and SPDI=
=46
> in and out.
>=20
> Otherwise, they're functionally the same.

Right, that's why they can both use "kirkwood-audio" as the compatible
string.

> > Though, if the difference between the two units is the availability=
 of
> > SPDIF support, then we shouldn't encode the channel number, but ins=
tead
> > the availability of SPDIF, i.e:
> >=20
> > 	audio0 {
> > 		reg =3D <... ...>;
> > 		compatible =3D "marvell,kirkwood-audio";
> > 		marvell,has-spdif;
> > 	};
> >=20
> > 	audio1 {
> > 		reg =3D <... ...>;
> > 		compatible =3D "marvell,kirkwood-audio";
> > 	};
>=20
> ... which means there's no problem with using marvell,mvebu-audio as =
the
> compatible string if you're going to use properties to describe what
> facilities are available.

I disagree, because how do you know if a future "mvebu" SOC such as
Armada 370, or one that doesn't exist yet, will not have a different
audio IP block? It will still be audio, it will still be mvebu, but it
will not be able to use a "marvell,mvebu-audio" driver. Or maybe it can
use the same driver, but with a few variations, so a different
compatible string will be needed to identify the original IP
("marvell,kirkwood-audio", used on Kirkwood/Dove) and slightly newer
versions of the IP ("marvell,some-funky-soc-audio").

> In any case "marvell,has-spdif" is too generic - as I've indicated ab=
ove,
> there's versions with spdif out, and other versions with spdif in and
> out.

Right, the above was just an example to illustrate that we can have
additional properties to encode the differences between each instance
of the audio devices.

=46or example, for XOR engines, we have:

                        xor@60900 {
                                compatible =3D "marvell,orion-xor";
                                reg =3D <0x60900 0x100
                                       0x60b00 0x100>;
                                clocks =3D <&gateclk 22>;
                                status =3D "okay";

                                xor10 {
                                        interrupts =3D <51>;
                                        dmacap,memcpy;
                                        dmacap,xor;
                                };
                                xor11 {
                                        interrupts =3D <52>;
                                        dmacap,memcpy;
                                        dmacap,xor;
                                        dmacap,memset;
                                };
                        };

because the first channel of each XOR engine has only memcpy and xor
capabilities, while the second channel has memcpy, xor and memset
capabilities.

Thanks,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
