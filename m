Return-Path: <SRS0=U2vk=RB=synopsys.com=luis.oliveira@kernel.org>
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
From: Luis de Oliveira <luis.oliveira@synopsys.com>
Message-ID: <84a5eb6b-8d5c-fc26-5e28-fadce9ff4978@synopsys.com>
Date: Tue, 26 Feb 2019 18:39:20 +0000
MIME-Version: 1.0
In-Reply-To: <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Gareth Williams <gareth.williams.jx@renesas.com>, Rob Herring <robh+dt@kernel.org>, "Mark Rutland  <mark.rutland@arm.com>, Alexandre Belloni" <alexandre.belloni@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Luis Oliveira <luis.oliveira@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

Yes Jarkko.
Registers are on the PCLK domain (applications clock) and the IC_CLK is t=
he
clock that controls peripheral logic (like SCL definition).

Thanks!

On 26-Feb-19 14:54, Jarkko Nikula wrote:
> Hi
>=20
> + Luis from Synopsys.
>=20
> Sorry the delay, I was out of office last week. Comment below.
>=20
> On 2/21/19 6:10 PM, Gareth Williams wrote:
>> From: Phil Edworthy <phil.edworthy@renesas.com>
>>
>> The driver requires an undocumented clock property, so detail it.
>> Add documentation for a separate, optional, peripheral clock.
>>
>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>> v4:
>> =C2=A0 - Updated commit message to reference "peripheral clock" instea=
d of
>> =C2=A0=C2=A0=C2=A0 "bus clock"
>> =C2=A0 - Added Wolfram's Acked-by
>> v3:
>> =C2=A0 - Changed clocks and clock-names sections to use term "peripher=
al clock"
>> =C2=A0=C2=A0=C2=A0 (pclk) instead of "bus clock" (busclk).
> ...
>> =C2=A0 Optional properties :
>> +
>> + - clock-names : Contains the names of the clocks:
>> +=C2=A0=C2=A0=C2=A0 "ic_clk", for the core clock used to generate the =
external I2C clock.
>> +=C2=A0=C2=A0=C2=A0 "pclk", the peripheral clock, required for registe=
r accesses.
>> +
>=20
> Actually it looks there is need to revert back to bus clock (or better)=
 in
> comments but keep the "pclk" property.
>=20
> The specification I have tells the ic_clk is the peripheral clock which=
 runs the
> logic and the pclk (exactly pclk) is for bus interface and where regist=
ers are.
>=20
> Luis: did I interpret it right?
>=20
