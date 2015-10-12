From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Mon, 12 Oct 2015 14:43:09 +0100
Message-ID: <20151012134309.GE1542@sirena.org.uk>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gDGSpKKIBgtShtf+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151012084554.GB8805@ck-lbox>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gDGSpKKIBgtShtf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:
> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
> > On Wed, 07 Oct 2015, Mark Brown wrote:

> > > This all seems pretty much fine to me - the things it is controlling =
are
> > > fairly specific to the way the former Wolfson devices do, they only
> > > really make sense with a fairly particular algorithm which isn't wide=
ly
> > > implemented.

> > Is that an Ack?

> I am guessing Mark is slightly hesitant to ack as he probably
> doesn't want to add reviewing all our jack detection bindings to
> his already fairly sizable work load and doing so here likely
> means it will be expected in the future. From talking to people at

Pretty much (plus generally being busy at ELC-E last week) - if there's
specific questions that's one thing but if it's just general requests to
look at bindings then it seems like the relevant subsystem maintainers
should have the confidence to review straightfoward device properties
like this.

> LinuxCon it looks like it is pretty unlikely the DT maintainers
> will be acking individual bindings as well, basically they are
> only really looking at major/framework things and leaving the
> rest to subsystem maintainers.
>=20
> Given that these patches only touch MFD/Extcon and extcon
> is a subsystem designed to handle things like jack detection
> isn't it really sufficient that you and Chanwoo have looked this
> and are happy with it? Otherwise I really don't see anyway to
> move this forward and would appreciate any suggestions?
>=20
> Thanks,
> Charles
>=20

--gDGSpKKIBgtShtf+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWG7jsAAoJECTWi3JdVIfQG5IH/18ZEt/dujfumqJV1HlN/mGB
EG1Fymd3L1xuS2CRLyRY7dEzFpIX5agcuTRXYdqey4rafhUyJjcf8WFrZpxa3laM
AkPdP3lkgs04u9BuixVe0uEoJNHQAyAfozx0P4G7QQ24U0rZENOqjsP7vUNM5I0S
Xc7qR2fMhzsZuQcLModQ8CV0Q9cwC9obvYg2QWDtUSQO8vnTklNYEn/gpk6nnALg
h+7z8QXKBi2X+VwyC1wZfL7Jb3EUqKll6vSfwKiy8eKuNlE0734RxwcY3mOKDz/F
LGGODMDiumViIYBVl3EK1hcGNzHrQOe8fKZagW5OLe2cN6W0mMkxnTmvtfmKl3s=
=0cmE
-----END PGP SIGNATURE-----

--gDGSpKKIBgtShtf+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
