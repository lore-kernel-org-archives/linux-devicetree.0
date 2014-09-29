From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Mon, 29 Sep 2014 11:23:52 +0100
Message-ID: <20140929102352.GO16977@sirena.org.uk>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
 <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com>
 <20140928102202.GM27755@sirena.org.uk>
 <5428F592.3020809@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iEWWOZ/QYGWEaBRW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5428F592.3020809-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--iEWWOZ/QYGWEaBRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2014 at 08:00:50AM +0200, Stefan Wahren wrote:
> Am 28.09.2014 um 12:22 schrieb Mark Brown:

> > Use subject lines matching the style for the subsystem.

> sorry i'm not sure what's wrong with the subject lines.

> Did you expect "[PATCH 1/2] regulator: add binding for mxs regulator"?

Yes.

> > While this should be using compatibles to identify which regulator is
> > being supported note that the binding doesn't document the fact that the
> > code makes regulator-name mandatory or what values are required.

> Is the following better?

> - fsl,mxs-regulator-vddd
> - fsl,mxs-regulator-vdda
> - fsl,mxs-regulator-vddio

Yes.

--iEWWOZ/QYGWEaBRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUKTMzAAoJECTWi3JdVIfQfx0H/iylZ4g8pS5Fu8LP8XqMt5sp
oNPHAui6VdJ/RWUvk0m8NuZSXUV+6g3+HG5Y1MODP+pdhJ7g405N+GlDXxi3SNbP
kzC2r55fGbqTtduMDZDv2Ffy7op/meJp1urjtLvq2VD/CtXJ0B4hNjotkPhzv+cS
thrZ6+5EtsiLodfn2/PKfSS9WfsoP46nT7oWHd7L0EYJF6G5M31nL5BkaU5gThwk
Wd1SLEv8xa0tCQQsuYfwe9tUzscK6cV8QM52pUsaUUaIu8hBXENdsoTpgpfq+Ymx
okXLdwvBcPsCQMFRbzwpX82M8oHg4ijLuBUF6ACcPBBCUOVnhFIs7EgeVXgwvp0=
=S+g5
-----END PGP SIGNATURE-----

--iEWWOZ/QYGWEaBRW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
