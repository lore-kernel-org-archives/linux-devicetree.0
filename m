From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] regulator: Introduce property to flag drms
Date: Mon, 6 Apr 2015 18:57:26 +0100
Message-ID: <20150406175726.GA6023@sirena.org.uk>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1427928946-31291-3-git-send-email-bjorn.andersson@sonymobile.com>
 <20150402085440.GL6023@sirena.org.uk>
 <CAJAp7OhW9SBf5=MmEEFNLGYpZ738Z8=HKxsBTBVvk-GNZq6=bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8SFaB7V4ymMc+XRs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJAp7OhW9SBf5=MmEEFNLGYpZ738Z8=HKxsBTBVvk-GNZq6=bQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8SFaB7V4ymMc+XRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2015 at 02:35:07PM -0700, Bjorn Andersson wrote:

> Would you mind picking the other patches from this series or do you
> want me to resend them? They are unrelated to this issue and will give
> us working regulators (without set_load support) on the affected
> platforms.

There seem to be some dependencies (at least for patch 3) and Stephen
had some review comments on patch 5 so it might be safer to leave them -
but in theory yes.

--8SFaB7V4ymMc+XRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVIskFAAoJECTWi3JdVIfQkYAH/2gNTZREN0qC8n4w9jADGkth
fE/6FBvnwoeRGJAeDCScpm8j+y0NXHYbXaz88nCj3E43yPO3oTX3VQCMJ0DPwqT3
ddsbyaYztGNl4EkQ4tROksifJV6zZc3gZAMDXjRh3V2z+0gzdV95CF032yRJsJQi
DlQR1V/OS9Xy5WufqWpcfxkPvtMGPyzQwYdE5ccmUaMMvfVzwUc91tsav7rzkg9q
JZaScT2cxSZ5qjoM3PLwC2WK3wUyfu7pVt1LKICkZPNL9ZZg2kn9YDGP+ZtHonPo
Z+acq4BCWcOuQu3dVmKTE6oV5W1BLNLMNz85qTE8yRsMdqfDsr8EARM62WOBGTA=
=B72C
-----END PGP SIGNATURE-----

--8SFaB7V4ymMc+XRs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
