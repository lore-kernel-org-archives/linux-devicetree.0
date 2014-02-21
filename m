From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH RFC] usb: gadget: Add xilinx axi usb2 device support
Date: Fri, 21 Feb 2014 15:06:05 +0100
Message-ID: <53075D4D.1090600@monstr.eu>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local> <20140220182257.GF23217@saruman.home> <20140221120454.GD8783@e106331-lin.cambridge.arm.com> <5307576F.5050506@monstr.eu> <20140221135713.GB20449@e106331-lin.cambridge.arm.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="CbjoqpOOPcFLVwkBmqR8WBH6MPTMkcXlN"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140221135713.GB20449@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Felipe Balbi <balbi@ti.com>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CbjoqpOOPcFLVwkBmqR8WBH6MPTMkcXlN
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>> If we can point to standard interrupt description then please point me=
 to
>> exact description you would like to see here and we can change it.
>=20
> Unfortunately I'm not aware of a generic interrupts document. I just
> don't see the point in each document listing interrupt-parent as a
> requiredp roeprty when it's not. That said this is a trivial detail and=

> not really a blocker.

I agree with you that copying this part again and again is just problemat=
ic.
Time to time I see that IRQs doesn't need to be described too.

I am also not sure if kernel can work without interrupt-parent at all.
I expect that it won't work and because we have interrupt parent in every=

node (which is generated) it is probably required in our setup.

As you said it is just trivial detail for me too.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--CbjoqpOOPcFLVwkBmqR8WBH6MPTMkcXlN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlMHXU0ACgkQykllyylKDCEMmwCdE/CIJmrj0m8iKa00Jbx1tZg0
baIAn1bkwI6GSQtk98aB70blb4+1wezR
=sQB7
-----END PGP SIGNATURE-----

--CbjoqpOOPcFLVwkBmqR8WBH6MPTMkcXlN--
