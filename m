From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Refactor Qualcomm RPM regulator to single
 platform_device
Date: Wed, 8 Apr 2015 12:23:39 +0100
Message-ID: <20150408112339.GW6023@sirena.org.uk>
References: <1428363240-2027-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BMIgvY26efrdtlVp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1428363240-2027-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--BMIgvY26efrdtlVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2015 at 04:33:55PM -0700, Bjorn Andersson wrote:
> Stephen Boyd pointed out that the current design of the Qualcomm RPM and
> regulator driver consumes 12-20kB of ram just for the platform_device structs.

Applied the regulator patches, thanks.

--BMIgvY26efrdtlVp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVJQ+6AAoJECTWi3JdVIfQmuMH/0ZmIwxkpxadkl/Aa8/WCIsm
vqWAM4iUhhiz4XwtApzRweNtfoAgElDqSdtSfDPrhdYw7yy6cU5vkuBgBdkMyjKZ
D+FYsDq5q9oH3IYbmMie+9xYrOrXpbYqKEQQ6shhQjm/uPlOAJ1ptGlcj7jlsyAQ
JjlbSOyRXWfIlK5NPnagQ9ABaERyXH9XcXt//WITENOkDCebvcoQXOkJHCJRfV9/
E01WpgkIN0w8/LuqIjl6aD60xYz3U1uSbbCwMShDHCA83epcig1NWCaG148CKlRv
89GMkW0B2FuxNbWti2/bZTI9qMHWr5elrVZ+bjyeeKmOdwpddTKOYNEzSg5r0Zw=
=+JsU
-----END PGP SIGNATURE-----

--BMIgvY26efrdtlVp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
