From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/3 v3] drm/vc4: Turn the V3D clock on at runtime.
Date: Fri, 28 Apr 2017 14:41:46 -0700
Message-ID: <87wpa4ky5h.fsf@eliezer.anholt.net>
References: <7906db2f-cfb8-e2e6-5869-b6e829dd8c6f@gmail.com>
 <20170424201209.31148-1-eric@anholt.net>
 <20170428182913.pv73xj45onxlnd3c@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0609937042=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170428182913.pv73xj45onxlnd3c@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

--===============0609937042==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> writes:

> On Mon, Apr 24, 2017 at 01:12:09PM -0700, Eric Anholt wrote:
>> For the Raspberry Pi's bindings, the power domain also implicitly
>> turns on the clock and deasserts reset, but for the new Cygnus port we
>> start representing the clock in the devicetree.
>>=20
>> v2: Document the clock-names property, check for -ENOENT for no clock
>>     in DT.
>> v3: Drop NULL checks around clk calls which embed NULL checks.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>  .../devicetree/bindings/display/brcm,bcm-vc4.txt   |  4 +++
>>  drivers/gpu/drm/vc4/vc4_drv.h                      |  1 +
>>  drivers/gpu/drm/vc4/vc4_v3d.c                      | 31 +++++++++++++++=
++++++-
>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt =
b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> index ca02d3e4db91..2318266f6481 100644
>> --- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> +++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> @@ -59,6 +59,10 @@ Required properties for V3D:
>>  - interrupts:	The interrupt number
>>  		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>>=20=20
>> +Optional properties for V3D:
>> +- clocks:	The clock the unit runs on
>> +- clock-names:	Must be "v3d_clk"
>
> clock-names is pointless for a single clock.=20

I thought the "-names" was the current style of future-proofing against
finding another clock to put in the list.  If I drop it, is the DT
change acked?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkDtxoACgkQtdYpNtH8
nuj46w//RCcU4j1lpRutx9zldOpXU8dYfq8JxuZ/8xSl5o97nfSI1vB+LpnbwXaV
dsny9iafrwYpj7//TASyZecU3ah0CW/TpMOaRvIL3FsGKJ2rlITp5mNu8X4kAmet
VNwbxH6rbgUJkOu0IRKsKvqyiIBVXAxXroGqYPlx4nsbdSd/KAROo2BbKC9XYbcj
6YIPJzeeqgYzTeXPt0b7v68oT2DP5HWXDVs3S1z1ymAdhX832xFGji7xU9Rld20W
e8k/LLYADqbdtOs/HnzG8DM4fAa/Y9a6/0D5LH4+FyUPIf8vABWAqmyQMMKTlCsd
gScUyqLBWJqE8AhTRnpH7b0XxZ29JeWoqLRp+jgZHT909G4oFg3epk3N6Ky54cnT
Iw7W2AOn9/CVP3m2ZDmEHMcHyjODdg9+YuAwJB4bIxO8w02U7FQA9Zd17V0k7dZk
UbijESC2z9F9Gwo5NxUupgYohMLrLMYXY+DHP0YHXh3uRnyNzBHJchfLK0kS23nQ
hO0zIZn5Ih1RuuEBQhYaDEs0IsQg82xH/v28PalHAB8DNv1e4r+6Qb4fazoh9i9T
WP6QLkQ5nlWbhBv4SJy0PXVIRJHJVe8pONy+VqDtrUH5cabAcx7KYjBEGjryp9Ur
LmpluJO8zjGLXzNtZgGExcl3DZpFGFQ9ZeqsFW6+8BPO2zvCk1g=
=2d+q
-----END PGP SIGNATURE-----
--=-=-=--

--===============0609937042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0609937042==--
