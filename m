From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 8/8] ARM: dts: mt8135: Add support for MT6397 regulator
Date: Mon, 1 Dec 2014 11:16:12 +0000
Message-ID: <20141201111612.GF7712@sirena.org.uk>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
 <1417146874-5232-9-git-send-email-flora.fu@mediatek.com>
 <20141128153008.GS7712@sirena.org.uk>
 <1417403967.9547.2.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUAgMX1mmt35sX2N"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417403967.9547.2.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yi>
List-Id: devicetree@vger.kernel.org


--fUAgMX1mmt35sX2N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2014 at 11:19:25AM +0800, Flora Fu wrote:
> On Fri, 2014-11-28 at 15:30 +0000, Mark Brown wrote:=20

> > This appears to be the DT fragment for a SoC but you are defining the
> > system integration for the PMIC.  That's bad, the PMIC is a separate
> > device so should be hooked up by the board using it.  If there's common
> > elements from a reference design they should be in their own .dtsi.

> Do you mean that we should add a mt6397.dtsi and include it from
> mt8135.dtsi? For board specific, update them in mt8135.dtsi?=20

More likely you should just add any integration needed in the board
file.  There should be no need to specify anything generically for the
regulators on a PMIC except registering the device.

--fUAgMX1mmt35sX2N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUfE37AAoJECTWi3JdVIfQi20H/im8teQUzpvlbmmrjqEIK63a
HqY0GfzbjgID2Qfnt6hRrKwg7wmB9jy2iF0I0VuXhlNECm8lFLtlQTkhYr4AOmlO
AgAbWIW0zezngY3XmiwCACgJnExUdLaSEPYFuOg6QsM51hMet+6c15mFA2m7SVhL
1rWxLT0L5r9YaWhWPzbQlTBbr45CRHY2s2wuOFmSXTsALymqYM2rFSMmDaWlrXMA
VdLit4jpcXbTmilAroblI/wrRsxvxbAN8/7g845mBeQZ9KsErbp3mZ21Zj37vIXj
r4DrTMfkNfLhk6qexHR8OCcqPT0Xl1MNX/cW16D36U/qVe5UkNerHsv7z3SBjF8=
=YkfB
-----END PGP SIGNATURE-----

--fUAgMX1mmt35sX2N--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
