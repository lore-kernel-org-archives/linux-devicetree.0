From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Thu, 5 Jan 2017 18:14:27 +0100
Message-ID: <20170105171427.v4vosv7mfv3zveyz@lukather>
References: <20161227102807.20244-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5731612938212450627=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161227102807.20244-1-manu@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5731612938212450627==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="okkzjswunm727sc6"
Content-Disposition: inline


--okkzjswunm727sc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2016 at 11:28:07AM +0100, Emmanuel Vadot wrote:
> The spi0 controller on the A20 have up to 4 CS (Chip Select) while the
> others three only have 1.
> Add the num-cs property to each node.
> The current driver doesn't read this property but this is useful for
> downstream user of DTS (FreeBSD for example).
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--okkzjswunm727sc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbn7zAAoJEBx+YmzsjxAghAQP/2RmVhmy6xBEx5QA1cJukGTF
SMxTXAHc/1VZaPughhzTA8aesz0N94lKaW2KQ6RDggF5p09FlWG+sQe1O4ToNrGn
FV4XVdh12TsX7ocnFmetXpavBcabCsQRxsiPMpp+cznD78TlJyQ+j2uWBtjrxYow
KKlyXWLFtW8XXT6bhjumSvB3NynN4eA3Ps3RKZAjPWsgT3Cx+HV49NGospjnd05a
MIah4WwShw9+jhW8ti1M1PYFS4haMyedZzn+Uq+pewOyx3AmtpO7Fme6ryPrr+Nw
uPB4hEhi4v7JtinXz8rroGWp9hU7UoPLTw3WEJnBsCU0HSMk4AolOQX5uml7LLyr
DE83rG1SLGRn0Rhgx0MfG+TkI8EMm7LFKOSinKBkN5nv2k8DByctn89lDioUkTnE
UP+/bmr5zsLb+l9wPwFRl7msbpaB0NCO4GYY2VfAKIfzkTajo8UTC7zF4DdRoPt8
9KEro8tMK/eAu5xia3oupRg2fRoHOXziW68ZCWDb6qDKy7WVA3gYTnqwHef0rRQA
yM0j9Bu3r2cUt0r07gh4vcP9jlzFX7QwzmxqiwyXGyfWx9VaAk2C895iLFYer1Ng
sXyJb5Ky6gTTIaj6XOv9lhQC2k+7wcGX+ZEDrVeKzB/Wj2IsNm1/eFku6FytPkel
4oSij6HGMn+csriRGMff
=vIza
-----END PGP SIGNATURE-----

--okkzjswunm727sc6--


--===============5731612938212450627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5731612938212450627==--
