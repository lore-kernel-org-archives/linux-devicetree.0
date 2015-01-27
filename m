From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 4/5] regulators: axp20x: Change dcdc-workmode DT
 property to boolean flag
Date: Tue, 27 Jan 2015 12:27:14 +0000
Message-ID: <20150127122714.GT21293@sirena.org.uk>
References: <1421941147-9682-1-git-send-email-wens@csie.org>
 <1421941147-9682-5-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7iCko5qf//nELnG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421941147-9682-5-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--j7iCko5qf//nELnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2015 at 11:39:06PM +0800, Chen-Yu Tsai wrote:
> The "x-powers,dcdc-workmode" property only has 2 values. A request was
> made to change this to a boolean flag named "x-powers,dcdc-workmode-pwm".
> Given that this particular binding hasn't been used anywhere, it should
> be safe to change.
>=20
> Previously the absence of the property meant just keeping the PMIC in
> whatever state was set by the bootloader. After this change, the absence
> means using the "auto" (PWM/PFM hybrid) mode, which is also the hardware's
> default.
>=20
> This patch also makes axp20x_set_dcdc_workmode() ignore attempts to set
> the workmode for non-DCDC regulators.

Again I don't understand what this is supposed to accomplish, this seems
to just make the binding less capable by forcing Linux to make a
decision on the configuration rather than allowing it to use the
hardware defaults untouched.  This runs contrary to our normal approach
to regulaors which is to try to avoid touching the hardware unless
explicit configuration is provided to say it's OK which in turn is there
because getting regulators wrong can be such a bad thing for the system.

--j7iCko5qf//nELnG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUx4QiAAoJECTWi3JdVIfQpZAH/2EqyRP8DHx0DNMviHR0ZsES
ipcwI1KczZ9MiUXcS/HbJA7BRUTKkc/NTvou1jwxVHoStOIg3yMWOAzqUk9Bwghe
GiAphYP+TzjCTuF8PjJ+7sBIINxuLX9yZSShIj0C6+7P25X36RSgTzRsu8nhzn+O
DEofS1oDTzM0CGYtCCKpgx79+rqrBqmgfRsiDpveHFqyo3BOwKzyEfr0u8wCwQ+Y
kpQPy7jGni9BSGcKfWnKkd81nAcABUk6CXlkolXcTc/Eb6TXbazKx+2PEY+jIhue
bgvxMhSXQNx4bvnAVc33ayYO65Wmj3rFRpjZRjOTDupXhgRPgmYnqIcRxrIDQtE=
=T6JZ
-----END PGP SIGNATURE-----

--j7iCko5qf//nELnG--
