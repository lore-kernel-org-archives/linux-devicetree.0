From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 02/17] dt-bindings: display: renesas: du: Document the
 R8A77965 bindings
Date: Fri, 27 Apr 2018 09:40:11 +0100
Message-ID: <366c0a0f-f179-7796-fc06-94b3d949fc7f@ideasonboard.com>
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
 <20180426165346.494-3-kieran.bingham+renesas@ideasonboard.com>
 <e94ae62f-30bb-5056-9646-03941d74ae75@ideasonboard.com>
 <69317997.GXJe2a7Jrz@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0822818070=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <69317997.GXJe2a7Jrz@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0822818070==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="CKxIVZoB72RoTArDOvlPH2QMEqNAZ6hDL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CKxIVZoB72RoTArDOvlPH2QMEqNAZ6hDL
Content-Type: multipart/mixed; boundary="pLp2pVKpxOWVRmxM8HJns8ahRdgVMottG";
 protected-headers="v1"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <366c0a0f-f179-7796-fc06-94b3d949fc7f@ideasonboard.com>
Subject: Re: [PATCH 02/17] dt-bindings: display: renesas: du: Document the
 R8A77965 bindings
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
 <20180426165346.494-3-kieran.bingham+renesas@ideasonboard.com>
 <e94ae62f-30bb-5056-9646-03941d74ae75@ideasonboard.com>
 <69317997.GXJe2a7Jrz@avalon>
In-Reply-To: <69317997.GXJe2a7Jrz@avalon>

--pLp2pVKpxOWVRmxM8HJns8ahRdgVMottG
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On 26/04/18 21:10, Laurent Pinchart wrote:
> Hi Kieran,
>=20
> Thank you for the patch.
>=20
> On Thursday, 26 April 2018 19:57:32 EEST Kieran Bingham wrote:
>> Ahem - this one seems to have lost it's commit message.
>>
>> Apologies :)
>=20
> Apart from that, this looks good to me.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> and applied to my tree with the commit message
>=20
> Document the M3-N (r8a77965) SoC in the R-Car DU bindings
>=20

That's perfect, thanks - and saves me sending a v1.1

Regards

Kieran

> Let me know if you would like a different message.
>=20
>> On 26/04/18 17:53, Kieran Bingham wrote:
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.co=
m>
>>> ---
>>>
>>>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt=

>>> b/Documentation/devicetree/bindings/display/renesas,du.txt index
>>> a36a6e7ee54f..7c6854bd0a04 100644
>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
>>>
>>> @@ -13,6 +13,7 @@ Required Properties:
>>>      - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
>>>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>>>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
>>> +    - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
>>>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
>>>      - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
>>>
>>> @@ -59,6 +60,7 @@ corresponding to each DU output.
>>>
>>>   R8A7794 (R-Car E2)     DPAD 0         DPAD 1         -             =
 -
>>>   R8A7795 (R-Car H3)     DPAD 0         HDMI 0         HDMI 1        =
 LVDS
>>>   0
>>>   R8A7796 (R-Car M3-W)   DPAD 0         HDMI 0         LVDS 0        =
 -
>>> + R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0        =
 -
>>>   R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -             =
 -
>>>   R8A77995 (R-Car D3)    DPAD 0         LVDS 0         LVDS 1        =
 -
>=20


--pLp2pVKpxOWVRmxM8HJns8ahRdgVMottG--

--CKxIVZoB72RoTArDOvlPH2QMEqNAZ6hDL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEkC3XmD+9KP3jctR6oR5GchCkYf0FAlri4esACgkQoR5GchCk
Yf00AQ//X+oc+ghTn1uTwxozzYplHfGDBCbJkcparx4gxwS+gzbeIL8AIg3CcKWq
8nY1xMv380KKRemJIjQaAxvIpgAljTy1BUqGf+n7M12fKJcn4jmX3d6g2l4HZbcf
WgzsUB34QVtiMQRKHs52U5AkOAXo5L3fBqgL8nN0yWpQ+I5HTciZDY/S/LLIPpFB
HfNJsMdDo53d9OAwWQ9funTH6/c7uP1qwzNy3g7ZV1YfkMGmrkZG++rzJ7w51dDw
tRh6yl/BzVePvuBMwFQYO8FXKmeaHH4gPS5alvzVRmZf1GGyb50DretF4/6zV/rb
XO+leHtGkQ8NBx1DGhVNd2YSRjM3wG8VaCk4KsYzJf0r9it1pekqVijoMhv9zGQ8
yllfndPITV2zcncxweMNoQcCZAMpt6S/gMzsbfL4JyVIupVrKiPUioxivFW/ja38
j61fETqw9TYl0wgL/U/lJ+ynFBwwD1PrQLv/DHiLvzqh4CLNX8D84u3gkWjcWiYW
5bIPrYJ6uiNz/CCbA0H7yXYkrUq/ZvJgof9PRvlV50mm/WsRYaxtOtz84NNmw8it
9IIPVKgyGGdMSHsQarPWn/cQ3xiBYnzPYcEjR1hSaodZ8cJwT1/LizAPV8YfSSdD
trrdbbGaN77wtxoxC80dGn0se7/QzXWt/MxzN13DRq2OrHtKV2M=
=EFgz
-----END PGP SIGNATURE-----

--CKxIVZoB72RoTArDOvlPH2QMEqNAZ6hDL--

--===============0822818070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0822818070==--
