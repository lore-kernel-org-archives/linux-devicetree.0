From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 12:53:37 +0100
Message-ID: <20160428115337.GN3217@sirena.org.uk>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
 <1461801489-16254-2-git-send-email-sdharia@codeaurora.org>
 <2692115.H6acsZmTjn@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="idCnhAV0S4n5U/Zz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2692115.H6acsZmTjn@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sagar Dharia <sdharia@codeaurora.org>, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--idCnhAV0S4n5U/Zz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2016 at 12:00:26PM +0200, Arnd Bergmann wrote:
> On Wednesday 27 April 2016 17:58:04 Sagar Dharia wrote:

> > +int slim_add_device(struct slim_controller *ctrl, struct slim_device *sbdev)

> This looks like an artifact of ancient pre-DT times. I'd say kill it off before
> someone starts using it.

Not every architecture uses DT, and even on architectures with DT
support it isn't always the only firmware.  In this specific case it's
questionable how many people are going to implement Slimbus at this
point but in general insisting that we go DT only doesn't seem great.

--idCnhAV0S4n5U/Zz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIfm/AAoJECTWi3JdVIfQ2xwH/RU4fceV7llxqkWBdwp+VnsC
xcmChWPwsYP3/vGi9pqCLp25b8CE3qF0AER/BguF1yDUGdbre1KuwG2flPezAjQf
knOUPgJIyRd4HGX/AT3cbmAhNg4pkqgzaDgfcEpMx+/7DuPgj5zR2XJ8AZGeCnyG
1KE4xcGtbKKvV5cbaI8yi4BOEnv1vIvrBG9vl5Z0eQbvRT4P5zfyDZWyJaFWVd+z
IxN0vdyAGojohkU2l6l4LW9FsAdRlTKvSeaN4l97/RYE4U0LkxL0x0qcJ3PDO6Dh
mCOJo7Owe3mciJsZiX/LdzLnuDuLxy+PqPVYbn+BRHONZ0Z0cyS531JymzWRErw=
=YeW9
-----END PGP SIGNATURE-----

--idCnhAV0S4n5U/Zz--
