From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] regulator: Introduce property to flag drms
Date: Thu, 2 Apr 2015 09:54:40 +0100
Message-ID: <20150402085440.GL6023@sirena.org.uk>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1427928946-31291-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rVkomL2febZOZtGQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427928946-31291-3-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rVkomL2febZOZtGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2015 at 03:55:43PM -0700, Bjorn Andersson wrote:
> Introduce "regulator-allow-drms" to make it possible for board
> configuration to enable drms for regulators.

I don't think this is a good name, nobody unfamiliar with a fairly
obscure feature in the Linux regulator API is going to know what DRMS
means.  Something like change-load might be clearer.

--rVkomL2febZOZtGQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVHQPPAAoJECTWi3JdVIfQVG4H/j9t9YiThlTTcnCXA09C7Cj6
4ouc0nxc7OTtgUmOU7PtwHx12FofEMlaEy4DdrFY3oETXGqJW0TaIGoVYyroJeHq
W09ay6MBCDdP6snhULy5dev5Mm/yOZWOJLcNqG4WTDHGsMBTTcS26puymSPU+wkP
RM7hSnOF9NkDP8WQ46oHiIuv/zLEnDyXFmHGCHPDEWQmAEK175HH2oq3wX7zoQtX
4MYUGzQkt87wrsjBPhJt6feH+HPr+gr+qX16S8p6gZqqXiZkMHr4zubfCpAVzjqX
Uu0+S4bLCIL7b4waQ1vp1gI1Rxu5EH/O+jNPyvanG0Md3u02n9At8ir1D9lQKRo=
=scSA
-----END PGP SIGNATURE-----

--rVkomL2febZOZtGQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
