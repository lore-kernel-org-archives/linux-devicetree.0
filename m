From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate
 if no bestdiv is normally found
Date: Mon, 16 Feb 2015 13:18:13 +0200
Message-ID: <54E1D1F5.2050603@ti.com>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com> <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com> <20150212093356.GR12209@pengutronix.de> <20150212103944.GA1290@victor> <20150212122405.GW12209@pengutronix.de> <20150212125646.GT8656@n2100.arm.linux.org.uk> <20150212134131.GX12209@pengutronix.de> <54DE0BB8.7070004@ti.com> <20150213185713.GA12209@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="3KoQEK9a3HUH6aNkKimN5SAagQexSt6lr"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150213185713.GA12209@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Liu Ying <Ying.Liu@freescale.com>, dri-devel@lists.freedesktop.org, stefan.wahren@i2se.com, devicetree@vger.kernel.org, kernel@pengutronix.de, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com, andy.yan@rock-chips.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--3KoQEK9a3HUH6aNkKimN5SAagQexSt6lr
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 13/02/15 20:57, Sascha Hauer wrote:
> On Fri, Feb 13, 2015 at 04:35:36PM +0200, Tomi Valkeinen wrote:
>> On 12/02/15 15:41, Sascha Hauer wrote:
>>
>>> Tomis patch is based on the assumption that clk_set_rate(clk_round_ra=
te(rate))
>>> is equal to clk_round_rate(rate). So when this assumption is wrong th=
en
>>> it should simply be reverted.
>>
>> When is it not equal?
>>
>> I agree that doing clk_set_rate(clk, clk_round_rate(clk, rate)) is
>> pointless, but shouldn't it still work?
>>
>> And we can forget about clk_round_rate. Without my patch, this would
>> behave oddly also:
>>
>> rate =3D clk_get_rate(clk);
>> clk_set_rate(clk, rate);
>>
>> The end result could be something else than 'rate'.
>=20
> I agree that it's a bit odd, but I think it has to be like this.
> Consider that you request a rate of 100Hz, but the clock can only
> produce 99.5Hz, so due to rounding clk_round_rate() returns 99Hz.
> Now when you request 99Hz from clk_set_rate() the 99.5Hz value
> can't be used because it's too high.

Would that problem better be fixed by changing the clock driver so that
when asked for 99Hz, it would look for rates less than 100Hz?

I think the old behavior was so odd that I would call it broken, so I
hope the current problems can be fixed via some other ways than breaking
it again.

 Tomi



--3KoQEK9a3HUH6aNkKimN5SAagQexSt6lr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4dH5AAoJEPo9qoy8lh71fEsP/3cvSwjn50zaGlKoQK//7/Yv
RGzA+FGDC0Bj7tseL9tiEn5O/ACQC1Mg0HLiRBmFt65VORdfY+Xbgn9Cb1/pAHk4
lw5gyCwWUPQZix09WN2XXe2mmHXXSl4Tc6WTD3iNa3kAqF+kBk+zP27Ii5avF9wZ
s6Yrx90DktOMhdY18hAuIHg14L2Z8S7wD/YVOuPNCb4vkVX3xgEmkwqADO2lidal
TLz/IDmJfZorBztN5ufmllvQWmee4qQAJuBttf8VQNx+eq4efJH20hFLH/XZgRAJ
TllGfhtKJHZ6thwgDPlng5IUix448mZTN7BGzHSQp7KFfBkh8KJiddFm6FCB8EUC
nIWIfn4DBcFp1Od5naC8g4+wRdg+MUA/BPxokRSGg28DkH0vnzE5EshW08oJol63
gJhBlK4mdy0sr9vHkNHdSbBUbXhqu7i8S+yp3RynRYKquHHTUyGIGoJ9xqatlQ3a
8Jr37uHCOQbdBwHxmxkPIPSTIWvAbfozBVZYXyVQcrYI294/ex/ZHV4rJmxOa/r3
eXH65UNjJqt0dlss4GHFtnw0h5f5L84u7RxPZy+kG9k4xOVxhVdOurlfaTUbfPdW
zO1/Hx62rkUpj7n9Xh9O01o5kkJEvi4wAYaaX3HW9Az5OoDQKJoZvXR4dFgVRJ52
b28RuW+JE7mnV05Pd6o6
=HUt4
-----END PGP SIGNATURE-----

--3KoQEK9a3HUH6aNkKimN5SAagQexSt6lr--
