From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: I2C bus timeout property
Date: Fri, 20 Apr 2012 14:15:20 +0200
Message-ID: <20120420121520.GB15613@pengutronix.de>
References: <4F912F3B.2090105@antcom.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7469024466531015686=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F912F3B.2090105-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7469024466531015686==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 20, 2012 at 11:41:15AM +0200, Roland Stigge wrote:
> Hi,
>=20
> as you may already have noticed, in the ARM devicetree conversion, we
> are wondering how to handle the I2C bus timeout property.
>=20
> There is already an "fsl,timeout" property, but introducing several
> driver or vendor specific properties for basically the same kind of
> property doesn't make much sense. We already searched devicetree.org and
> EPAPR but without finding timeout properties.
>=20
> I propose using a generic "timeout" property with newly supported i2c
> busses, holding a bus timeout value in microseconds (as already done
> with "fsl,timeout".

There is also "i2c-gpio,timeout-ms" already.

> What do you think?

Basically same question goes for "slave-addr". Since I2C is
multi-master, an I2C controller may also be slave (not that we support
that in the I2C core yet, but drivers could have that implemented on
their own). We have "samsung,i2c-slave-addr" already.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+RU1gACgkQD27XaX1/VRvMVwCeOvIi330ldvGzvwmyriQsg8Og
vwcAoI55yS7J40KZU8y+CZfzE0Qw0miP
=haIg
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--

--===============7469024466531015686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7469024466531015686==--
