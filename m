From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 03/19] ARM: dts: aspeed: Add LPC and child devices
Date: Wed, 20 Dec 2017 13:51:40 +1030
Message-ID: <CACPK8XdtbpZdB6g5FQ26=eka5nOvPFKXNr2dZEU3niC5ajSLHw@mail.gmail.com>
References: <20171215062443.23059-1-joel@jms.id.au> <20171215062443.23059-4-joel@jms.id.au>
 <f08188a0-a6dd-a445-340c-eee1ca335865@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f08188a0-a6dd-a445-340c-eee1ca335865@kaod.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

j

On Mon, Dec 18, 2017 at 7:55 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 12/15/2017 07:24 AM, Joel Stanley wrote:
>> From: Andrew Jeffery <andrew@aj.id.au>
>>
>> Ensure the ordering is correct and add all of the children in the SoC
>> device trees for the ast2400 and ast2500.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 35 +++++++++++++++++++++++++++++++++=
++
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 27 +++++++++++++++++----------
>>  2 files changed, 52 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed=
-g4.dtsi
>> index 100d092e6c07..a3bc5da7d42c 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -226,6 +226,41 @@
>>                               status =3D "disabled";
>>                       };
>>
>> +                     lpc: lpc@1e789000 {
>> +                             compatible =3D "aspeed,ast2400-lpc", "simp=
le-mfd";
>> +                             reg =3D <0x1e789000 0x1000>;
>> +
>> +                             #address-cells =3D <1>;
>> +                             #size-cells =3D <1>;
>> +                             ranges =3D <0x0 0x1e789000 0x1000>;
>> +
>> +                             lpc_bmc: lpc-bmc@0 {
>> +                                     compatible =3D "aspeed,ast2400-lpc=
-bmc";
>> +                                     reg =3D <0x0 0x80>;
>> +                             };
>> +
>> +                             lpc_host: lpc-host@80 {
>> +                                     compatible =3D "aspeed,ast2400-lpc=
-host", "simple-mfd", "syscon";
>> +                                     reg =3D <0x80 0x1e0>;
>> +                                     reg-io-width =3D <4>;
>> +
>> +                                     #address-cells =3D <1>;
>> +                                     #size-cells =3D <1>;
>> +                                     ranges =3D <0x0 0x80 0x1e0>;
>> +
>> +                                     lpc_ctrl: lpc-ctrl@0 {
>> +                                             compatible =3D "aspeed,ast=
2400-lpc-ctrl";
>> +                                             reg =3D <0x0 0x80>;
>> +                                             status =3D "disabled";
>> +                                     };
>> +
>> +                                     lhc: lhc@20 {
>> +                                             compatible =3D "aspeed,ast=
2500-lhc";
>
> aspeed,ast2400-lhc
>
> The layout of the registers are the same but there a couple of difference=
s
> in the bit definitions between the two SoCs.
>
> a part from that :
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Good catch. Fixed in v3.

Cheers,

Joel
