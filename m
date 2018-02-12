From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v5 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
Date: Mon, 12 Feb 2018 21:58:58 +0100
Message-ID: <20180212205857.54nmli2jnv4fxrwm@katana>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1518457475-4480-13-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fwmxrfzpbjqoxo45"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1518457475-4480-13-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju
List-Id: devicetree@vger.kernel.org


--fwmxrfzpbjqoxo45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 05:44:21PM +0000, Fabrizio Castro wrote:
> Due to commits:
> * "ARM: shmobile: Add watchdog support",
> * "ARM: shmobile: rcar-gen2: Add watchdog support", and
> * "soc: renesas: rcar-rst: Enable watchdog as reset trigger for Gen2",
> we now have everything we needed for the watchdog to work on Gen2 and
> RZ/G1.
>=20
> This commit adds "renesas,rcar-gen2-wdt" as compatible string for R-Car
> Gen2 and RZ/G1, and since on those platforms the rwdt clock needs to be
> always ON, when suspending to RAM we need to explicitly disable the
> counting by clearing TME from RWTCSRA.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRj3fQ9qLvQP4Q@public.gmane.org=
s.com>
> ---
> v4->v5:
> * various improvements suggested by Wolfram
>=20

Reviewed-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>


--fwmxrfzpbjqoxo45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqCAA0ACgkQFA3kzBSg
KbbZ+w/9FyTriWtGeRWOvopVj5eil9PSeM1rjVIwx399i7/OiqC+180H214SwvrP
U6knmbhPDT5hK42DPyY9OXRcMAInFbkxdNNnCyOysYW95ukf5xWSG0A0s3NoUE0e
ALbzhebzjVNfvIPANTswz+Eykih+NEv0xlOCjbHos2aESJIfUcarrPQgcJXgubOt
06cX+fAV7f20g2dg/g1sqE9np0N8CPIrDTCHUVi4bsAd7iwpYvOKy6pDEWgnk09z
Q4bjFRY/xXbzjThl93n+RsuOQBEQtsfcGTeG7b2hMtQLyQ02QRmwsGT2BK829u3k
aIHtxmrm8O6uJLTCF/qaWIu3ZheVOvRuF4gbjdKTgDpv0hLV7OLLKp4lWpqAfJ+7
pVKxKdRPi5O+t3L36SngaYRXob751s1f+51ut89Nf1iCfLr7MfY0Yl/7gUTgP+ys
1kDAH7oWqstKspSRQkOw4MAyoUpWMMIjVLfzsG3i1zbn4T9iWlpKJb+teTd9pdfb
UnS7EjAa9ciggTwSadK5kfj/3l15lmmqRBJRHHC5P0c107NjjjPWdOYRYstTFlxF
20V+74xmZ8y1BJkvAox4gR6p6Ialldi99xduDMDfJ0YxhSV5WR8DGjWPOF+U80hw
NCcDCaxkFdvjmHJO4M4KyZqQS6vc+HW9kxh9WahzW/yZrzJamZY=
=YcjP
-----END PGP SIGNATURE-----

--fwmxrfzpbjqoxo45--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
