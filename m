From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 17:39:20 +0100
Message-ID: <20160428163919.GP3217@sirena.org.uk>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <7478716.z4vdp0mVTA@wuerfel>
 <20160428143801.GO3217@sirena.org.uk>
 <5047442.UXEhPc2Isi@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G2OYmj9cSczDaGGa"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5047442.UXEhPc2Isi@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sagar Dharia <sdharia@codeaurora.org>, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--G2OYmj9cSczDaGGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2016 at 04:59:02PM +0200, Arnd Bergmann wrote:

> My comment this time was for the particular driver, but I'd
> still also maintain that a new subsystem in general should not
> start out by addressing the needs of traditional board files.

I certainly wouldn't insist that people add it but equally pushing to
remove it too strongly seems like the wrong thing, at least as a general
comment rather than a specific one.

> I don't think we have merge new platform support on any
> architecture that would need this in the past years and
> stuff like spi_board_info and i2c_board_info is only really
> used on really old machines (but not going away any time soon
> either).

It's not just platforms that use these things though - there's things
like the SolarFlare NICs where the firmware update mechanism essentially
involves exposing a SPI flash as part of a PCI device and we just merged
an ASoC driver for a video card which was reusing some existing IPs and
chips.

--G2OYmj9cSczDaGGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIjy2AAoJECTWi3JdVIfQpX0H/2/k7KR977h4R+3jQpwnFVa/
b7gzMID4BqGqc9kU4yW4K7Q7JSMnDn1XEi20Nz5W7qisuDYCRUUgql3pTBuNJswE
deV0Srlclz/3G1aSIb7XvKlNb4eG819RQ2dfZqpjiQJbYHE9K0ZiL+A3EED/vigm
JwTEqr4vQz7dwkuVLbLGTz/A7AxSsQivNTbpbdjaGBEfPuuFzu/neyjHJB0YDQaP
ZClj73ghlTST8G5ZiaNJR36ZVG1JVG/vlwR0FM1hSLe281I/fpVt4RdWmg59KSFC
kPX4fwctZmv2d85me+v9ojCQrbRjpNHwDbucCMHJXUvs+utnH4nr6FAlhiYNxf0=
=Dzq9
-----END PGP SIGNATURE-----

--G2OYmj9cSczDaGGa--
