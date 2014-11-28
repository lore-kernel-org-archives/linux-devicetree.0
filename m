From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: Add document for MT6397 regulator
Date: Fri, 28 Nov 2014 15:30:56 +0000
Message-ID: <20141128153056.GT7712@sirena.org.uk>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
 <1417146874-5232-7-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gnqr8uuXGD2cvyzH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417146874-5232-7-git-send-email-flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yi>
List-Id: devicetree@vger.kernel.org


--gnqr8uuXGD2cvyzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 28, 2014 at 11:54:32AM +0800, Flora Fu wrote:

> +- compatible: "mediatek,mt6397"
> +- regulators: This is the list of child nodes that specify the regulator
> +  initialization data for defined regulators. The definition for each of these
> +  nodes is defined using the standard binding for regulators found at
> +  Documentation/devicetree/bindings/regulator/regulator.txt.

You need to specify which regulator names are valid and how they
correspond to the hardware as part of the binding.

--gnqr8uuXGD2cvyzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUeJUwAAoJECTWi3JdVIfQTOwH/2/ilGREaWay/MZBpgOUhq4w
d+5T2C0fKtkHglE4NTTexGsm/EOjmnizQ4EL9bWi/v0KL7VRldSLLQeutTyapNa8
2Mm1rqfgkq2zkf9N7hel+YoX1rubYv9iA7Nc+F9In5zcye2zB/jxA4/DmJ/LcI6E
yUgqiDipuavtJ8jpg7RUEdpVxQ9AM8Jfi8xFg0QeNAQvMBOP1vRbWqDFts4Uucs9
zF35LJE8vcvIehyPe1aCarL+EfZjMmMPxDVCjR4RuvarnKlOh6Vq6ZhS4pwT1QnQ
uoP+8o72sopVNmd5Z7Q6QGC4A4Ma9shZDko5cDPVdqi1OfbS1Lp4hSZ7mz729J4=
=/fGV
-----END PGP SIGNATURE-----

--gnqr8uuXGD2cvyzH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
