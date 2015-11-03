From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/6] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Tue, 3 Nov 2015 16:31:17 +0000
Message-ID: <20151103163117.GQ20228@sirena.org.uk>
References: <1446244904-29315-1-git-send-email-afd@ti.com>
 <1446244904-29315-6-git-send-email-afd@ti.com>
 <20151101023735.GE28319@sirena.org.uk>
 <5638D97A.8040306@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nWEzmRaGLXxZdI3i"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5638D97A.8040306-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nWEzmRaGLXxZdI3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2015 at 09:57:46AM -0600, Andrew F. Davis wrote:
> On 10/31/2015 09:37 PM, Mark Brown wrote:
> >On Fri, Oct 30, 2015 at 05:41:43PM -0500, Andrew F. Davis wrote:

> >>+	struct regulator_desc desc;
> >>+	unsigned int decay_reg;
> >>+	unsigned int decay_mask;

> >The decay_reg and decay_mask fields appear to be entirely write only,
> >why are they present?

> Not sure what you mean, they are written to differently for each regulator,
> and read when setting the decay mode in _probe.

Ugh, that's a bit hidden (mostly due to not using the callback).

> >>+	ret = of_regulator_match(&pdev->dev, pdev->dev.of_node,
> >>+				 tps65086_matches,
> >>+				 ARRAY_SIZE(tps65086_matches));
> >>+	if (ret < 0) {
> >>+		dev_err(tps->dev, "Error parsing regulator init data\n");
> >>+		return ret;
> >>+	}

> >Please match regulators using the fields in the regulator_desc rather
> >than open coding.

> I need to match to get the driver specific information for each regulator,
> if I let regulator_register do it I never get a chance to process the match,
> unless there is a callback or something I'm missing.

There's a callback you are missing, of_parse_cb().

--nWEzmRaGLXxZdI3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOOFUAAoJECTWi3JdVIfQL+gH/1gamFD4yXMhl9M/GVBcJSXt
Sg0QAwkqCwb2LwCSrHz/0gc3w9qbOlcLP91npZh9kVk4b+LpitmjiDq2osX/SEOf
EBAmD19qb+M/Zl2aKcPPap5/CB7Xarvxz0zKCezYVEPv6l6xTHl9IUbyOkuML5kK
yle1bqWL07w/sbIZHFfYNG11AZgp+qbCq1iwKPMPVlOx9Mk84AyE9i/3oPxJjYwG
PQKnew7PoWbF6p272x9xY+1qHsNRcpOKLYekpidE0mFTY7NKgOI9mDlm2qZfAtus
0grs4jiwRG6aL16xZ6lDgiYC4RnYtQdVVoAd21jXxnrWzMdRyY/ZDzCyEbLFyPY=
=2JKT
-----END PGP SIGNATURE-----

--nWEzmRaGLXxZdI3i--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
