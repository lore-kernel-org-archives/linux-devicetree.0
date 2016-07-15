From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 06/14] ARM: sun8i: clk: Add
 clk-factor rate application method
Date: Fri, 15 Jul 2016 18:33:45 +0200
Message-ID: <abf2f8c1-adb6-ed75-5958-324bb4b4e1e1@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
 <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
 <CAOMqctTds7adsfvehfv8wcxbb0NOpEQE5wRff6NwfPOUa3SbRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8eiaxBXtsaAOLXs3L1xAubBMgpbM2sR3S"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAOMqctTds7adsfvehfv8wcxbb0NOpEQE5wRff6NwfPOUa3SbRw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: Jean-Francois Moine <moinejf@free.fr>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dev <dev@linux-sunxi.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8eiaxBXtsaAOLXs3L1xAubBMgpbM2sR3S
Content-Type: multipart/mixed; boundary="VuPPGqKFPLfjbSB8uahQGnO86mAhiKvwg"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Jean-Francois Moine <moinejf@free.fr>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dev <dev@linux-sunxi.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, open list
 <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <abf2f8c1-adb6-ed75-5958-324bb4b4e1e1@megous.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 06/14] ARM: sun8i: clk: Add
 clk-factor rate application method
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
 <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
 <CAOMqctTds7adsfvehfv8wcxbb0NOpEQE5wRff6NwfPOUa3SbRw@mail.gmail.com>
In-Reply-To: <CAOMqctTds7adsfvehfv8wcxbb0NOpEQE5wRff6NwfPOUa3SbRw@mail.gmail.com>

--VuPPGqKFPLfjbSB8uahQGnO86mAhiKvwg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15.7.2016 16:22, Michal Suchanek wrote:
> Hello,
>=20
> On 15 July 2016 at 15:48, Ond=C5=99ej Jirman <megous@megous.com> wrote:=

>>
>>
>> On 15.7.2016 15:27, Jean-Francois Moine wrote:
>>> On Fri, 15 Jul 2016 12:38:54 +0200
>>> Ond=C5=99ej Jirman <megous@megous.com> wrote:
>>>
>>>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>>>> applying the factors, and then switching back when the PLL is stabl=
e
>>>>> would be a nice solution.
>>>>>
>>>>> I just checked, and all the SoCs we've had so far have that
>>>>> possibility, so if it works, for now, I'd like to stick to that.
>>>>
>>>> It would need to be tested. U-boot does the change only once, while =
the
>>>> kernel would be doing it all the time and between various frequencie=
s
>>>> and PLL settings. So the issues may show up with this solution too.
>>>
>>> I don't think this is a good idea: the CPU clock may be changed at an=
y
>>> time with the CPUFreq governor. I don't see the system moving from
>>> 1008MHz to 24MHz and then to 1200MHz when some computation is needed!=

>>
>> PLL lock time is around 10-20us, I'd guess based on the number of loop=
s
>> in the PLL lock wait loop. So unless you'll be switching frequencies
>> many times per second, this should be barely noticeable.
>>
>> But I'd like a different solution too.
>=20
> Do you have a patch to test this?
>=20
> For me changing CPU frequency on Orange Pi One always locks up the
> system. I keep running it on the u-boot setup 1.08GHz at 1.1V

Not anymore. But it's quite simple to hack it into the
drivers/clk/sunxi/clk-factors.c:clk_factors_set_rate()

You can look at u-boot arch/arm/mach-sunxi/clock_sun6i.c:clock_set_pll1
for how to change the CPU clock source.

> Thanks
>=20
> Michal
>=20


--VuPPGqKFPLfjbSB8uahQGnO86mAhiKvwg--

--8eiaxBXtsaAOLXs3L1xAubBMgpbM2sR3S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXiRBpAAoJEG5kJsZ3z+/xf0EP+wS3+x5tMUjvfb/ww2f866XE
AK6MoGIpHI9Me3dYOApYmV4I/qIWtozptSipVLsLTLodH+oU5+L6ZhJwo1tWtrVw
QlMC7viV8YckK5AqKtANm/EQ3+P61OxP9Mm+bsxOrXMTRMu5jY/p6B+wqvTvRJjT
MWLPClv07/8fAprQOJZ0q38rnFjwkh29/GCovgFAXv5HOabCYlQbQ80WvodJjm7h
Rox30zenhto2OimqRPk8SDL7BXsrktgP6CQeCLk7z3Qz14DKoOZubaJ+l6xHMKq4
fQnILntaZe6rmYQhpJi+iAsBU6PjXBRJXlYrXPUCcTwLG6i3wpDTlVQZCzf2m6E/
nPMztImPXtpKSvgRPlCwK0ygxbT1cehotcW/jODWLWkEag4gQR1atIEB1UYA5xwH
i0FaULxjtSW/SsTs488BvVnJ/FPT67kq2s+TlWsEMGQf6SgA6/26sM3vFaFq9K8O
tL9Vm/axiWL05AACOKjH7wlbr6Md938eLAQjR8T9DoNpahj/F/ispBW7VbgiRbU+
Sl2u98cCyneUkSVR+PiNa++/nqbgYTZzaO2XzqqqJECjBOXhynbQVcCE99uquUv8
v197fovaRPPu7Mx4gqvs/sWyWnHscQ54IcwEgdeQYnbw0JKdSvN9Iix15ZD2lwAK
KVWVpeptc/5LOyKjJSrS
=+sdE
-----END PGP SIGNATURE-----

--8eiaxBXtsaAOLXs3L1xAubBMgpbM2sR3S--
