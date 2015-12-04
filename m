From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 11/12] MAINTAINERS: add Lucas Stach as maintainer for the
 etnaviv DRM driver
Date: Fri, 4 Dec 2015 18:26:38 +0100
Message-ID: <5661CCCE.3090607@pengutronix.de>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
 <1449237604-19064-12-git-send-email-l.stach@pengutronix.de>
 <20151204170709.GY8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="5QukKuA098pJTLXKjOKwS1k1rCvpqADcA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151204170709.GY8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5QukKuA098pJTLXKjOKwS1k1rCvpqADcA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/04/2015 06:07 PM, Russell King - ARM Linux wrote:
> On Fri, Dec 04, 2015 at 03:00:03PM +0100, Lucas Stach wrote:
>> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> Acked-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>=20
> Although, I would like to be copied on patches, I don't think we
> have a way to encode that information in MAINTAINERS.

I think you can just add another
"M: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>" next to Lucas. We have this
for the CAN drivers and it seems to work.

>=20
>> ---
>>  MAINTAINERS | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e9caa4b28828..1c69563c61ed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3741,6 +3741,13 @@ S:	Maintained
>>  F:	drivers/gpu/drm/sti
>>  F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
>> =20
>> +DRM DRIVERS FOR VIVANTE GPU IP
>> +M:	Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> +L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> +S:	Maintained
>> +F:	drivers/gpu/drm/etnaviv
>> +F:	Documentation/devicetree/bindings/display/etnaviv
>> +
>>  DSBR100 USB FM RADIO DRIVER
>>  M:	Alexey Klimov <klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>  L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> --=20
>> 2.6.2
>>
>=20

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--5QukKuA098pJTLXKjOKwS1k1rCvpqADcA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJWYczOAAoJEP5prqPJtc/HBuwIAL8+dRb5NN3kiHiVg3OdqTm2
UAO0mF11tr7fLP5gqUWsSQngTvEGUu7KVUcnb87e8yE5SHnHDoKGlaHCNkM9P4TN
aF6To/XRcq3xMnzn/hOpEIVsm1h4j1dLAX7xLvg/r7sInHcWYcjVu7mo2HvEPcVJ
h7poE1Nt/An/xfLxRK9TpudZWQ3n3YsaQ2ceD4DZpGQ77lBc7vPba3GBEQfFoV9a
jouOezL5Z0d2sWLYVphqkp2EZbBdr3D/6207Cch2OFJTHm1PGag/kMYLqXOEqWgb
52X+F2D7Hs+jkr4PeYu0m3seerpvHqaX3OxE+gIKk0B4xBNB8mhLF81cws3p8B4=
=Y9d2
-----END PGP SIGNATURE-----

--5QukKuA098pJTLXKjOKwS1k1rCvpqADcA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
