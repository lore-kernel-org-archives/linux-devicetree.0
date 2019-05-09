Return-Path: <SRS0=2BPc=TJ=anholt.net=eric@kernel.org>
From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] ARM: bcm283x: Enable DMA support for SPI controller
In-Reply-To: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
References: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
Date: Thu, 09 May 2019 10:25:27 -0700
Message-ID: <87zhnv35h4.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
To: Lukas Wunner <lukas@wunner.de>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Martin Sperl <kernel@martin.sperl.org>, Noralf Tronnes <noralf@tronnes.org>, linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Lukas Wunner <lukas@wunner.de> writes:

> Without this, the driver for the BCM2835 SPI controller uses interrupt
> mode instead of DMA mode, incurring a significant performance penalty.
> The Foundation's device tree has had these attributes for years, but for
> some reason they were never upstreamed.
>
> They were originally contributed by Noralf Tr=C3=B8nnes and Martin Sperl:
> https://github.com/raspberrypi/linux/commit/25f3e064afc8
> https://github.com/raspberrypi/linux/commit/e0edb52b47e6
>
> The DREQ numbers 6 and 7 are documented in section 4.2.1.3 of:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.p=
df
>
> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzUYocACgkQtdYpNtH8
nuisSQ/9F3xsTI4/P6Gv97jjfvxzNJ5xNdrxauZLWJldZh8RC0MSP1sq7NqlE3AG
pxvuVLVVv8rqt/6sJtTz8Hat0kPWG9gf17dg9WnrutUXv/ovk5Cr9OBpCIhXieTU
5RWVxQgxMe+dDrbOTuh3L9vVD18Yd+qKnsgINJ5vei4biYGLBVxTpeGUBhIrTKwU
A224+8KNqHLmFHMEtd9GmjWIrbhrcJH3tU8vCRQvWcO8uihvN2beJ5V3JjsqNEuG
V8FLOAkzT3Epxuh+irGHcMMFCvLXtPi6wl5WYTZfyAB8zPnNNuoo3OpNAZEfeHtY
rimyjeJZY/YxGXlDvJxRAnaDS7McfxQ4zsO6tVsPKdSNZMHreMr4eAyzaAzqm4kC
LFY3HFrY0cm6/aMBQmJSi7oZgaGLKTlmWAIwCh1XxRlN6GocNnjw1857Fol7VP3z
0URKyKGao7oyODfi2xAJFlnmPmY5OLDaURasO6XZqWwAVFN7IyeUHank0xxKrkC+
xD7ED3oPDWigpfaVCL/yAIj9W6KiwZFGQW2fwZSIerisU17ZjSg5r4vnBf2q4wT+
oLY4Xa5Gx0gYjnZvovl4o1Fb0msNF/gtt1MHt0O3Krq/XPgekWC9nkBvzNJdeBIK
LsweHQA+/4DHnDL/zbkoqlrvx4d+x8UH57Gy2WmHmBOP85xtNaU=
=6g+P
-----END PGP SIGNATURE-----
--=-=-=--
