From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 17 Jan 2017 11:22:22 +0100
Message-ID: <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3052969069068422119=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117093813.mxp2hgoxbgske6ru@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Boris Brezillon <boris.brezillon@free-electrons.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Carlo Caione <carlo@caione.org>, =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3052969069068422119==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="baXXHI3UuuLRgEm8nxSP2amn2dFvWsbhu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--baXXHI3UuuLRgEm8nxSP2amn2dFvWsbhu
Content-Type: multipart/mixed; boundary="x9vnPWnuS7wTTPCongaAbJObnTW22ExCu";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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
Message-ID: <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
In-Reply-To: <20170117093813.mxp2hgoxbgske6ru@lukather>

--x9vnPWnuS7wTTPCongaAbJObnTW22ExCu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/17/2017 10:38 AM, Maxime Ripard wrote:
> Hi,
>=20
> On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
>>> The ARM Mali Utgard GPU family is embedded into a number of SoCs from=

>>> Allwinner, Amlogic, Mediatek or Rockchip.
>>>
>>> Add a binding for the GPU of that family.
>>>
>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>>> ---
>>>  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++=
++++++++++
>>>  1 file changed, 76 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-ut=
gard.txt
>>
>> Do you have a driver in kernel which will implement these bindings?
>=20
> No, but we have bindings for out-of-tree drivers already.
>=20
>> Defining them for out-of-tree driver does not bring any benefits
>> (3rd party driver will not respect them anyway).
>=20
> You could see it the other way around too. The out-of-tree drivers
> don't respect it at the moment because there's no binding to respect.
>=20
> And at least for us, we definitely plan on doing that.
>=20
> Maxime

Hi Maxime, Krzysztof,

We hope this will be accepted so it will solve the same issue we have on =
Amlogic SoCs
and all the other mali powered SoCs.

Having mainline bindings will forcre out-of-tree driver to respect those =
bindings
and remove a dts out-of-tree patch aswell.

Neil


--x9vnPWnuS7wTTPCongaAbJObnTW22ExCu--

--baXXHI3UuuLRgEm8nxSP2amn2dFvWsbhu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJYffBoAAoJEHfc29rIyEnRI+YP/ixtCZyNAIKovl3s1CCBOYIL
PgQXHAa5NC9/bD+Q0K2WUciuyQE0u2YW66+CS+iXkdhoVev36KzzR/y9wif5T4ty
0dnBu4tk06v2pKJj5lZj9jmciU4aiwmmn0Teolxlw0RniX3uOpwei20RrG15b2du
uRXJfLJ98hPB/8FQII5isw7e+N33ydGMwe0kli9pa0mYi2hJN1oHTHHtQxXb24Mk
B3Q1aA7EkvvHEHgZ9Zsg4IiWM8KbKre92R+3xcBdGMRsMQJeJZucll66yW7YV5iM
zpb/k7U6mn/fEkfq/Xt9WtRVhIrlwWz9LWN5JwXJv1DXZPU8wcZaHQ7Xbf/tPGJP
ERuujEj9AV5OV2veSsRSW7FqHwa4zjiAH3zD+t6nwSIuMsmYKXG9pk+n5l7gMIOt
yHKr7YOtVXcfF4Kb6KEaY7Cj2zteJiru89hj/cwvsGD1Dn4PV5AB5tx+r42QQB4R
d2AYprgm5rNUn0MOMQ05821ry2KAotI2WuTVD6vdbAfmRhjzZX98DD8msA2LhfbK
8rpuH9aOz7ImqHAxM9u/nUTzuX/SY/3ASoF5Ski0ZyCTRHoVRqjf1jfGcol+pEiF
+D1EX5oHnBUQQPa8vPV69xk7TEP5/RebyUa4O2Rv6rmJ0OJAeBF29XpFutOnk2OI
Ou7lvhOt7Bc43A5F1fDu
=SQmk
-----END PGP SIGNATURE-----

--baXXHI3UuuLRgEm8nxSP2amn2dFvWsbhu--


--===============3052969069068422119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3052969069068422119==--
