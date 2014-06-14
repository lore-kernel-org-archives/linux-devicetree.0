From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/2] rx51_battery: convert to iio consumer
Date: Sat, 14 Jun 2014 17:47:33 +0200
Message-ID: <20140614154733.GB13614@earth.universe>
References: <1393375569-21751-1-git-send-email-sre@debian.org>
 <1393705366-32420-1-git-send-email-sre@debian.org>
 <1393705366-32420-2-git-send-email-sre@debian.org>
 <5336A9F9.4080504@kernel.org>
 <20140420120823.GB12135@amd.pavel.ucw.cz>
 <20140423160936.GB32049@earth.universe>
 <20140614083231.GA15326@Nokia-N900>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140614083231.GA15326@Nokia-N900>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pali Roh?r <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2014 at 10:32:32AM +0200, Pavel Machek wrote:
> > The problem is, that the power subsystem maintainers seem to be too
> > busy with real life. The last change in their git [0] was 2014-02-01
> > and I haven't seen any mail from them on the mailinglist since about
> > the same time. I have just queried his status @ Google+ (there were
> > some life-signs there).
>=20
> If there is still no life out there, you may want to ask
> Rafael W. to queue the patches...

Don't worry, I haven't forgotten the patches. I don't think they
make it into 3.16, but they will go into 3.17. For now I have
put them into a dev branch on [0] and requested to take over the
power supply subsystem (see thread [1] on LKML).

[0] https://git.kernel.org/cgit/linux/kernel/git/sre/linux-power-supply.git
[1] https://lkml.org/lkml/2014/5/16/504

-- Sebastian

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTnG6UAAoJENju1/PIO/qahdAP/2AlUpdABUFOHnAoDN/pJKXn
SJe9seEdV37eOfqoizjL9sZTD0JdaubgP/ryLBaFDIcUaaghkCx1kP1FkusaTeF/
UzCr7yy8Hzdh2mfyhTiyIw9xVEz7eJ0QJ0tpF5SpJF9q7mKpZtbwzpMjukshN3nN
0R9WnMXVRyXd7OGzC/eE4Ka1Nz2xXco2Ib9zja3dYdQXFEYg+swjiLbuOEyaObmG
nyDrzeNq6Qx8FZ4E5n+gUSKZCfWCLyxoCQTvL+HR0HH/Aop5g4siLGxLDZ0dvSML
dSO710Y0nbjaMnarsDIyADzOpFTyjHy+rgjjax4nPWyqWtkhaE1OPi9WA0uFSVrt
RL7tAgzjwsAI8SjyfyRiKX0xvTxIivXLPSqB4+/JcNU/Dm/BB518ZktEqIXUHrrb
lTjyQwcM39m+yk1+Jr1l2qOfWggEZlR6/a4yGJRPLWKUiX2SiSFuDbtWxLPTUhpE
QGL8l7ijGXaGxoi9vPa7OR280iPhNeE60kMo7dpSZVhkjPml87mwDrCQy2keGz4Z
oAjBPWEc0+PXvESll0NAXrl+EUWi9Zxgi+Jad1ABI+WIqdFg57p7O2MHX+0ngjPB
3bkbCWoL2RCEhN5QZWKcEmAg9Jbm2LJ8zPiV6Bn+MEOeDIy7o8HRgz7lDXfX97QO
vh673dAMRHtNXo5osaa5
=hq0y
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
