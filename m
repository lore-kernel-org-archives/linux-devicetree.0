From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v2 2/2] ASoC: atmel-classd: DT binding for PDMIC
 driver
Date: Tue, 22 Dec 2015 23:49:25 +0000
Message-ID: <20151222234925.GB16023@sirena.org.uk>
References: <1450345800-21299-1-git-send-email-songjun.wu@atmel.com>
 <1450345800-21299-3-git-send-email-songjun.wu@atmel.com>
 <20151219040913.D0F442C02FD@rob-hp-laptop>
 <20151219113055.GF5727@sirena.org.uk>
 <CAL_JsqKTNJ6Y0OUydkef3aYUO2jzDb30myvGJau-RBoJ3qe8hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTNJ6Y0OUydkef3aYUO2jzDb30myvGJau-RBoJ3qe8hQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 22, 2015 at 12:37:24PM -0600, Rob Herring wrote:
> On Sat, Dec 19, 2015 at 5:30 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> >> "label" can be used here if this is really needed.

> > The plastics for the system are often very important for audio
> > configuration - we need userspace to be able to distinguish between
> > systems that are identical even on the electrical level.

> Okay. That is exactly what label is for, so please use it.

Can you send fixes for this please?  There's rather a lot of existing
bindings using the current scheme, together with some subsystem code to
help parse them.

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeeGEAAoJECTWi3JdVIfQlcIH/RdURUdVLQXGdf+1lhPgORHu
tY8J7ptAFCYxUPEgUPLZZHytOn4hPWLS0G66Yg5I2gUh5ueQ/LmQMJS6OqBvzi06
EQIZU9tLTKrWgN+ffKU+HlmqmNk56zuQs+hSW1Lp+GE29CDV4pyafAPEIo/ExJnb
jFw6jnnw8BXIKOBMNI/I7CDr7H8X4vBB4zfMuisSb1LsUY7ht71wekWHBmbMy/za
PCD2CoF+pLWamf4BW3Yhqg9CcSqK1NQICp1qQHvS8iIrvLyDyownTpQMBYfmF6DP
M87wrqdvc2y2hr+tXSRhf2L+k+ifaCZz/oD/0wGbOizixJ4rlwn5yFLBxzymmaA=
=myZJ
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
