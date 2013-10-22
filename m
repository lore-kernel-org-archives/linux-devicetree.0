From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 22:12:29 +0200
Message-ID: <20131022201228.GB8037@mithrandir>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310221333300.1951-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 01:42:48PM -0400, Nicolas Pitre wrote:
> On Tue, 22 Oct 2013, Matt Porter wrote:
>=20
> > DT has many benefits. It would be great to leverage them as long as it
> > doesn't interfere with the rate of change and willingness to evolve code
> > that's always been the strength of the kernel process. That strength is
> > too valuable to trade away for the "DT as ABI" vision.
>=20
> Amen.  This is the best statement I've read about DT so far.
>=20
> Having "stable" DT bindings is just a dream.  Experience so far is=20
> showing that this is neither practical nor realistic.
>=20
> The unstructured free-for-all approach isn't good either.  Some=20
> compromise between the two extremes needs to be found.

I agree. I think we need an easy way to mark bindings as unstable. One
possible solution that I can think of would be to use some kind of
special marker within the compatible value defined by a binding that
would be used to qualify it as unstable. Perhaps something as simple as
a preceding exclamation mark (!) would do.

	gpio {
		compatible =3D "!foo-gpio";
	};

The DT core code could look for that when matching device nodes to the
list of compatible values supported by a driver and output a big warning
message to make users aware of the fact that the binding may change. The
driver could use the same marker in the OF device ID table to make it
clear that it implements an experimental binding. Whenever a binding is
deemed stable we can simply remove the marker from both the driver and
the binding, as well as DTS files.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZtwsAAoJEN0jrNd/PrOhXjwP/iB0Yg38wb/oQOHrDRK7XPXQ
AJ+Y10R6d8F08HnIS78HsVYoC0I9pu56SGJg8keijoMMjKFbNcdJ+qC5ooqXRFa2
eOoBbXJvaXO0Xi3xqhyYYPVXRtZD10Weh3d56Xri3C5y3mLnWgeAyn2agqpIGpbF
l5cL6rbQL4gHMYWJXGyNdny3srm1KubRk1OXdrW8xJZbNkUV838n8Ls2C/7LROzV
rBAZ4bzDv1kCK84V2HfSxCwRs9uNlpjWlZ7MOpLggrr1rhdf6j12zGsl06HIqNZx
XhF5Eru3dGjz4AnSxyEneTX0Fy8P0Yfk+RvsZsGXzpAekvv2GBfcqJoy3lvox3Rt
s7Id14dZ0KlRAG+52QbVMq14DPukIZNs9wVmFUjkx2E9Jy1kqAFVWXZrzLQXuSrU
HqC7Kxryy37AL42R9DjRCTpfjNI+S9ta/V5M9IkSv4Zyk0vSATMRJHwjeBuntbV0
v/asCWxWqkH6QfPzFlMhoHxUbwfWeFsEdNQjz3l3VQ9bWngA2QZ+2gB9ZAOf+NBo
aYRAcMOOYgK+mK5xkFkEhO3BqrL8vHF4oRXWlm0fURlJoLRvWz/QshmFtDQFW0jC
2fAmyApeVJNxR9V3xij/TrqMJs5yVj7fb5BsVPhbv3k6XH9RjpG2VXjQB+5Phf4a
h6hbFVLfDfPhKzQ3znBF
=yU2E
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
