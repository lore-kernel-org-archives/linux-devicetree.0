From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 7/8] arm64: dts: hikey960: add device node for pmic and regulators
Date: Fri, 16 Jun 2017 11:47:11 +0800
Message-ID: <CAFGCpxx=vPP-Wcby+kz63gB5rp+CHrwSPNYAfyv15nmy_Tvq_Q@mail.gmail.com>
References: <20170608220841.26531-1-guodong.xu@linaro.org> <20170608220841.26531-8-guodong.xu@linaro.org>
 <5942E633.9040908@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5942E633.9040908-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>Li
List-Id: devicetree@vger.kernel.org

Thanks, Wei.

On Fri, Jun 16, 2017 at 3:55 AM, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org> wrote:
> Hi Guodong,
>
> On 2017/6/8 23:08, Guodong Xu wrote:
>> From: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>
>> add device node for hi6421 pmic core and hi6421v530
>> voltage regulator,include LDO(1,3,9,11,15,16)
>>
>> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 46 +++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> index ca448f0..e579333 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> @@ -97,6 +97,52 @@
>>                       default-state = "off";
>>               };
>>       };
>> +
>> +     pmic: pmic@fff34000 {
>> +             compatible = "hisilicon,hi6421v530-pmic";
>> +             reg = <0x0 0xfff34000 0x0 0x1000>;
>> +             interrupt-controller;
>> +             #interrupt-cells = <2>;
>> +
>> +             regulators {
>> +                     ldo3: LDO3 { /* HDMI */
>> +                             regulator-name = "VOUT3_1V85";
>> +                             regulator-min-microvolt = <1800000>;
>> +                             regulator-max-microvolt = <2200000>;
>> +                             regulator-enable-ramp-delay = <120>;
>> +                     };
>> +
>> +                     ldo9: LDO9 { /* SDCARD I/O */
>> +                             regulator-name = "VOUT9_1V8_2V95";
>> +                             regulator-min-microvolt = <1750000>;
>> +                             regulator-max-microvolt = <3300000>;
>> +                             regulator-enable-ramp-delay = <240>;
>> +                     };
>> +
>> +                     ldo11: LDO11 { /* Low Speed Connector */
>> +                             regulator-name = "VOUT11_1V8_2V95";
>> +                             regulator-min-microvolt = <1750000>;
>> +                             regulator-max-microvolt = <3300000>;
>> +                             regulator-enable-ramp-delay = <240>;
>> +                     };
>> +
>> +                     ldo15: LDO15 { /* UFS VCC */
>> +                             regulator-name = "VOUT15_3V0";
>> +                             regulator-min-microvolt = <1750000>;
>> +                             regulator-max-microvolt = <3000000>;
>> +                             regulator-boot-on;
>> +                             regulator-always-on;
>> +                             regulator-enable-ramp-delay = <120>;
>> +                     };
>> +
>> +                     ldo16: LDO16 { /* SD VDD */
>> +                             regulator-name = "VOUT16_2V95";
>> +                             regulator-min-microvolt = <1750000>;
>> +                             regulator-max-microvolt = <3000000>;
>> +                             regulator-enable-ramp-delay = <360>;
>> +                     };
>> +             };
>> +     };
>>  };
>>
>>  &i2c0 {
>>
>
> Since you put the dts part into another patch set[1] and the driver part has been applied.
> I will pick up [1].
> Thanks!
>
> [1]: https://lkml.org/lkml/2017/6/14/1052
>
> BR,
> Wei
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
