From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 2/6] ARM: dts: r8a7794: add MSTP5 clocks
Date: Thu, 19 May 2016 20:30:12 +0300
Message-ID: <23a35d91-7ba3-be23-c8ee-5a056e6a627b@cogentembedded.com>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
 <1576909.nm8MtQ2Ln5@wasted.cogentembedded.com>
 <CAMuHMdXaUNwOTQ7827+iTTfuRne_Z1F=-qgxu2cs07==AeqzCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXaUNwOTQ7827+iTTfuRne_Z1F=-qgxu2cs07==AeqzCA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 05/19/2016 07:25 PM, Geert Uytterhoeven wrote:

>> Add some MSTP5 clocks to the R8A7794 device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 3:
>> - refreshed the patch.
>>
>> Changes in version 2:
>> - added "the" article to the change log.
>>
>>  arch/arm/boot/dts/r8a7794.dtsi            |    9 +++++++++
>>  include/dt-bindings/clock/r8a7794-clock.h |    1 +
>>  2 files changed, 10 insertions(+)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
>> @@ -1172,6 +1172,15 @@
>>                         clock-indices =3D <R8A7794_CLK_IRQC>;
>>                         clock-output-names =3D "irqc";
>>                 };
>> +               mstp5_clks: mstp5_clks@e6150144 {
>> +                       compatible =3D "renesas,r8a7794-mstp-clocks"=
, "renesas,cpg-mstp-clocks";
>> +                       reg =3D <0 0xe6150144 0 4>, <0 0xe615003c 0 =
4>;
>> +                       clocks =3D <&hp_clk>, <&extal_clk>, <&p_clk>=
;
>> +                       #clock-cells =3D <1>;
>> +                       clock-indices =3D <R8A7794_CLK_AUDIO_DMAC0
>> +                                        R8A7794_CLK_THERMAL R8A7794=
_CLK_PWM>;
>> +                       clock-output-names =3D "audmac0", "thermal",=
 "pwm";
>
> R-Car E2 does not have the thermal module.

    My "R-Car Series, 2nd Generation User=E2=80=99s Manual: Hardware, R=
ev.1.02 Oct=20
2014" says it does. What's your source?

>> +               };
>>                 mstp7_clks: mstp7_clks@e615014c {
>>                         compatible =3D "renesas,r8a7794-mstp-clocks"=
, "renesas,cpg-mstp-clocks";
>>                         reg =3D <0 0xe615014c 0 4>, <0 0xe61501c4 0 =
4>;
>> Index: renesas/include/dt-bindings/clock/r8a7794-clock.h
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- renesas.orig/include/dt-bindings/clock/r8a7794-clock.h
>> +++ renesas/include/dt-bindings/clock/r8a7794-clock.h
>> @@ -67,6 +67,7 @@
>>  #define R8A7794_CLK_IRQC               7
>>
>>  /* MSTP5 */
>> +#define R8A7794_CLK_AUDIO_DMAC0                2
>>  #define R8A7794_CLK_THERMAL            22
>
> Hence R8A7794_CLK_THERMAL should be removed.

    Well, remove it then. ;-)

>>  #define R8A7794_CLK_PWM                        23
>
> Gr{oetje,eeting}s,

MBR, Sergei
