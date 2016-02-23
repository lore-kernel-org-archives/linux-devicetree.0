From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Tue, 23 Feb 2016 11:18:05 +0200
Message-ID: <56CC23CD.5010708@ti.com>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
 <1455541259-8967-7-git-send-email-architt@codeaurora.org>
 <20160222025345.GB15973@rob-hp-laptop> <56CAB678.3080505@codeaurora.org>
 <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0635041945=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>, Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--===============0635041945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XrbWEQFpv8OgppQH6KDJXUwBtQDlF670J"

--XrbWEQFpv8OgppQH6KDJXUwBtQDlF670J
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 22/02/16 22:10, Rob Herring wrote:

>> If we want all DSI host controllers to use a common binding to describ=
e
>> lanes, we'd need to go with the most flexible one, and the driver
>> restricts it to the subsets that we support.

True, but I wonder if that's necessary. The lane property for the SoC
should be read by the SoC specific driver, right? So the DT property can
be anything. I'm not sure if there's ever a reason for a generic code to
observe the DSI lane setup.

That said, if we do have a common binding, it's perhaps easier for
people to understand the setups for different SoCs.

>>>> +    a limited number of physical to logical mappings possible:
>>>> +
>>>> +     "0123": Logic 0->Phys 0; Logic 1->Phys 1; Logic 2->Phys 2; Log=
ic
>>>> 3->Phys 3;
>>>> +     "3012": Logic 3->Phys 0; Logic 0->Phys 1; Logic 1->Phys 2; Log=
ic
>>>> 2->Phys 3;
>>>> +     "2301": Logic 2->Phys 0; Logic 3->Phys 1; Logic 0->Phys 2; Log=
ic
>>>> 1->Phys 3;
>>>> +     "1230": Logic 1->Phys 0; Logic 2->Phys 1; Logic 3->Phys 2; Log=
ic
>>>> 0->Phys 3;
>>>> +     "0321": Logic 0->Phys 0; Logic 3->Phys 1; Logic 2->Phys 2; Log=
ic
>>>> 1->Phys 3;
>>>> +     "1032": Logic 1->Phys 0; Logic 0->Phys 1; Logic 3->Phys 2; Log=
ic
>>>> 2->Phys 3;
>>>> +     "2103": Logic 2->Phys 0; Logic 1->Phys 1; Logic 0->Phys 2; Log=
ic
>>>> 3->Phys 3;
>>>> +     "3210": Logic 3->Phys 0; Logic 2->Phys 1; Logic 1->Phys 2; Log=
ic
>>>> 0->Phys 3;
>>>> +
>>>> +     Here, a "3012" mapping will be represented by:
>>>> +     lanes =3D <0 1 8 9 2 3 4 5 6 7>;
>>>
>>>
>>> I'm lost here. What does 8 mean for example. The index represents?
>>
>>
>> The numbers here describe the logical lanes. I.e, the way in which the=

>> DSI controller pushes out data to the PHY. The ordering is as follows:=


If I read you right, I think that's vice versa. At least the OMAP
version. The OMAP doc says:

"- lanes: list of pin numbers for the DSI lanes: CLK+, CLK-, DATA0+,
DATA0-, DATA1+, DATA1-, ..."

This means that the first value in the array is the pin number for CLK+.
In other words, CLK+ wire going to the panel/encoder is connected to pin
number X.

What the pin number means is SoC specific. CLK+ could be connected to,
say, SoC pin number 123, and then you'd enter 123 as the first value. On
OMAP we use DSI block specific pin numbers, so they start at 0.

> Okay, so the confusing part is the description is all about lanes
> (0-3) but the binding (index and value) is all about pin/signal
> numbers. Either simplify the binding to be lanes or describe the
> binding in terms of pins.

Perhaps "lane-pins" or something would be more descriptive. If we want
to make the description common, I could change the OMAP implementation
to accept the new property name too.

But, I'm not sure if a common description helps much. Any thoughts?

 Tomi


--XrbWEQFpv8OgppQH6KDJXUwBtQDlF670J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWzCPNAAoJEPo9qoy8lh71gLIP/0mWk1sOqYHjE+8qNtiH5jMO
DHViNiM5SeDXW6HYRgTOzBQpI1eGU4vkqFxD9Zc6CDq45hYsNOYhqltyeX2yUVO2
7fuCDsM/04k5ZbORhr9dzJ1I3wAvBJlEyNBkviVMzlajOdOcd3QaBiaPim/Vrd6H
EKckwmSvgehaXrJqA5gpc15QVJmp2qeYuwz0YyVcacKtot2pICIx+kzEPWEFGpKI
OA/Tc7KQjz5qdJhlyVWbdW3FVPlSz7xclRP4Z5irzGy1+wYdtm7OkPDAgYQfIm7A
HNJQVafuxIJ6ncKvMDLI/1O3ox/CGL/LFen/CcPc0cjmt6M8WngT5TiuXh4QAh/1
AMuPLOPGAiG0UNcANCK9j4qin6QNPB2ONwpNxcs+EkwBV3K23pz+qfJ4snhtsdQV
twM5ycGUthzhLNRfx02qh/uFNYCdc1Be+dJFpnHqn6NrES3HBJNEI64ml0Wi2Sxw
XjGp0pb+qlerstAQkuddMqsjlUx/xj3q/SI0LNLtGu/9l7OgqJzLXXradnGjSBew
maBSevno3EFT6cDwZNODdYWKPLX//t4SZe/H7URctXSMlQpGJVyyXIrGDdvTzK4x
3QecMKZKgo7kLHCDOYurdnF5vC+vJT+iYLYMJ1YeNBEJqd25oqXwxYlVI24t15TG
ZtgQFvK+/57sI3toTVFk
=Xktg
-----END PGP SIGNATURE-----

--XrbWEQFpv8OgppQH6KDJXUwBtQDlF670J--

--===============0635041945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0635041945==--
