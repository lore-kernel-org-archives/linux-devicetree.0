From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
Date: Mon, 12 Aug 2019 11:21:50 +0200
Message-ID: <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
 <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
 <20190812091631.j2pr7i2zeput3hrc@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2651066816955346400=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812091631.j2pr7i2zeput3hrc@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2651066816955346400==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J5t4Xuso7hExK4OnyELpFiIVNIijAUrC9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J5t4Xuso7hExK4OnyELpFiIVNIijAUrC9
Content-Type: multipart/mixed; boundary="D0kDJw0PVFwc6SAbaWFoLZpXkyX6gGyBK";
 protected-headers="v1"
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
 <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
 <20190812091631.j2pr7i2zeput3hrc@flea>
In-Reply-To: <20190812091631.j2pr7i2zeput3hrc@flea>

--D0kDJw0PVFwc6SAbaWFoLZpXkyX6gGyBK
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/08/2019 11:16, Maxime Ripard wrote:
> Hi,
>=20
> On Mon, Aug 12, 2019 at 10:59:51AM +0200, Daniel Lezcano wrote:
>> On 22/07/2019 10:12, Maxime Ripard wrote:
>>> Newer Allwinner SoCs have different number of interrupts, let's add
>>> different compatibles for all of them to deal with this properly.
>>>
>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>
>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>=20
> Thanks!
>=20
> Can you merge this through your tree (along with the bindings)? I'll
> merge the DT patches

patches 1-4 then ?



--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog



--D0kDJw0PVFwc6SAbaWFoLZpXkyX6gGyBK--

--J5t4Xuso7hExK4OnyELpFiIVNIijAUrC9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEGn3N4YVz0WNVyHskqDIjiipP6E8FAl1RL94ACgkQqDIjiipP
6E8lXQgAn9iSp6L2MmsxYQMmKt1ELiCKSXQq5gaZcoQDq9ayxAkCU+k6OPaeisKm
RnDR8ntTmlKOF5Ht4BQroHEKOC/WElmB3/35X4gkF1IHtUxk0OLdkPTjmGKPiE0f
mHKe1FrKiceWxXCDWav5sOCbVWINWsb0Dqf8YBXqFoiTU30njvdb5WMlZZfBEq9w
G6k6/dRkj8nMEIPL4hxSnqzeprsZDxZrw9Jdux6hH+8Ea0cO+pWeWBeXV5LB6JFa
xeUaSU4sPDjSOVeqRLVPvcwTb//m7zTHoM56POFAnfVM30JfjZylCkPTnmr9oPdV
c5LWor4UhP8jMV7r8Uely/ZoBv1Nmg==
=R5Td
-----END PGP SIGNATURE-----

--J5t4Xuso7hExK4OnyELpFiIVNIijAUrC9--


--===============2651066816955346400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2651066816955346400==--
