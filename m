From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] of: Add vendor prefix for Ampire Co., Ltd.
Date: Tue, 24 Mar 2015 12:04:18 +0100
Message-ID: <20150324110417.GL18115@ulmo.nvidia.com>
References: <1423677011-17993-1-git-send-email-p.zabel@pengutronix.de>
 <1423677011-17993-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KSn4sQg3MnruwCB4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423677011-17993-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--KSn4sQg3MnruwCB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 06:50:08PM +0100, Philipp Zabel wrote:
> Add Ampire Co., Ltd. to the list of device tree vendor prefixes.
>=20
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Hi Rob,

You acked patch 4/5 in this series but didn't explicitly ack this patch.
Shall I assume that it applies to this as well?

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index c0333a9..1ca9ea1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -15,6 +15,7 @@ altr	Altera Corp.
>  amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
>  amd	Advanced Micro Devices (AMD), Inc.
>  amlogic	Amlogic, Inc.
> +ampire	Ampire Co., Ltd.
>  ams	AMS AG
>  amstaos	AMS-Taos Inc.
>  apm	Applied Micro Circuits Corporation (APM)
> --=20
> 2.1.4
>=20

--KSn4sQg3MnruwCB4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEUSwAAoJEN0jrNd/PrOhcdkP/3GkgqXIYbOCLRxW8sAuqyIW
AeVhPExjGpwyNy4KdKZPCFgfLOc7Ve9JKjBqr7MzL48HjUwY5renLva9mvPQUSIR
AYagyCAZMV7da6Hmunk/eME3P+66UA2p460Ygbv4l+FZXOa/9HvVtiloHtJuKc9Q
8ksqnGqJHvdu5XtOYTI8JtrjC+Q+r1FxYfUj/pYeren3sYMCF9sWF43bjnl2AbLG
gSnIZaN3/aXcRVXkMd0zeuHDU3m4wbnStyLw++Azl8bocZWQHN2ZG9M//UaE49Dr
nVobT3TeuQBhFkfEAB90ngm2err+KbqxmCkYciMftxGEm1BllwzASJbstFxIbGQ7
/EcQA+6mTv5HMO7HWYh0QwxWpKDc0yl3m3UCBKHCNgcck2Z8mKWVthZOPW9/ODtV
XeLh3aPQAnS5RQDAyTf5ZDxwBV4lTjl71cM33dA7zKdi/qyBGmT/xJD6/r/00Jiu
P4E0kMVScygEsM7WpZu/VuhxMtCTwihTUwfusVdFP7lCPmi2DSjmd17dxxGze0xt
8BK80lWIjtTMQkmQd8RA6hAMF8kgsPk/DJRs8W4O9XIidUsmsfPx4RmgiIs0ykNw
xgsreCBs5jaoOnWoo59JkPlpheftwnTOCqtXunSHZ3gGoxQ+KWk2cuCqDCa1kXBR
9n1ZdqRfhYg9TRQRCbk2
=2wXm
-----END PGP SIGNATURE-----

--KSn4sQg3MnruwCB4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
