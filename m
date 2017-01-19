From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Thu, 19 Jan 2017 17:02:39 +0100
Message-ID: <9b9f7542-9a13-9f76-502d-85abb1d45a80@baylibre.com>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
 <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
 <20170119155103.e6hctoqllfgypesm@lukather>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5951776235835533805=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119155103.e6hctoqllfgypesm@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Boris Brezillon <boris.brezillon@free-electrons.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Carlo Caione <carlo@caione.org>, =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5951776235835533805==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="rwIQ2IxUrbPWnoOMAh7259AoM6EP3jxV2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rwIQ2IxUrbPWnoOMAh7259AoM6EP3jxV2
Content-Type: multipart/mixed; boundary="h6cG1RD5u0rlDoxwUR7GESTi7esHsMr9X";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Kukjin Kim <kgene@kernel.org>,
 =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>,
 Carlo Caione <carlo@caione.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <9b9f7542-9a13-9f76-502d-85abb1d45a80@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
 <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
 <20170119155103.e6hctoqllfgypesm@lukather>
In-Reply-To: <20170119155103.e6hctoqllfgypesm@lukather>

--h6cG1RD5u0rlDoxwUR7GESTi7esHsMr9X
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/19/2017 04:51 PM, Maxime Ripard wrote:
> Hi Neil,
>=20
> On Tue, Jan 17, 2017 at 11:22:22AM +0100, Neil Armstrong wrote:
>> On 01/17/2017 10:38 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
>>>> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
>>>>> The ARM Mali Utgard GPU family is embedded into a number of SoCs fr=
om
>>>>> Allwinner, Amlogic, Mediatek or Rockchip.
>>>>>
>>>>> Add a binding for the GPU of that family.
>>>>>
>>>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>>> ---
>>>>>  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++=
++++++++++++
>>>>>  1 file changed, 76 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-=
utgard.txt
>>>>
>>>> Do you have a driver in kernel which will implement these bindings?
>>>
>>> No, but we have bindings for out-of-tree drivers already.
>>>
>>>> Defining them for out-of-tree driver does not bring any benefits
>>>> (3rd party driver will not respect them anyway).
>>>
>>> You could see it the other way around too. The out-of-tree drivers
>>> don't respect it at the moment because there's no binding to respect.=

>>>
>>> And at least for us, we definitely plan on doing that.
>>>
>>> Maxime
>>
>> Hi Maxime, Krzysztof,
>>
>> We hope this will be accepted so it will solve the same issue we
>> have on Amlogic SoCs and all the other mali powered SoCs.
>=20
> Do you have any requirements (or weird case) that is not covered by
> the current doc?
>=20
> Thanks,
> Maxime
>=20

Hi Maxime,

Apart the GPU DVFS, all is covered by the current doc for the Amlogic Mes=
on GXBB and GXL SoCs.

Neil


--h6cG1RD5u0rlDoxwUR7GESTi7esHsMr9X--

--rwIQ2IxUrbPWnoOMAh7259AoM6EP3jxV2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJYgOMjAAoJEHfc29rIyEnRk5AP/iPf7Ea0pM5Gi0cN9s/eq7oy
Zk032XcZR3pzgNJgCxoD8qUSLZReF4xMYPOBlX7kf4A6ajzr3GpX9pd0tnkg9jVQ
nLH4k/pDbRXq3F/CJbTLPktvNv8iCbeoxSRExbWAnJ1VYCNIoR+Py7WUnvp774gk
46MC0thwghbZUwzueWfIkOLg++lLs9XxjrzmZi4p2cOsMRGuDQVSs3rs5ToDYf2o
WeSF3+A3eG4kD9RTbtqdbWJfTiwu3C4lkMfe1uBFAwvbpvzfs7pm3hn3m6OTblhy
z9kE4yGXnS0yVkl34ou65td7vOr7h2zS4JIS30Rkie2BOdpHT9Fv91xx4JfhfTHM
/MoRooR4q2an0Bkj5j8JCCzsOnws8VLE6BMI0Q/8pShxXX3dq4QHJGntF2jBmW9K
tTVSzMYTuwVPjQtdf6WEmcRHoM2MHGq/4zpJEigIJGHQgPtcULECtVTnwgLwB0Pc
gdC4J39dJlctSqv2OM/Jw4Du0T6KCRCRgkjoYy5cePT0RlSAYxRaFQ6zdFVQBKJc
yadLo1ZaNkfjEUB9zt/SrYIYshKwAFGcQHzd9GHPvy2TBPz8FJWNSBrsxNtwmWZD
ozumD/1RGuQpsPlPBJbqBeHgCNWe0fQIgQJg9w1svaY3sEDSgwGTM5lVUjyqcwXq
rlAr+En2e+yGy/+f7Qww
=TE6e
-----END PGP SIGNATURE-----

--rwIQ2IxUrbPWnoOMAh7259AoM6EP3jxV2--


--===============5951776235835533805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5951776235835533805==--
