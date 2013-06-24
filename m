From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] of/documentation: Update s5m8767-regulator bindings
 document
Date: Mon, 24 Jun 2013 16:25:53 +0100
Message-ID: <20130624152553.GT27646@sirena.org.uk>
References: <1372066617-23518-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9067179119942328555=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372066617-23518-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============9067179119942328555==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lbYR4+J2RcKO0WXU"
Content-Disposition: inline


--lbYR4+J2RcKO0WXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2013 at 03:06:57PM +0530, Sachin Kamat wrote:
> s5m8767 regulator is used on Exynos platforms which use pin controller
> to configure GPIOs. Update the example accordingly.

This smells bad, why does a driver using GPIOs through the GPIO API see
a change in the binding?

--lbYR4+J2RcKO0WXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRyGT+AAoJELSic+t+oim9fecP/RSkd5vTH7/QxKdP/Xngg9wX
1ljG4MLhQNrBrfryROS7KpWNNwWBqK8+UpTtLa+za0xk5P6i4tGUNrj5TOcrdADi
aEr5fEQKCLfNvKG9IYKFRpdn9i/aW/von/2yKx/r6qDIYlCWwbRHJj68T5xSyXB6
zc3fE9SHhMxxqEfTkyd0uRxoD2dTGvT2I605kBbGqZTvIAl1RHXf2GrRzfy20hHa
jyEXuy0bZ6DNK/yPchhsS3kpnsiuW1vhyIfqL8GSt3ltxbAxxDX8q6KEjU64VASr
IHco5GvKfRUQbToDS6CtIjzMWDOJ5A1Td9QTsFZIK4TxDA4ADHt4Zag+AUs5DA3t
KVAsWXcbSF5LL/96Cy7Ajd4QiZILXp3YQK13mTsMJ4QRUnenWM8VyPgTltE+OA9N
lknf2jyu5tJl1el8tcs1YvUtjqAmSm5WCn/V9+BAvFlwcshwmZOyWm4pkAC7Lebr
xwGEHa8f69Hk0aYnbMGiLNV9m1BHHdXpOj/e+TIUmY347eZaS4PY0BnyYwZVkEO7
Tg927x9SEXGVGMmfP7slV1//cUL1xz+rLng1gOzgGKLty0IDL1XkbdWbLV0yfO9b
y3+q2hbTHSAmBpnSU4LVen4382zvw49xx/XqtRub7ydpKM8JnIYqI7uW8keeh79v
Q+EhP6qsMzxk+W/ZyHK6
=rsb+
-----END PGP SIGNATURE-----

--lbYR4+J2RcKO0WXU--

--===============9067179119942328555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9067179119942328555==--
