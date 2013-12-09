From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Mon, 9 Dec 2013 11:27:54 +0000
Message-ID: <20131209112754.GQ29268@sirena.org.uk>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com>
 <20131208161922.GK29268@sirena.org.uk>
 <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com>
 <20131208192237.GM29268@sirena.org.uk>
 <CAFEAcA9oCPi0dj89NJ0k2wOsbVBCV=3=7FBrn=xuYdouJWc98Q@mail.gmail.com>
 <20131208215026.GO29268@sirena.org.uk>
 <CAFEAcA_GG_GW0ZXbTPMp7M0foK_sjUwYx0kk_YULVn0d9ozosA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+cdUESGy8E0PQTBL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFEAcA_GG_GW0ZXbTPMp7M0foK_sjUwYx0kk_YULVn0d9ozosA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--+cdUESGy8E0PQTBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 08, 2013 at 10:55:28PM +0000, Peter Maydell wrote:
> On 8 December 2013 21:50, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > There does come a point where it's just nitpicking and not helpful but
> > if it has a substantial effect on functionality then it's useful.  In
> > this case suppressing the warning for non-asymmetric systems might be
> > sensible.

> Hmm, so "mandatory for non-symmetric [I assume you mean
> that and not really 'non-asymmetric'?], otherwise optional" ?
> I think that would be reasonable and preserve backwards
> compatibility.

No, I really mean asymmetric - I'm talking about the cases where we
suppress the warning.

> > For all practical purposes it is currently optional but the spec says
> > it is mandatory.  I would rather err on the side of not changing the
> > documentation in case someone does work based on ePAPR and/or an old
> > kernel and since doing that keeps the spec more stable even if we do
> > implement in a more tolerant fashion within Linux (as we should).

> As I say, I don't think your specification currently does say
> it is mandatory. If the documentation doesn't clearly list
> it as a mandatory parameter, and a large number of

Like I say I don't think that's a sensible interpretation and that if it
is what we want to do then someone's got to find the time to copy all
the bindings out of the spec into the kernel.

> people writing DTS files or DT generation code haven't
> put it in, and the kernel didn't complain about it not being
> present for a long long time, then de facto it is optional,
> and you should make your documentation conform with reality
> and fix bugs where the kernel isn't coping with that.

The kernel currently copes fine with this, welcome to the world of
writing things down in specifications.

--+cdUESGy8E0PQTBL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpak3AAoJELSic+t+oim9XUMP/iYGv+tLzuyhLvjeXhSFTnh1
32p8Awtx+2IyFSN9QnW58HuT+X14ooaVvs+sLIXB/uBdt+TX0VMksjZVHCOCGB5+
+yZS3CKwkFXiqSQmD0AHOYhENHoZrTE9GmVw6X76TIj4BQpHu3OhSI7GeMFYkN/7
sSUwOWIcc+5glBZAdFyZwSeShvhmL3hMtHgoqlNJ085IQf4Mf+RPXY2XapD3jlwz
uzPyiHOpq6y7/pJ61BOKIaxnGUi599o17xw8AACF8BckCXV52hoV7NPA+5wGhXra
0U/k+B2xpuy9ZTK+3qNycF3PcE6Jb0MGG7csTTDGjyejCSIvorAxS/FG/OUfnE4z
AWBeQqCjIbldCofZ21NZHz57wMSpWBNYLQubLu8msxzlOx0YkUaGtflcu2/q3Os/
Z+3SZBlDJoXvjmIRY/ZXLrkkJSTdmebQ+1D6OhlsqhncLvzgztEKo+1UZIvE2D8r
aiftHW2OJ2n0Au2nVQZpuIPC8Mg35QHgFpVg4O1CG9092Khe6oTHiFcFmpqdcEHY
T7XAr3jCPAsVuJJTMSl6J1rQSPxYVHEZl40OiwYc9JKVc+P2j8O4nMSWY+gYnErU
NJksONj0W/mypHv3PnsqXSCHAqKn3ZALQRKFZsSo2fjfG7QP2hcm7BKLTE3hklu3
8uCRyFhUwG+BZPgMGR5Z
=XDzL
-----END PGP SIGNATURE-----

--+cdUESGy8E0PQTBL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
