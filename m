From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/7] drm/tilcdc: Add blue-and-red-crossed devicetree
 property
Date: Tue, 30 Aug 2016 15:46:36 +0300
Message-ID: <d488f8b8-0a16-3554-4cb4-cf5fdcbf7840@ti.com>
References: <cover.1472126231.git.jsarha@ti.com>
 <d5e79ebd165f772758014f087a7f0fedba3efc84.1472126231.git.jsarha@ti.com>
 <CAL_JsqJyUz_PKHsT_kk=204C7dxa9_Wdh2UMvptV3oKjYV=CFQ@mail.gmail.com>
 <f4f9d53e-bc9a-6b88-7fe4-3f3015abfdb5@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="5GPDDLPgguWtci7xGaRKGrqoJ5vFrTDCL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f4f9d53e-bc9a-6b88-7fe4-3f3015abfdb5-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--5GPDDLPgguWtci7xGaRKGrqoJ5vFrTDCL
Content-Type: multipart/mixed; boundary="JNBsKs642w5Rb4hUtRgPwE4h4VSHUELLA";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>,
 David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>,
 Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>,
 Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Message-ID: <d488f8b8-0a16-3554-4cb4-cf5fdcbf7840-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/7] drm/tilcdc: Add blue-and-red-crossed devicetree
 property
References: <cover.1472126231.git.jsarha-l0cyMroinI0@public.gmane.org>
 <d5e79ebd165f772758014f087a7f0fedba3efc84.1472126231.git.jsarha-l0cyMroinI0@public.gmane.org>
 <CAL_JsqJyUz_PKHsT_kk=204C7dxa9_Wdh2UMvptV3oKjYV=CFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <f4f9d53e-bc9a-6b88-7fe4-3f3015abfdb5-l0cyMroinI0@public.gmane.org>
In-Reply-To: <f4f9d53e-bc9a-6b88-7fe4-3f3015abfdb5-l0cyMroinI0@public.gmane.org>

--JNBsKs642w5Rb4hUtRgPwE4h4VSHUELLA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 26/08/16 20:44, Jyri Sarha wrote:
> On 08/26/16 15:51, Rob Herring wrote:
>>> --- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
>>>> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
>>>> @@ -17,6 +17,8 @@ Optional properties:
>>>>     the lcd controller.
>>>>   - max-pixelclock: The maximum pixel clock that can be supported
>>>>     by the lcd controller in KHz.
>>>> + - blue-and-red-crossed: Boolean property, set this of blue and red=
 wires
>>>> +   for LCD_DATA are crossed for 24-bit RGB support (and 16-bit BGR =
mode). [1]
>> Doesn't this need to be blue-and-red-straight for compatibility?
>>
>=20
> There is no way to be backward compatible with all am3 based devices.

Hmm, I guess it would be possible to have three options:

- No property set: driver advertises RG16 and RG24. This is wrong, but
that's what the current status is, right?
- Property set to "default" or "straight" or whatever: driver says RG16
and BG24
- Property set to "crossed": driver says BG16 and RG24

 Tomi


--JNBsKs642w5Rb4hUtRgPwE4h4VSHUELLA--

--5GPDDLPgguWtci7xGaRKGrqoJ5vFrTDCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXxYAsAAoJEPo9qoy8lh71HRcP/RDuNAviZle31YVT54JNu98f
YHvq1qyLXdnN3cPecmAaEfkHSa76Hb3BbYaH+v/DtUY5h3TLLVbpEHA/hhYHJU0M
ixK+W3eC8xkMp29f4tTMo7QUlQY6OVx5WtOECOzby64g0S1q0Nw/Nfa/s5QGOP6F
ZSERQgv1c4iTOBZN4K0iQ7hUJ9N3AbmTl7YrYeKiuKTNfRVnx8YRGabn2aJAxpZS
LOh7jnTQmWLOlBSv53z04053HQa9NjsQDGlkWmZKVZo/7JWlIzW6v7pfYVOk4IJi
O0MS4ZoRDYGUkeSiKUkKMKgw1d5no3lDjnNDDtA87YTJsGFZlrx8RzYECT8WsW09
cBnMmA3rgQLRkqi1ilfVSngWFbmJrjMk7wjwRbkMlcxEduuICoUlpB9f+jtugaq2
08ZdDw7RgAEkpd8TJaLpSPg2IxsEh26Je2fxS+r5gYu9GOcZqB5sCOkNt+pE4O8D
rxUcYa6L4BIfHH56KzCJta9eb2ucbNVMbxq/q15jxaave60TBsr/w643+OileXK9
/DO0dm/edrcAW5m9ljbHFvWBBPz76pLfABlCKLctVUDQ9zuKwnXQ/P5JE8CJGycR
Q3w4p4ak/gtSGRSz9WyMIIdTLhf/C03+qAv48Mq3gpH84b5hDfHlDvjJioi5Fwfx
tgz9kqQCu0x8toCvUNex
=yduF
-----END PGP SIGNATURE-----

--5GPDDLPgguWtci7xGaRKGrqoJ5vFrTDCL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
