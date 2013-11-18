From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 18:43:09 +0000
Message-ID: <20131118184309.GU2674@sirena.org.uk>
References: <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
 <20131024072811.GS30088@pengutronix.de>
 <CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A@mail.gmail.com>
 <20131118124518.GA16735@n2100.arm.linux.org.uk>
 <20131118153750.GM26046@ulmo.nvidia.com>
 <20131118161151.GG16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKcNkqnJHUUp475E"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118161151.GG16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vKcNkqnJHUUp475E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 04:11:51PM +0000, Russell King - ARM Linux wrote:

> Logically, it can't stay as two separate patches, because it won't be
> possible to "migrate" to it in stages.  So I'm fully intending to
> squash that all down to one patch which adds the core code (probably
> ultimately into drivers/base).

> IOW, watch this space this week. :)

Can you CC me on these changes please and I'll have a look at converting
ASoC over to use them?

--vKcNkqnJHUUp475E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSil+6AAoJELSic+t+oim9yMEP/3/9iZa5HBRIBTBgW7bGPqST
evSdF636XUqWCAuK+Jd3nCBiMlq7cyYBbsxccNGmBcMCyN+BwhLgmUDdQSzO6e+q
3KNfLU8WNKKQ7IHMKR4KubTezgc5MD8G9WL2FW8oYdbM6Qf3IJ5mGHZqOsTF/88h
yFxEsLRMn1sxbju7Ci49I89IlEPE3v8Nvkxfz8JkEVCUEk+Z7uNTljdKIB7U4PeO
iljlPSsE93Fce/nhp9l/FD9TNsrlWpPvV7tEVi50ZpeA1juWLebiKFMsD4iKLDil
BQSYw9Ife1U2DD02C4c7380vX3/moAFdVAhFQJWm+lLXmLSHByAxxAZ4evg54fb9
cU37yZtLw7Y0DCNdPGp8FT8UQGR0ppquf29yg94GXOZr8McdBeofwH/UpNGKYNbh
sZHFsFEMZTxiw/xFAPx/h1BvLADJBMxpNhdNbJDCt5Zn9G0aprtqKwg5eq1ghlka
fZwS6BIBYF8TcwGThWDwd0k04vODKrdky6tQAlYjTcuQZ+aiUrxWlqyoV6wHM37z
cmCpN73OAcLBVy5Eqpj7KtKAm+RLcWCZC9+344uLBjTJ3b0Bnuj6dLEUIcGmeiSl
tQtLfrxv/+MR0YHgBGVNvqId4Om1leEch7bOCHZKyJV+e7KJSAT4UA8pCG5sAyAA
b5BnEAOFz5lmX3Qjo469
=vFx8
-----END PGP SIGNATURE-----

--vKcNkqnJHUUp475E--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
