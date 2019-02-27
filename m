Return-Path: <SRS0=poHV=RC=synopsys.com=luis.oliveira@kernel.org>
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
 <20190226153921.GC839@kunai>
 <8ad4aca6-cdbd-d2bf-81e2-5e2cd04a05c0@linux.intel.com>
From: Luis de Oliveira <luis.oliveira@synopsys.com>
Message-ID: <a05b567d-0db9-d1a5-f793-db804c66f311@synopsys.com>
Date: Wed, 27 Feb 2019 09:43:31 +0000
MIME-Version: 1.0
In-Reply-To: <8ad4aca6-cdbd-d2bf-81e2-5e2cd04a05c0@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Luis Oliveira <luis.oliveira@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

Thanks Jarkko.
Yes, "interface clock" for pclk seems good.

Thanks,
Luis

On 27-Feb-19 7:10, Jarkko Nikula wrote:
> On 2/26/19 5:39 PM, Wolfram Sang wrote:
>>
>>>> + - clock-names : Contains the names of the clocks:
>>>> +=C2=A0=C2=A0=C2=A0 "ic_clk", for the core clock used to generate th=
e external I2C clock.
>>>> +=C2=A0=C2=A0=C2=A0 "pclk", the peripheral clock, required for regis=
ter accesses.
>>>> +
>>>
>>> Actually it looks there is need to revert back to bus clock (or bette=
r) in
>>> comments but keep the "pclk" property.
>>>
>>> The specification I have tells the ic_clk is the peripheral clock whi=
ch runs
>>> the logic and the pclk (exactly pclk) is for bus interface and where
>>> registers are.
>>
>> Can we make it "bus interface clock" then? I'd think this is a tad
>> better.
>>
> Yes, that makes it clear. Plain "interface clock" might work too. TI OM=
APs are
> using that term for register access clock domains.
>=20
> Luis: Does that make sense for HW point of view? You mention PCLK is ca=
lled also
> as application clock but for me personally it is not as clear as interf=
ace clock
> when I see it. I'll let Luis have the final word here.
>=20
> ic_clk - peripheral clock
> pclk - (bus) interface/application clock
>=20
