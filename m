From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix DTC warnings about missing phy-cells
Date: Mon, 30 Oct 2017 17:21:17 -0700
Message-ID: <8760aww4jm.fsf@anholt.net>
References: <1509277745-6730-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509277745-6730-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> This patch fixes the DTC warnings about missing property #phy-cells.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

I'm not seeing warnings, but this seems reasonable to me.  Waiting for
-rc1 to apply (sigh).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAln3wf0ACgkQtdYpNtH8
nugkhhAAk+Pp7ed49hKT0+AqB7mDSdmvkacFfcujI2LHU81c06v3XTBzkpnA4/vg
QM4jYNFNdVsmmvd6lgDFoMBHjPxFcIY+H6iIx/c1FtvXIykMISmdbrJ5Z2QOpRdR
3EsPQwMaT8wgwyB/VYo4xfPORMWqgZ2DUzolZRIvGECyOLBhBQyCY/kDFe3pxOzO
S0IX9tyS/7sxgoPu7G/gnkjTbBPzUF0vvWo03fgRV+muB/lC8gwZutfODwuhmmTN
PasiYDsRZD+PmP9Z0U3zqKyAtF8q6PqjL0IIRI5OB9HIi6QKyjOEvAtPfimqV8+D
/8hjN0ah3h4OCJvyu2pW7aGfNOX62tcwOW1R6nWpvdYQD8BioNZAOQWNi/l4paun
TU8h6XG0pbPT7K/nXTVvOvYsHvG1um4gUKPY6+bHmz9N2KRPwpG6atjfPjWgfPxt
whtrXMx+pMjp6kVcuhTNMSq2dQQFGq/6MQEbvFJZMrsFJ1PnpMKw/KBsKLCex6cm
qjNrpI61TA9mDNxeT5fDa9kH4qWA/mbmdQ0Pjah4qJj5t0TiKQ3uCyMdvrLDv27G
uytoowIF9L7HhpW+4xYu0B8Ss6P3msjSROB5lJ9FTMoqfwkg1lSgrwbJy4ZuBiM4
5IbbNSzgEmJJVsXDBE3t7ACgRAZ+UZclOLcP4VkWU7Lc7uR/cew=
=Xa63
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
