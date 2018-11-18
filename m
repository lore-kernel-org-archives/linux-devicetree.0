From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
Date: Sun, 18 Nov 2018 18:12:15 +0100
Message-ID: <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------DE07BBB8F39CF4FD41CA126C"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116231522.GA18006@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, matthias.bgg@kernel.org
Cc: mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com, sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, sean.wang@mediatek.com, sean.wang@kernel.org, rdunlap@infradead.org, wens@csie.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------DE07BBB8F39CF4FD41CA126C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/17/18 12:15 AM, Rob Herring wrote:
> On Fri, Nov 16, 2018 at 01:54:45PM +0100, matthias.bgg@kernel.org wrote=
:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> On SoCs with no publical available HW or no working graphic stack
>> we change the devicetree binding for the mmsys clock part. This
>> way we don't need to register a platform device explicitly in the
>> drm driver. Instead we can create a mmsys child which invokes the
>> clock driver.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> ---
>>  .../bindings/arm/mediatek/mediatek,mmsys.txt  | 21 ++++++++++++------=
-
>>  .../display/mediatek/mediatek,disp.txt        |  4 ++++
>>  2 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,m=
msys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.=
txt
>> index 4468345f8b1a..d4e205981363 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.tx=
t
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.tx=
t
>> @@ -1,4 +1,4 @@
>> -Mediatek mmsys controller
>> +Mediatek mmsys clock controller
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> =20
>>  The Mediatek mmsys controller provides various clocks to the system.
>> @@ -6,18 +6,25 @@ The Mediatek mmsys controller provides various clock=
s to the system.
>>  Required Properties:
>> =20
>>  - compatible: Should be one of:
>> -	- "mediatek,mt2712-mmsys", "syscon"
>> -	- "mediatek,mt6797-mmsys", "syscon"
>> +	- "mediatek,mt2712-mmsys-clk", "syscon"
>> +	- "mediatek,mt6797-mmsys-clk", "syscon"
>=20
> Doesn't match the example.>
>>  - #clock-cells: Must be 1
>> =20
>> -The mmsys controller uses the common clk binding from
>> +The mmsys clock controller uses the common clk binding from
>>  Documentation/devicetree/bindings/clock/clock-bindings.txt
>>  The available clocks are defined in dt-bindings/clock/mt*-clk.h.
>> +It is a child of the mmsys block, see binding at:
>> +Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>> =20
>>  Example:
>> =20
>> -mmsys: clock-controller@14000000 {
>> -	compatible =3D "mediatek,mt8173-mmsys", "syscon";
>> +mmsys: syscon@14000000 {
>> +	compatible =3D "mediatek,mt2712-mmsys", "syscon", "simple-mfd";
>>  	reg =3D <0 0x14000000 0 0x1000>;
>> -	#clock-cells =3D <1>;
>> +
>> +	mmsys_clk: clock-controller@14000000 {
>> +		compatible =3D "mediatek,mt2712-mmsys-clk";
>> +		#clock-cells =3D <1>;
>=20
> This goes against the general direction of not defining separate nodes =

> for providers with no resources.
>=20
> Why do you need this and what does it buy if you have to continue to=20
> support the existing chips?
>=20

It would show explicitly that the mmsys block is used to probe two
drivers, one for the gpu and one for the clocks. Otherwise that is
hidden in the drm driver code. I think it is cleaner to describe that in
the device tree.

--------------DE07BBB8F39CF4FD41CA126C
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFuECLIBCADD/t6l9ZYo+koZfGSuIrxbdrI1wR3iCxem+yKPz6cTUtRE6HNe
fRKM83CjBt5iPFFwBkofXFoTGS/9zKcoPAWM9QK2f6ibkmUIYH4mNZfYmYbVWg/e
nWQru5SLl8LzNKIQm3adJKL+PiLMiDuoSJ7Z6sD8dhxxjZgCn12ulKzJuzjTp9+v
AlByTWs0U4UibjZyJrcGN5ZL3lbYDqHxAVLeN5os+VezXYXa6GglscmSv8QdVMui
XY37mNkhBGr7MD81JckqXn/95Z+nWpRE3upHSxGtUNfkoW4PNpBOa8jPO1TBA4f0
0xZtDB7bFNzZYtdsJ2LnyXqsrwWoxPQiRoQFABEBAAG0KU1hdHRoaWFzIEJydWdn
ZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+iQFUBBMBCAA+FiEEhdxoJL7wYu3O
B7UPj8JuPkuXuCkFAluECLMCGwMFCQHhM4AFCwkIBwIGFQoJCAsCBBYCAwECHgEC
F4AACgkQj8JuPkuXuCk3IwgAkW6Q3folu6SMcIVa47KQIms7K3qUgXoi4nt8HbET
T1wm83ZmHXyI2S3ibzR+9yhbrqZZ7d6mHMjwvEnS3RVGw1dUGs9DgliREeyErC/5
SHTXYm2EvsPVCUd9yEe0VabhtTdLk5saQC1SncMnjorIWCWHyuBbIEIzSYmiVZlw
VbcD9kDYSKHmi/RSv0EeyedKW6aanbkB9j+M0NaRbCPbsmDrfJY31T8Jf66bLH7h
WfI6HURtQuvhSRzYWypp9yO6ndizoMmv1NQk/OO40j7QCVzaOmqJxc41FAxz57cg
6fN4ic/o7KNf6ZXoTuicb0Ft9gpUNtSj72dQymhdaXGFcbkBDQRbhAizAQgAv1Bs
N6c451tfbXWM754NxHhXVwhR/JKKD+PpHsYh1BSSvE7wwu4dW1Uu60GPeRM0jq7g
pfu5BB2X6V2qL2mO8FdVf83Xp4h6nsEl220Ep1dq8zXBajX9cZVkzbkEXRs751xx
o4HzOP6sTjimQLG1ALWdAZtE4HSyIafh4GWs0uPFYYSie7w1no4pXzLBTAcQ1PB7
hMw9pHBu3Lx7FsgWU4k3riBGSklr1AEbJl0Z3wEuV7wC6BLUAqvQ/lmkf6Dg7URa
aKzlgkDh4g/L5k3VeznJBLITTMprbN97zV13mvss9FCKduRY+YcAXpTVtOlLeIPD
L/0AATCO2Y/WiAndgQARAQABiQE8BBgBCAAmFiEEhdxoJL7wYu3OB7UPj8JuPkuX
uCkFAluECLMCGwwFCQHhM4AACgkQj8JuPkuXuCk1TQf/es2YD5q3GFce9wxGsm0j
pPo8xuP1KKeORIMPXieHqVphlRgZp/ppWnSU3ZwgG8y65+8nW2iFJGmNyRxtgDiY
J9Ji33ulefz66oDlC7YNZhA4MKFVW7A2pjvQSEkXmadk3N0RNBZQ6LKAY0+/2EbF
atb6Cm46qahc/AkXegmLWaP/frb3p7peT6KCu59m94m6sj8yPre0USp6CiqkZK4G
wF7sUgU1BwTveTZFwlnV1LySmZVBE7Ro7de/24HDO/1U2iUfvatlfkT2OrrkA7O4
zBJY75tooUAUNcYczF+WAtHKBNyJwHo1ZXyRCUgddw9JosmapYAwOkZgYlVzSWxS
Ww=3D=3D
=3DapZK
-----END PGP PUBLIC KEY BLOCK-----

--------------DE07BBB8F39CF4FD41CA126C--
