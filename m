From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 3/3] regulator: bd718x7: Support SNVS low power
 state
Date: Tue, 12 Feb 2019 16:08:31 +0000
Message-ID: <20190212160831.GF20635@sirena.org.uk>
References: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
 <06c2f2f730b07caeb1f2fb86be60c02b21d7bea9.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <06c2f2f730b07caeb1f2fb86be60c02b21d7bea9.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2019 at 04:19:38PM +0200, Matti Vaittinen wrote:
> read ROHM BD71837 / BD71847 specific device tree bindings for
> controlling the PMIC shutdown/reset states and voltages for
> different HW states. The PMIC was designed to be used with NXP
> i.MX8 SoC and it supports SNVS low power state which seems to
> be typical for NXP i.MX SoCs. However, when SNVS is used we must
> not allow SW to control enabling/disabling those regulators which
> are crucial for system to boot as there is a HW limitation which
> causes SW controlled regulators to be kept shut down after SNVS
> reset.
>=20
> Allow setting the SNVS to be used as reset target state and allow
> marking those regulators which are critical for boot.

The general idea seems fine but I'm wondering if we should use the
existing bindings and just prevent any change with fixed configurations
- that *should* just be a case of picking appropriate constraints I
think.  Why does this need completely new properties other than
preventing the user from shooting themselves in the foot?

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxi734ACgkQJNaLcl1U
h9BE0wf+IsU3kjTSY5iiT3YXDg+KundiTwhux+oTM9c75jAnup5dtcw/KsU3HNCy
eomCAcL6wQQNqAque3hAuDPATOIiecZCru1zun0BMRypT5/LLwUZGgu/rSRRPR0M
/RaZcIM07939e4T453bJNR0iutqKAwsHWxto02PhO3Wf5AfzlWnlUQiV+lv9VOsH
P/SovBL/8lDwZTr/hOQDBQf7q3ax/fbt0Vvxvk7pLoHUEzHtABUx1/ab+2pKpaaq
7yqPtGPWia0HPuryC70Pi3fF+/hW2VmEa7ZqPEjIqQQ8OxgRsX2UeW1d1kxeU7Fd
ahsE765BWOzkmUvNaJxlCnu4TA+QiA==
=KLTb
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
