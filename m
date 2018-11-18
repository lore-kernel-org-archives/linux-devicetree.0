Return-Path: <SRS0=sbJT=N5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sauhun.de ([88.99.104.3]:39712 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbeKSHtp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 19 Nov 2018 02:49:45 -0500
Date: Sun, 18 Nov 2018 22:28:18 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC] C64 DTS
Message-ID: <20181118212818.GA1013@kunai>
References: <20181118163909.9202-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20181118163909.9202-1-geert@linux-m68k.org>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Matt Porter <mporter@konsulko.com>
List-ID: <devicetree@vger.kernel.org>


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> 		cpu: cpu {
> 			device_type =3D "cpu";
> 			compatible =3D "cbm,6510", "mos,6502";

I don't think mos,6502 will work. You will lose the data port at $00/$01
and can't configure memory then.

> 			clock-frequency =3D <985000>;

Can't this be derived from some other clock?

> 	sid: sound@d400 {
> 		reg =3D <0xd400 0x400>;
> 		compatible =3D "cbm,6581", "cbm,sid";
> 	};

Actually, this file should be a DTSI and VIC, SID, and CIA would need to
be defined in the DTS file. Different C64 models have different versions
of these chips.

> 	iec {
> 		compatible =3D "cbm,c64-iec-bus";
>=20
> 		cbm,atn-gpios =3D <&cia2 3 GPIO_ACTIVE_LOW>;
> 		cbm,clock-out-gpios =3D <&cia2 4 GPIO_ACTIVE_LOW>;
> 		cbm,data-out-gpios =3D <&cia2 5 GPIO_ACTIVE_LOW>;
> 		cbm,clock-in-gpios =3D <&cia2 6 GPIO_ACTIVE_LOW>;
> 		cbm,data-in-gpios =3D <&cia2 7 GPIO_ACTIVE_LOW>;
> 	};

The user port has lots of GPIOs, too :D And the tape port...

And you found out that CIA2 uses NMI already. I spotted that, too.

Geez, since when do I have too much time ;)

Happy hacking,

   Wolfram

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx2W4ACgkQFA3kzBSg
Kbbo6A//XAhlXwszLKqT73NSwHremd3Qc5DHzQFSb9EJ+iJIaJPRygkhsJp2bwXC
9xXuYXrKqYeIc/CKHVWFsyqtGjCxzAS0GAn6LoviO0+lpGhZYCE10YroFpE7Vfl/
jPD8RJ/oOXiEqtAdcwVeh4hIvF1pQhp9kZIGzdMw+yUf5dFUB5rxdZN1ePhxGo+1
HauN/DiADDlDnSMonf4BW91J83lpaxMWOoDlC9IUfqbp3W2AW9tUbxZnbaCRfRWF
0BcKpRk8/a/ftytef77ga8X2qkZ4OcMDKZYemrPHWBMIjVq+fqbyBbXp+4pOm/Ky
NtV20HyxGg98dFGCA4cDxxVVZRwuMXskcGaVSdzjCI0+92k0Ux0pNgW0EjYHyQsv
mcKdxmp7Rho0LlRfSOjB66KA8f5zrhcOm4B7R3f1Jn2TA93KFhNkYCoH3PtMF5LF
Tm4nYBrrUU18+hMNhAttE9KkI4em0uI11nEGDQnkyXUw4BpFgCOyWAq7LtMqKx5i
jdw1xZXYrDugUy1x5U4Vi6s7Jxnqc13pVYmGhksCT5eSVXYS2vVEiyCxfrqiQv1d
7J5akAh+MdkmrcXHd9qcaT+oHXHd575SSoJEyd2MnOSDxiKZZNVCHFlV9ODAJu2S
DZGo+ZRCr5kVI1ubsOgYnDKellaNNBXm6IOwfxmWcFq1fnstJEQ=
=SL/O
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
