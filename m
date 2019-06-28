From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] regulator: add support for the stm32-booster
Date: Fri, 28 Jun 2019 15:32:29 +0100
Message-ID: <20190628143229.GI5379@sirena.org.uk>
References: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
 <1561709289-11174-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561709289-11174-3-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 10:08:07AM +0200, Fabrice Gasnier wrote:
> Add support for the 3.3V booster regulator embedded in stm32h7 and stm32m=
p1
> devices, that can be used to supply ADC analog input switches.
>=20
> This regulator is supplied by vdda. It's controlled by using SYSCFG:
> - STM32H7 has a unique register to set/clear the booster enable bit
> - STM32MP1 has separate set and clear registers to configure it.

This doesn't apply against current code, please check and resend.

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0WJPwACgkQJNaLcl1U
h9CEYwf/S479W8LgrEaeHTTFG3CzS+H7XcqwsFf6ZMmLHg4A/fZD3UOrWsupb7XW
5Pn1ugPul+BpUs3M6dew3VdsiqOt/JWl3QC0KPKetya58X+NKnGTtnv+F17u5WyL
pv5f6/FzM3/rN6AhpDN3pbRxUbMj87J3dxVDS/rNh6IYiTjrkIvkXIWO1oiN84aD
KjarUQFfuqKmKDGsCvkzysX+e7npMdAyqntAdYJqtBVsUHPWDPygEfgedZlFjFUa
ktNcysf3sDZpFdDiqzCgLYA52R2rWjJGQbZN9TlMx5iK45iLVjGjTbf11arVCcUw
HT/WrvMzxZT3GvZsaV/sSCOpY7di8A==
=l6Rr
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
