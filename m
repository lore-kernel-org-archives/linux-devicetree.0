From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
Date: Mon, 19 Aug 2019 15:45:40 +0200
Message-ID: <0e36a6fe-33de-5af5-f4f9-4cedfc9d0cbf@linaro.org>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
 <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
 <20190812091631.j2pr7i2zeput3hrc@flea>
 <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
 <20190812112411.ty3npkq6ztbushhm@flea> <20190819133058.bujcawpw5rgsfp4g@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1323933320206375464=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190819133058.bujcawpw5rgsfp4g@flea>
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
--===============1323933320206375464==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AcgHUSlaoZ7VoUacEW2606eZFsDqDzCBc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AcgHUSlaoZ7VoUacEW2606eZFsDqDzCBc
Content-Type: multipart/mixed; boundary="XHIqhq3BzO4dYKSkXj4zHc8NYab3E4lJh";
 protected-headers="v1"
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <0e36a6fe-33de-5af5-f4f9-4cedfc9d0cbf@linaro.org>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
 <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
 <20190812091631.j2pr7i2zeput3hrc@flea>
 <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
 <20190812112411.ty3npkq6ztbushhm@flea> <20190819133058.bujcawpw5rgsfp4g@flea>
In-Reply-To: <20190819133058.bujcawpw5rgsfp4g@flea>

--XHIqhq3BzO4dYKSkXj4zHc8NYab3E4lJh
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19/08/2019 15:30, Maxime Ripard wrote:
> On Mon, Aug 12, 2019 at 01:24:11PM +0200, Maxime Ripard wrote:
>> On Mon, Aug 12, 2019 at 11:21:50AM +0200, Daniel Lezcano wrote:
>>> On 12/08/2019 11:16, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Mon, Aug 12, 2019 at 10:59:51AM +0200, Daniel Lezcano wrote:
>>>>> On 22/07/2019 10:12, Maxime Ripard wrote:
>>>>>> Newer Allwinner SoCs have different number of interrupts, let's ad=
d
>>>>>> different compatibles for all of them to deal with this properly.
>>>>>>
>>>>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>>>>
>>>>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>
>>>> Thanks!
>>>>
>>>> Can you merge this through your tree (along with the bindings)? I'll=

>>>> merge the DT patches
>>>
>>> patches 1-4 then ?
>>
>> Yep, thanks!
>=20
> Ping?

They are applied :)


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog



--XHIqhq3BzO4dYKSkXj4zHc8NYab3E4lJh--

--AcgHUSlaoZ7VoUacEW2606eZFsDqDzCBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEGn3N4YVz0WNVyHskqDIjiipP6E8FAl1aqAQACgkQqDIjiipP
6E+qaAf/d3ogLejwJWOc8tp5sBqDnzsVlG0+Ww4uLNyUTwaOOHkcarf6krrt2mLg
zeIVCA9bivbJRyh/JRzQeSKVORcehEp1qybo81PeKrMcr6srZyjbv08t4lsbKfcq
WdBl9LTeDxmp36q0QvaDfW/fFXX1kYXT+JHw5dHwxFHl3FAXprdirH7+WklVu719
x2hK+nPBwS01RleYj90fmauDm2jXz9n48SJi5bK6RfGzK6vdVfqq13XHklZgCfxE
+W20ipMmOU17yfU6cYNtGn3YO0WPHg1O3anG50CYagp8tl5N0VMnCr3aH67ujV5a
jsHlvLW2CR7ouEtyOZJeo7dAw3RwHg==
=lMZe
-----END PGP SIGNATURE-----

--AcgHUSlaoZ7VoUacEW2606eZFsDqDzCBc--


--===============1323933320206375464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1323933320206375464==--
