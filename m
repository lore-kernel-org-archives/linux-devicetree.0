From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt moderation
Date: Thu, 27 Oct 2016 13:47:08 +0300
Message-ID: <87eg32t6fn.fsf@linux.intel.com>
References: <cover.1477424426.git.johnyoun@synopsys.com> <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> Add interrupt moderation interval binding for dwc3.
>
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index e3e6983..17de9fc 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -53,6 +53,7 @@ Optional properties:
>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of G=
FLADJ
>  	register for post-silicon frame length adjustment when the
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
> + - snps,imod_interval: the interrupt moderation interval.

on top of all other comments, what's the unit here? nanoseconds? clock cycl=
es?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYEdssAAoJEMy+uJnhGpkGRpoQAMmffIex17eeMtfO9xPkrk5C
MqCA0vzq3v6diixMhOTWiyBE4BhtcNt5gXnBtqJeNvXz1M5jSQ2dQexksYLCASBn
rjPIDBA2/XQEWZbw86XAV1W1dYS5zdVh1aGvs49DH3GIqqfFp0XKlFPmpKM1FfXo
fNR28TTiprflwVeM9Yx9cpXL75YiRwRZ/Sv6Ay8/Rfwqdxi/v1PlelN1YFoMRuCr
kPtsQ2qN76tC+itdsxksavxT5QPDU8xaFQXMeuxKBwzS2+Gv2vju/6272vixXsrq
Oryh+5jNrRKB5zuyTCpPDn+crYqpox3NbEoF+wGO55uc40SbJWTN8eMMOyrS4J3w
Gw7Y4H3W6OiLuGJBCAtsxTEpzyVP+MZuevzdCguerbMQNCcS5nI8TLp3VuJvGyBB
F69lnEl2YMnIURDWDbJV4El1gO2s+E48ht08eaLZvLyCJNkYsByZpTMps8hnNfgi
V+k5C7vyd/1AsSC/gBkf4pxADyXb9/H7Nw9tqk/zCqUnxagS1vu3TSqdvGFlCOPU
NaE+m34UqgTY5dN83b4snsQw2iGiG7u16hMhkv4777/S9ku2qypv0ecY6hreSHNJ
hv7GxrO8n8obCUFB488JXQcIjzlPfJ+rowWpOY5g0f+GVP8OTMmgXWKMkPYTvdu3
l61eGftsw43MkD0iox6Z
=HgmV
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
