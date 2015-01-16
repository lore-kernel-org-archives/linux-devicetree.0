From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: Add vendor prefix for Shanghai AVIC
 Optoelectronics Co., Ltd.
Date: Fri, 16 Jan 2015 12:14:04 +0100
Message-ID: <20150116111402.GC4885@ulmo.nvidia.com>
References: <1418917423-26583-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418917423-26583-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 04:43:42PM +0100, Philipp Zabel wrote:
> Shanghai AVIC Optoelectronics Co., Ltd. is a subsidiary of Tianma
> Microelectronics Co., Ltd. and designs and manufactures TFT LCDs.
>=20
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Hi Rob,

Will you Ack this so I can take it through the drm/panel tree, or would
you rather pick it up yourself?

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 78efebb..2ce15a4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -23,6 +23,7 @@ armadeus	ARMadeus Systems SARL
>  atmel	Atmel Corporation
>  auo	AU Optronics Corporation
>  avago	Avago Technologies
> +avic	Shanghai AVIC Optoelectronics Co., Ltd.
>  bosch	Bosch Sensortec GmbH
>  brcm	Broadcom Corporation
>  buffalo	Buffalo, Inc.
> --=20
> 2.1.3
>=20

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUuPJ6AAoJEN0jrNd/PrOh+MsP/06HkgfHtX5eZ81OXs+DwBoM
K7DG78XUCkq73RRDqcSEMe0YIvbttePM2M6DMEOvF1qCHh6LYUPfu8p/5EtWGzgU
EP0fCo8KkUQsBnig2znwXMdVRycWfdMmu/1wt3o94H42AX2V/x4kpJbKJiHRQqlc
imtWRPVST9H3xIzDguZ1oEDW+W/L0/UgM7lq04vdNUzIxNznzSTnZVN2PDSHOCsx
6WxGkWTH33nVC6N4Ab0NUtvCCk7aOu/q9ldjj1Tmh3liamo6sDpHEIZwJLk5o0Sb
14S/1a2xp4C3wWo2DzNE+CSc6dLEWn6QRSsbABkMHAdenLMb1OL/UEoadh3VWawK
tzGxzOdKEKPsFChwNEjf1+J9jMNFxwCzAnyZrlr9u8jZetw0g/CyXHDCzcmn4ahv
tD4VmTzcIiVI3YsEiQiSGGuNXJgSD6lsltHqsxcG0fQfLbhy/4Q2qY+TjOsYdrEx
misQF3oBU9gpyVkZlhi7lcfSEbNJQEeGOTrUrfNYdp/OSWdbYfbGxgfaMoTUJvrq
be5RecoXhPbyZfmjDwg7irK34qygQp+QortP6V6G23E7ptA4jkL3zkr2yaMUyZAR
h57JelTiQvs4f/RRbqVDaJ8LiZypuPsBCbtDKcOAwGErVkJvY07IeaM1YYeLJgu+
y4DQ8Y/fCWbd9xgGmWem
=oFRX
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
