From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 17:17:31 +0000
Message-ID: <20141027171731.GY18557@sirena.org.uk>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com>
 <1414108267-22058-3-git-send-email-atull@opensource.altera.com>
 <CCE2D027-AA89-41C4-B9AA-2B92AA62129B@konsulko.com>
 <20141027150147.GX18557@sirena.org.uk>
 <31BBCD26-65E2-431A-9ADF-95D7EDC7E34E@konsulko.com>
 <20141027153205.GW10262@pengutronix.de>
 <1C42AF5D-4776-4B09-BDF4-24F001439F46@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YBGzgpgHAney5ErF"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1C42AF5D-4776-4B09-BDF4-24F001439F46@konsulko.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Pavel Machek <pavel@denx.de>, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, mgerlach@opensource.altera.com, Alan Tull <delicious.quinoa@gmail.com>, dinguye
List-Id: devicetree@vger.kernel.org


--YBGzgpgHAney5ErF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 05:45:03PM +0200, Pantelis Antoniou wrote:

Please fix your mail client to word wrap at less than 80 columns.

> Well, it=E2=80=99s not my speciality, but my understanding is that FPGAs =
take (considerable)
> time to be programmed. If someone has already configured the =E2=80=98bus=
=E2=80=99 it is considered
> a win to not reload the bitstream. I.e. if you boot with the bootloader h=
aving loaded
> the bitstream already, you don=E2=80=99t want to do it again.

That's not what your property is saying, though - if it were just about
handover between the bootloader and the kernel that'd be one thing but
it's also got this additional possibility to instruct the kernel that
the device must be either disabled or explicitly programmed.  Having a
property that just says "this FPGA is programmed" covers the handover
case but this property does more than that.

--YBGzgpgHAney5ErF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUTn4qAAoJECTWi3JdVIfQ63kH/2i8gFq/EKKOgHea8XOh+ss7
nDfdO8UPUkA4Szj588ABrsmG6Vg0cgNJMX+oFKVWjiY+RkC3j1WBS/VNTN1cfG5W
FnnTQKxAr15rW0PTnkO+pWNaB+PDaLv0m+WgDyUFzVUDhg0aOjwtBXlW93SAw+E7
9t0Xnc+RxoBZhJLLVa1iF/mqfwyNc09Q4QHFeMwa4o8WoOGVlAYfSYIVND/94wZw
h2/JzF7dft5mU1YaxD63eE+lHIkP+pEV7CcV2XMcsQaM64PYTjwQM7h90Fx2R33h
T0YCG4cOYtFXTPHiiOS1Ykg4/Uc0Tyz2F6hui0DXgBoYYsCs1y8bXY9hq9k9fik=
=m35G
-----END PGP SIGNATURE-----

--YBGzgpgHAney5ErF--
