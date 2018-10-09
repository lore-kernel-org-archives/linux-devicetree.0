From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: add backlight regulator for
 Pinebook
Date: Tue, 9 Oct 2018 17:10:19 +0200
Message-ID: <20181009151019.b6eb6o664twnts7g@flea>
References: <20181009034609.24892-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5752030694300331586=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181009034609.24892-1-anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5752030694300331586==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vsyytmyxitmchppe"
Content-Disposition: inline


--vsyytmyxitmchppe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 08, 2018 at 08:46:09PM -0700, Vasily Khoruzhick wrote:
> Backlight power is controlled by PH6 GPIO, so add corresponding
> regulator-fixed node for it. Otherwise backlight won't light up
> if bootloader doesn't enable it.
>=20
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Queued for 4.21, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vsyytmyxitmchppe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu8xNoACgkQ0rTAlCFN
r3RIWw//dfwBwW+rVVjOT4T3ND3PwCUB06kttEtcAggnvtcbf5f+h8uFnsFlj+Rq
Gw87IzJVjDIYT39U5EY4X+N4odPXTsJDB4ufNrbhGB6WfJW1maUrC3YI9ctt/+mQ
ynGF9o4dmH9I+yOWhNcVgB2XgWhUC6p0cf06pAvymUsFHHWYTYFsXTYLbN9B46Oa
q00mXjNtpTHnSDHnBXoK+ElyD4MAYjEG1rRyMvY9WidGtAuNfQJxVFEg2dDP82YI
B6fX+IL0AUvQxnQi30vwhTrSC/AmF8+pWf93kr21MLiQXtMH0jCX5rhXTZTyWvVW
PtueB3FUclgrjv4IqRZEBrn9U8CFBOLYDYQFDl/zrzpbTyRNdK1273toNmZDsPd2
lbAyGB3nYlE/vC0RHjxzFkW46x0xKqiWlfNwvxVs7QzD485ibepG9svNlmW7eo2m
D8OxDhOYu96nxJM6ttHjKBWw2sLba7/bp65xC8W+IjC8BwamdvblJ7qGro8w6Ac2
S2Xy7dLsAHCV9kFKZ3eZe3H34o9bBkpxP15itRFgkh43j+wsgVXvWH1YhJpwcbvF
LKHOSOVcopiJKqv3XQsZbB/aAPKlMObCqDrWZTyVn8FBk+UF184b5yLutPT1llsA
av8Z1H0CTQeDvEZkKECM2lARKR+HTn7mUX+e+94+WGENyiCD3W8=
=hR7T
-----END PGP SIGNATURE-----

--vsyytmyxitmchppe--


--===============5752030694300331586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5752030694300331586==--
