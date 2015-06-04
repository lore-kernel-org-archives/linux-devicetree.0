From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 2/2] tee: add OP-TEE driver
Date: Thu, 4 Jun 2015 13:00:05 +0100
Message-ID: <20150604120005.GA10283@sirena.org.uk>
References: <1431671667-11219-1-git-send-email-jens.wiklander@linaro.org>
 <1431671667-11219-3-git-send-email-jens.wiklander@linaro.org>
 <20150518131850.GA7064@leverpostej>
 <20150520121648.GA9819@ermac>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150520121648.GA9819@ermac>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org" <javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org>, "emmanuel.michel-qxv4g6HH51o@public.gmane.org" <emmanuel.michel-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jean-michel.delorme-qxv4g6HH51o@public.gmane.org" <jean-michel.delorme-qxv4g6HH51o@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2015 at 02:16:48PM +0200, Jens Wiklander wrote:

> > > +#define OPTEE_SMC_SHM_NONCACHED                0ULL
> > > +#define OPTEE_SMC_SHM_CACHED           1ULL

> > What precise set of memory attributes do these imply?

...

> OP-TEE is more or less always compiled for a specific platform so if the
> kernel uses some other mapping for a particular platform we'll change the
> OP-TEE settings to be compatible with the kernel on that platform.

I'm not convinced that's a realistic assumption going forwards - I
certainly hope it isn't.  Currently TEE code tends to be only built for
verticial systems because of this lack of standardiation (and the fact
that so much is proprietary at the minute) but hopefully one of the
results of having a reusable solution in the standard kernel with an
open platform for the secure side will be that people will be more able
to use this, perhaps in applications where things like single kernel
support are much more important than they are for the environments where
TEEs are currently deployed.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVcD3EAAoJECTWi3JdVIfQS6UH/2LDUpjJ8sGwjmRc4sYgoy+H
Ts7Wiiqi0R5chHyj/5snGg0swiImOP6249j6ywn+CfKP1FYiyeF3J5GVDle8oI7O
pGg1LxYaQyPhgZKfj/E70/IYj/k1CaMedc3gWI0g9T+3Pfw37boyU2UfMv37f2kb
5N6JvPcRdQhamvcj5PreUm8vdw13GJVsgg9o1Y+CJdTmZdOJLI4rsq1qLT5EWrHS
qNZXyNDdyfZfJS6Fv50sPGWfY35slM28savnlxmcXNtQ7yoDcATu2IFeIgBOEP+4
ymeoS9fRwy8fLK5SNIyb6Fw3DjcevP/LxpB91BBeisn2DnkXeUe2Pjq0UPE9pDU=
=UBUk
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
