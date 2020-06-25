Return-Path: <SRS0=bF7C=AG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8543C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 02:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80901207E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 02:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="XjIWpPe+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389146AbgFYCJX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 24 Jun 2020 22:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389070AbgFYCJW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Jun 2020 22:09:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6789AC061573;
        Wed, 24 Jun 2020 19:09:22 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 49sk3N4z3cz9sSt; Thu, 25 Jun 2020 12:09:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1593050960;
        bh=Vo8FKJOqnaD6OEhhmrq5Gc+Uc/50NDamteK/u807kDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XjIWpPe+VR+f1/K308p56hJB/A9WvAfGKMsQ2KQDU7oaHpsAT/UKKEtVnOJjFdkr6
         o5yXY+iKtPFsyGD//xlztR4ZAawOvO9BPzUNIjdYtPCfiK94tO7SzIAMg0bF//uylg
         ufc+azGlElKHHsZc9P3irB4ZTLETjeVkp1E3fwcE=
Date:   Thu, 25 Jun 2020 11:42:46 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jon Loeliger <jdl@jdl.com>, devicetree-compiler@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dtc: Consider one-character strings as strings
Message-ID: <20200625014246.GD69292@umbus.fritz.box>
References: <20200623094343.26010-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline
In-Reply-To: <20200623094343.26010-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 11:43:43AM +0200, Geert Uytterhoeven wrote:
> When using overlays, a target-path property pointing to the root node is
> quite common.  However, "dtc -O dts" prints it as a byte array:
>=20
>     target-path =3D [2f 00];
>=20
> instead of a string:
>=20
>     target-path =3D "/";
>=20
> For guess_value_type() to consider a value to be a string, it must
> contain less nul bytes than non-nul bytes, thus ruling out strings
> containing only a single character.  Allow printing such strings by
> relaxing the condition slightly.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Makes sense.  Applied, thanks.

> ---
> Alternatively, guess_value_type() could check explicitly for "/",
> reducing the number of false positives.
>=20
> However, there seem to be plenty of other uses of one-character strings
> in DTS files.  The most common one is 'type =3D "a"' for HDMI connectors.
> ---
>  treesource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/treesource.c b/treesource.c
> index 2acb920d77752410..061ba8c9c5e83265 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -183,7 +183,7 @@ static enum markertype guess_value_type(struct proper=
ty *prop)
>  			nnotcelllbl++;
>  	}
> =20
> -	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul < (len-nnu=
l))
> +	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul <=3D (len-=
nnul))
>  	    && (nnotstringlbl =3D=3D 0)) {
>  		return TYPE_STRING;
>  	} else if (((len % sizeof(cell_t)) =3D=3D 0) && (nnotcelllbl =3D=3D 0))=
 {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl70ARYACgkQbDjKyiDZ
s5J5bQ//eb8xTYzTNrwsMhjp590rDLH8q0S+0vh3wbWvxoR3E4YVcIyVJtpPhyX7
2n8DMdNnoN83yfwvQOj8h/VVO8BRY157v0RvU5VK+vKT6my3skqFccGQxg0wS3/v
+vEa9gapGQUKnKeE+xKEGvBrOivMqgI6o5vs1DWzsV+NHmVRy8PCTBMx3BlxOhO3
Z0opCrv+TSlm/dRpBLAUr3nSKWKmw+SpBIcYnLeyxmEoXwWNIzJF+ZDGLqIYEl6e
JsqWlEN++dIdPx0RW1pRCAKMmnoMMUdChPEwbWRruRtkpP3G63q6WwMw0uyKz0vi
tTAalO3gZjkT7HW5t1o0TfQvx1lrH4WcWm1bExUqUvmnPn5uco06+A9dGv6idt93
OUdHl5q+PtvXpQAW0c8QRjLVrhJTmcJaJ7SXHPatLSCtWFW/5ARASKlZs7hhyVh+
3H/hCPJDZNbqykZBAxHD+OSfyfoXCcZCR1ytb48DIlfyhWsYCNIjgv3t360dyErr
kxvIP2I+sI8qr0lYwiOfXfpKU+bvUkgRSsSAJL43h1Nf00T3wyeLzsIj5TTqAiMh
lG+aydMx7Y6Pfsx+5h07TQj2UTuTNJb9PjJUtx+Gf9wCvArdIwTf7/WnNUFuGFk9
s9psyVWlDzO24UIFUE57hoIYatfOgI7PIVKcxyV6X/RZWLdCnYM=
=KO1b
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
