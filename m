From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 14:08:39 +0100
Message-ID: <20150320130838.GC7734@earth>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <80D7E742-4633-4CCD-B754-221387D82922@goldelico.com>
 <20150320194307.51cb4225@notabene.brown>
 <5A83DCE5-2CB4-48FF-80E7-6E6377045188@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5A83DCE5-2CB4-48FF-80E7-6E6377045188@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: NeilBrown <neilb@suse.de>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Belisko Marek <marek.belisko@gmail.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
List-Id: devicetree@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 20, 2015 at 09:54:21AM +0100, Dr. H. Nikolaus Schaller wrote:
> [...]
> And we do not write a driver for the w2sg0004 but the regulator inside th=
at
> chip.

DT describes the hardware structure and not the Linux driver
structure.

> You also won=E2=80=99t expect that the omap3 driver hides everything. You
> expect that the twl4030 provides some regulators that can be enabled
> by subsystems inside the omap3. And if I remember correctly there are
> regulators inside the omap3 which have explicit regulator nodes in the DT.

so let's have a look at twl regulators. They can be found below
the twl node, so they will look similar to

/ -> omap3 -> i2c -> twl -> regulator

So properly mapped to the w2sg0004 device this would put your
regulator to

/ -> omap3 -> serial -> w2sg0004 -> regulator

This will gain you nothing as far as I can tell.

Please note that subdevices under the serial node are pretty useful,
since then the kernel can e.g. automatically setup correct line
disciplines for serial attached bluetooth chips and make bluetooth
work out of the box.

I am aware, that the Linux kernel has no such thing for serial
attached GPS devices, but that's Linux specific and irrelevant
for the DT description.

> The w2sg0004-regulator approach just follows this principle.
> Anyone willing to control the power of the w2sg0004 can use this
> regulator interface.

=46rom a HW perspective your regulator "hides" the information, that
there is a device attached to the serial port and instead claims,
that a regulator is needed to make the serial port work.

Apart from that this interface is limited in its features. I'm
currently working on N900's bluetooth chip. This one needs to set a
gpio before data is sent data to the chip, has a reset gpio and
a gpio to wakeup the OMAP SoC from idle states to avoid data loss
on the UART.

-- Sebastian

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVDBvUAAoJENju1/PIO/qaHU4P/ApchsVfRUd8e/RKjoxWiTRR
bqyyRwbwpzhG7A8UxImeWJB04xYMXbseDxCxgLolOaDXRgY6xnBnOSwlAzRTChK8
gT82jKTXJlloRvom7K9GZ4J46rTch4KhIG1d5w3l1pdrfC6a5hW6eWLKR+nh+7Y1
pqk+DAbu/NRX1Zmzin/Ti7BTdelb3vPT90UYcmjhDW6uH5y4oTZxUMuu19y6PWIW
rYx8xO9TUUoLBh6SQRbfGx8hyXWK1YPeuYD6ATpbxpwPy8gvmvIFHX769TkF8o16
pJm3YBELB4N9LvKvozWwXPsfAPP5PyuzkNSOAqTRgxgm0b2sYavsy5uycI/o9gGz
ookC7nAlG3w/XZjX/bSOVR83R4XqT7KhxaVlOrbbhZB3Fvs0iJiOvPQVNAVpgLi0
xVlyceLpDi1HxyOD8kcmGXGA59DL3aCtBQYngXSsKplvE5CE82JVXO2f9qPQqb1p
JQ9/jhbF67rydkyR7ZnPl35RAagceYGNhxQt5K41r30p+pEcmCKRMK9nB5cxIy31
R64xSUEnIwV7q613qQiqfR5Q1Mgxd3KNZdgue66vD3DiHlh2yXY3BPVSFRZF6RQe
Rf/DPTjXnJk0s7T1OlDTg0ogQwzFbjIF7pty3P+P4197VNW3RqjAgEcuO/9rNUWO
Z7oNDu8C2o0sJucKp+0V
=Xeox
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
