From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Q/RFC: add dts property for i2c apater timeout?
Date: Tue, 12 Jan 2010 20:43:09 +0100
Message-ID: <1263325400.2298.0@antares>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2255073231743485884=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============2255073231743485884==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-u2cDNuL3haXfMfjw9sCh"

--=-u2cDNuL3haXfMfjw9sCh
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

before submitting a patch, I would like to hear your opinion...

When testing a i2c bus on the '5200, I ran into bus hangs because one of th=
e attached chips went south.  The timeout in struct i2c_adapter of drivers/=
i2c/busses/i2c-mpc.c is hard-wired to 1 second (HZ jiffies) which is *reall=
y* (too) long, at least for my =20
use case.

Wouldn't it make sense to add an optional dts property as to overwrite that=
 value?  I.e. something like
	timeout =3D <xxx>;
where xxx is given in microseconds?  Or should the property read "fsl,timeo=
ut" as I would apply it to a Freescale chip?

Thanks, Albrecht.

--=-u2cDNuL3haXfMfjw9sCh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iD8DBQBLTNDYn/9unNAn/9ERAslMAJ9JnIfm/lp82zG7fxzRdHWfCH3AzwCgjPKb
L+rBSVQ2IwFGspd4KVowVLI=
=prdk
-----END PGP SIGNATURE-----

--=-u2cDNuL3haXfMfjw9sCh--

--===============2255073231743485884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2255073231743485884==--
