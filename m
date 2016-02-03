From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device
 tree
Date: Wed, 03 Feb 2016 17:32:20 +0100
Message-ID: <1454517140.25750.16.camel@v3.sk>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
	 <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
	 <56B226A2.6000101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56B226A2.6000101@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Peter Chen <peter.chen@freescale.com>, Arnd Bergmann <arnd@arndb.de>, popcornmix <popcornmix@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-03 at 09:11 -0700, Stephen Warren wrote:
> On 02/03/2016 08:02 AM, Lubomir Rintel wrote:
> > The hub and the ethernet in its port 1 are hardwired on the board.
> >=20
> > Compared to the adapters that can be plugged into the USB ports,
> > this
> > one has no serial EEPROM to store its MAC. Nevertheless, the
> > Raspberry Pi
> > has the MAC address for this adapter in its ROM, accessible from
> > its
> > firmware.
> >=20
> > U-Boot can read out the address and set the local-mac-address
> > property of the
> > node with "ethernet" alias. Let's add the node so that U-Boot can
> > do its
> > business.
>=20
> Good to see we're getting a standard for this.
>=20
> Have you talked to the RPi Foundation about updating their binary=C2=A0
> bootloader to follow this protocol?

Not really. Adding Dom Cobley to the Cc list now.

They seem to be passing the MAC address on command line now and even
evaluating it before attempting a read out from the EEPROM. That sounds
like it would break if someone plugged another smsc95xx adapter into
one of the USB ports.

> I'll certainly ack changes to make=C2=A0
> this work for U-Boot, provided the USB core patch this relies upon
> is=C2=A0
> accepted.

Dom, if the changes mentioned in [1] get merged, you may want to add
the Ethernet device to your device trees too and drop the cmdline hack.

[1]=C2=A0http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-Feb=
ruary/003207.html

>=20
> > diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
>=20
> > +&usb {
> > +	usb1@01 {
> > +		compatible =3D "usb1d6b,0002";
> > +		reg =3D <01>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		ethernet: usbether@01 {
> > +			compatible =3D "usb0424,9514";
> > +			reg =3D <01>;
>=20
> Ib both unit addresses and both reg properties, I would expect "1"
> not=C2=A0
> "01" since there's usually no leading 0 fill for those.

Okay, will fix.

> I'm curious why the VID values for the hub and Ethernet device don't=C2=
=A0
> match since those are part of the same combo chip. Is there a typo=C2=
=A0
> there, or did SMSC really do something odd in HW?

Hm, I think I just did a sysfs walk to see how things are connected.
The ethernet USB id is certainly wrong though.

The 1d6d:2 id is of the root hub. There I either messed up the commit
message or the topology. I can't recheck now, but I'll give it another
look before I send and updated version.

Thanks,
Lubo
