From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v2 2/2] ASoC: atmel-classd: DT binding for PDMIC
 driver
Date: Sat, 19 Dec 2015 11:30:55 +0000
Message-ID: <20151219113055.GF5727@sirena.org.uk>
References: <1450345800-21299-1-git-send-email-songjun.wu@atmel.com>
 <1450345800-21299-3-git-send-email-songjun.wu@atmel.com>
 <20151219040913.D0F442C02FD@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jX1bM1D+Mt/z9sU5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151219040913.D0F442C02FD@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jX1bM1D+Mt/z9sU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 18, 2015 at 01:56:21PM -0600, Rob Herring wrote:
> On Thu, Dec 17, 2015 at 05:50:00PM +0800, Songjun Wu wrote:

> > +- atmel,model
> > +	The user-visible name of this sound card.
> > +	The default value is "PDMIC".

> When and why would this be different than the default?

> "label" can be used here if this is really needed.

The plastics for the system are often very important for audio
configuration - we need userspace to be able to distinguish between
systems that are identical even on the electrical level.

--jX1bM1D+Mt/z9sU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWdT/uAAoJECTWi3JdVIfQ9sIH/R18YhGIZS6IGykZ/hfeHY51
xKJaealegBLidd+EM5zk/t9kn50llvwPP+NvN4W979TiLMdIRdxiqZJY5BUnqXmh
vOhe0ZSsxvpdnS0+7C2X67T+yXMlTYXxQPObDfz3dt+o8/KAFQqCEuPG3w1aKGfI
RecuNK6UgtptDkwRIivSBTiva8ALBjnbjeFpCqmA3Nr/HOudXT97CzuE6Wlf3w1k
ywqybmzZ0nxbKguE6mFJMhztEkgnqm3y/pHqyN0Lv9MHKKtIDR2mfbQVBMy4w7bx
QeyzOScWt7y5ZbofkQFSbBGvcjS0CbYY+mjnR8b2MZzhbpSkH4zyzkx2H/SA9fM=
=3RuH
-----END PGP SIGNATURE-----

--jX1bM1D+Mt/z9sU5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
