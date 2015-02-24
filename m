From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM64: Add new Xilinx ZynqMP SoC
Date: Tue, 24 Feb 2015 15:58:47 +0100
Message-ID: <9bffa4683bd6478993de6bea1d3027af@BN1AFFO11FD048.protection.gbl>
References: <8ac3037c175711dec0adcd0d898be7d9722e0ed0.1424764548.git.michal.simek@xilinx.com>
 <CAL_JsqKkVHaf_U0nU9nqa2q5XwfsuCu-ZWVEHx6b5Mv9Hgen1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKkVHaf_U0nU9nqa2q5XwfsuCu-ZWVEHx6b5Mv9Hgen1Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, Robert Richter <rrichter@cavium.com>, Mark Brown <broonie@linaro.org>, Eddie Huang <eddie.huang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/24/2015 03:42 PM, Rob Herring wrote:
> On Tue, Feb 24, 2015 at 1:56 AM, Michal Simek <michal.simek@xilinx.co=
m> wrote:
>> Initial version of device tree for Xilinx ZynqMP SoC.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>=20
> [...]
>=20
>> +               gic: interrupt-controller@f9010000 {
>> +                       compatible =3D "arm,cortex-a15-gic", "arm,co=
rtex-a9-gic";
>=20
> gic-400, right?

yep

>=20
>> +                       #interrupt-cells =3D <3>;
>> +                       reg =3D <0x0 0xf9010000 0x10000>,
>> +                             <0x0 0xf9020000 0x20000>,
>> +                             <0x0 0xf9040000 0x20000>,
>> +                             <0x0 0xf9060000 0x20000>;
>=20
> These addresses are wrong if you are doing address swizzling to do 64=
K
> offsets. We don't really have an answer yet as to what is the right
> way. See the XGene GIC discussion[1].

Is this better for GICC?
<0x0 0xf902f000 0x2000>

Thanks,
Michal
