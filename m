From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 07/15] ARM: sunxi: dt: define A31's APB0 clk gates node
Date: Wed, 09 Apr 2014 16:43:40 +0200
Message-ID: <53455C9C.1040607@free-electrons.com>
References: <1397051478-4113-1-git-send-email-boris.brezillon@free-electrons.com> <1397051478-4113-8-git-send-email-boris.brezillon@free-electrons.com> <534553FF.4060401@elopez.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <534553FF.4060401@elopez.com.ar>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>, Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 09/04/2014 16:06, Emilio L=F3pez wrote:
> Hi Boris,
>
> El 09/04/14 10:51, Boris BREZILLON escribi=F3:
>> Define the APB0 clk gates controlled by the PRCM (Power/Reset/Clock
>> Management) block.
>>
>> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
>> ---
>>   arch/arm/boot/dts/sun6i-a31.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi
>> b/arch/arm/boot/dts/sun6i-a31.dtsi
>> index 3858424..61e8b34 100644
>> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> @@ -141,6 +141,16 @@
>>                       "ahb1_drc0", "ahb1_drc1";
>>           };
>>
>> +        apb0_gates: apb0_gates@01f01428 {
>
> Looks like this node is out of place, judging by the address. Try to
> keep them in order.

Sure, I'll fix it for the next version.

>
>> +            #clock-cells =3D <1>;
>> +            compatible =3D "allwinner,sun6i-a31-apb0-gates-clk";
>> +            reg =3D <0x01f01428 0x4>;
>> +            clock-output-names =3D "apb0_pio", "apb0_ir",
>> +                    "apb0_timer01", "apb0_p2wi",
>> +                    "apb0_uart", "apb0_1wire",
>> +                    "apb0_i2c";
>> +        };
>> +
>>           apb1: apb1@01c20054 {
>>               #clock-cells =3D <0>;
>>               compatible =3D "allwinner,sun4i-apb0-clk";
>>
>
> Cheers,
>
> Emilio

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

