From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] media: i2c: adv7343: fix the DT binding properties
Date: Tue, 24 Sep 2013 16:54:43 +0100
Message-ID: <20130924155443.GH3226@sirena.org.uk>
References: <1379073471-7244-1-git-send-email-prabhakar.csengg@gmail.com>
	<523C1AE0.9020603@samsung.com>
	<CA+V-a8u5_rhxTgkVgCbtmGpaZCt2ciu4vABW4t80aSp7csttnw@mail.gmail.com>
	<3002978.Cb6jL1xtkE@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1088532695=="
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <3002978.Cb6jL1xtkE@avalon>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, LDOC <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1088532695==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline

--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2013 at 01:50:51PM +0200, Laurent Pinchart wrote:

> Isn't regulator_get_optional() intended for devices that can have supplie=
s=20
> unconnected in normal use ? The ADV7343 supplies are mandatory from a har=
dware=20
> point of view, so I think we should use regulator_get(). Otherwise the dr=
iver=20
> won't be able to tell the difference between a regulator that isn't prese=
nt=20
> yet (for instance because the regulator device/driver hasn't been probed =
yet),=20
> which should result in deferred probing, and an always-on regulator that =
has=20
> been left out.

Yes, everything you say here is correct.

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQbXAAAoJELSic+t+oim9Wd8QAJROL8/YCEe41gUGfWpxUZpS
LO4/dElxUrRdy6BK/l2mhVYW/uS/v1VDuaIVXtMDQ/eC7VElyUw18uK1LaP3XIRc
RboU9FqDjRrryNEeV3eRbHRt9/jZC35AeGzRuZTzwMBwBY4S1+deFcIfa6V3zaXT
ecEVUY6H6/3ywDe+NO4aEUCIvIcRMhf6ezhiPi/ByQ3v7VDDriBlNuhDJteiM4+h
P8UFyMYdsaUeeup9FJhRdrFBJ5W+PcafocJZTxpWfIN5FqsgQ+72nUH2LjCD9WlK
S2sIjMNfOSvgHBcfReLYSa3dxTpyrePfe6J06Wd4iT0sEIzGoCZUGJthk+tirXct
FVbeE96XEobc3v4aWUwspFVuUjWDcPcs6ZmdkMsMEsvKn+kdD/zmisH3jxUNt3hA
uAj7hKT8Xyglij38kw8wXzev6rJpUTn8sW7l68LbvV8O1BL+1kpHFIovGL+3u+Vz
AX+uNhnO8oYuGYnUUSbzxmMrGBShgH1bIngW6fCqFn5zNi3At7n4hJqdDjmks4xH
007/qV/gUAdv5LsChCE0L0vbCDHFzqzM6OBonZ7y1dS7LNOAmuv5uNE3m3aF/qSj
JdpW4AP2qKaiDw+cmaRZmDDygsXsJNzOZPZ/azTwryECQ4PtYTIyXBP6qS4R7bPE
WRbYiIrntkUSY3mo3oGq
=Og3c
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--

--===============1088532695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1088532695==--
