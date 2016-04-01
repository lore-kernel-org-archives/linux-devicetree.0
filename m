From: Tomi Valkeinen <tomi.valkeinen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc warnings
Date: Fri, 1 Apr 2016 10:49:13 +0300
Message-ID: <56FE27F9.2070100@gmail.com>
References: <CAL_Jsq+=OjY8y_8x7OSm-MWYKbrHN5cbv4TLwULxhNq+gfiMtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0peGLmgNqw77MlN9QwQPKBXT89RghVLlq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+=OjY8y_8x7OSm-MWYKbrHN5cbv4TLwULxhNq+gfiMtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arm-platform-maintainers-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0peGLmgNqw77MlN9QwQPKBXT89RghVLlq
Content-Type: multipart/mixed; boundary="Tdp6D8wc82uv26GtKco7Cl14XmEdIkBnB"
From: Tomi Valkeinen <tomi.valkeinen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arm-platform-maintainers-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Message-ID: <56FE27F9.2070100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc warnings
References: <CAL_Jsq+=OjY8y_8x7OSm-MWYKbrHN5cbv4TLwULxhNq+gfiMtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAL_Jsq+=OjY8y_8x7OSm-MWYKbrHN5cbv4TLwULxhNq+gfiMtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--Tdp6D8wc82uv26GtKco7Cl14XmEdIkBnB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On 01/04/16 04:40, Rob Herring wrote:
> You may have noticed that linux-next had gotten noisy with dtc
> warnings lately. I dropped the change for a bit, but added it back
> today except now it is disabled unless building with "W=3D1".
>=20
> There's ~25K (2500 unique) warnings generated from the ARM dts files.
> Here's the ranking of warnings by dtb. OMAP is the clear winner (based
> on the similar counts, probably lots of duplicates). Please help
> remind contributors to test with W=3D1 and start to fix these.
>=20
> At least for memory nodes, I plan to whitelist allowing no
> unit-address. There could be others, but none that I've seen so far.

What's the correct way to fix nodes for display platform devices? For
example, omap4-panda-common.dtsi has two connector nodes:

dvi0: connector@0 {
	compatible =3D "dvi-connector";
	label =3D "dvi";
	...
};


hdmi0: connector@1 {
	compatible =3D "hdmi-connector";
	label =3D "hdmi";
	...
};

Should I add the reg property, or should I rename the nodes to, say,
connector_dvi and connector_hdmi, or connector1 and connector2?

The index (reg) is not used for anything, but perhaps there could be
some use for it in the future (although I have no idea what the use
would be).

 Tomi


--Tdp6D8wc82uv26GtKco7Cl14XmEdIkBnB--

--0peGLmgNqw77MlN9QwQPKBXT89RghVLlq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW/if5AAoJEPo9qoy8lh71FOsQAJk8rNsmssTEHAXiscsGCNwI
77G8ZySxJ/bVo+g6BlLfbQOgFW30VhuNvzTL6lo1hP7sNEK7NLzW8Xyk3te6eDh4
/XS76xtXlfsag1nUPwNpPyifZ5OVRgae7/8bA+Dial1brB1JYbwOpzVZeVLVqPqF
diyvuoxLSwWV5gqapZJ8rt2YQWrbmc9dk6I0WYLFHAY8c7wHjgfiSq0OoTovhTee
8bzQ0AzhPn8qQE48+rSoGRB5poEqpzR07wUp+ftc9ZdLldsqaj67pzDoNXNliEB+
XhCvn1SggZWGm19moeWAh+6EWLnQG6fxto2MtYO4vYiWmD3BFHS9AOmXePRW7YsV
zfBu+yvN34A+hzO1UpM4VQ/z2cCRzieLQhB7BCSmZ7Ri9oyoaIfs5pA48ASwiB2K
TA41mSUdAgYHJ/VkXL5OC3Nc9411rZkne7Ivk/svikBYNmRTUJ+0hJQyqkjAOd5s
hxJXXuBipSD4lNB9dHiuEYkwbGY8zM9pDcPOcQaSLc2+QjVPBuW+C6p+e3E17wxZ
9ylIshROpvDBOYoF5ZguU3uAPhdJc22xMTRLP4J8T5s3W/m1WpeMFYkUjK7rFoE9
M4NtuH28bc4sOt0Pp//yLefTAXYOycgQEY4obdbMIaKoxbQm24+3jp5ustIEXvtd
RAaezVPGJ8cHTKfRDJd3
=0tyK
-----END PGP SIGNATURE-----

--0peGLmgNqw77MlN9QwQPKBXT89RghVLlq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
