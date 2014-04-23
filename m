From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/2] rx51_battery: convert to iio consumer
Date: Wed, 23 Apr 2014 18:09:37 +0200
Message-ID: <20140423160936.GB32049@earth.universe>
References: <1393375569-21751-1-git-send-email-sre@debian.org>
 <1393705366-32420-1-git-send-email-sre@debian.org>
 <1393705366-32420-2-git-send-email-sre@debian.org>
 <5336A9F9.4080504@kernel.org>
 <20140420120823.GB12135@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140420120823.GB12135-tWAi6jLit6GreWDznjuHag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2014 at 02:08:23PM +0200, Pavel Machek wrote:
> On Sat 2014-03-29 11:09:45, Jonathan Cameron wrote:
> > On 01/03/14 20:22, Sebastian Reichel wrote:
> > >Update rx51-battery driver to use the new IIO API of
> > >twl4030-madc and add DT support.
> > >
> > >Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> > This looks fine to me.  I'd love to see a more generic solution, but
> > we can work on that another time.
> >=20
> > Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> Reviewed-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>=20
> I don't see this patch in 3.15-rc nor -next. What is needed to push
> this patch?

The problem is, that the power subsystem maintainers seem to be too
busy with real life. The last change in their git [0] was 2014-02-01
and I haven't seen any mail from them on the mailinglist since about
the same time. I have just queried his status @ Google+ (there were
some life-signs there).

[0] http://git.infradead.org/battery-2.6.git/

-- Sebastian

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTV+XAAAoJENju1/PIO/qaNJYP/1BQtRMaBOpjJRSi4wbXkTg6
/KjOdujCzAJEPxBfMZ2jvGDLOXxY/xd44VIfyjKNvq9Om2YfO01xMgwtujMKn16w
vAqsU9lAY1kjv8dEWjFxS7vCQ9tqttqfxaJ4/fbxJZiUiMjJZ0aUpIjUGqn0/Jeq
L1c9tjmFVFCUT9S0dac9eNIrxq01yqAYAD9fhFeCkoL0qH0gkTZIMgDn7u3VbfWj
45LvsuK451PeTreywl+IWBX412dgzCFLaTSIH672rKk3w/TJ4kRfue64fY3NXebi
22/v7Pjx09lk/LCCrQGieTfktYiQtf+4nynagVc7ArscfXKuJrQ5xqxYyRStbZxl
x0DXvvJJ8+ImhJ2XXtbmJ+HP60lMQxc1s6Km4w/4AILfJXeDGE0iWZwN/CUTTdM3
22mx3lJrxRITaU3tWeM1FKb+wyzygFb5lMHpwrF0rStHA/DuzKP80zKSngDJE4cL
BWrChW42vbedDPGE9gKcOvT/XeSVbJt/gEGxSwVqxbGuoEZTRQ4AbQYxutSRv5xy
PXVWdXLoNc1tIzpELXQ8n0bPy4xI9d8tCG7xHwruDSeYWkf3r+FU1/laG1HndFvl
uJKOUhSqQEi+lh6LHVaKB79dDlioYN0xhyZhnOGh9+M1NDap4U0QmygIhgVBS+LC
p0LD9AKLTdmKzhfMQ246
=5r4P
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
