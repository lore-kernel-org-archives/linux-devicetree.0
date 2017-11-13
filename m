From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 4/4] ARM64: dts: meson: drop "sana" clock from SAR ADC
Date: Mon, 13 Nov 2017 15:38:57 +0800
Message-ID: <1f191946-7cd2-04c9-7b1f-f5e790b6ddc7@amlogic.com>
References: <20171107141027.30717-1-yixun.lan@amlogic.com>
 <CAFBinCAEgCzZQQN4V8bJMpkNJ9AJLDLWC2DSEkz7N7m60p=QDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCAEgCzZQQN4V8bJMpkNJ9AJLDLWC2DSEkz7N7m60p=QDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin & others

  I'd like to just re-send the patch [4/4] (while leave others[1-3/4]
unchanged), to have separated DT patch the for 32bit / 64bit platform.
  is this ok for you?


On 11/12/17 09:33, Martin Blumenstingl wrote:
> Hi Yixun,
> 
> On Tue, Nov 7, 2017 at 3:10 PM, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> wrote:
>> From: Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>>
>> The SAR ADC modules doesn't require The "sana" clock.
>>
>> Singed-off-by: Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/meson8.dtsi               | 5 ++---
>>  arch/arm/boot/dts/meson8b.dtsi              | 5 ++---
> these two should go into a separate patch (with "ARM: dts: ..."
> prefix) - the ARM maintainers want separate pull requests for the
> 32-bit and 64-bit .dts changes, so patches should also follow that
> schema
> 
> with that fixed, you can add my ACK on both (32-bit and 64-bit) .dts patches:
> Acked-by: Martin Blumenstingl<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> 

thanks, I will send separate patch for this, and I will add your 'Acked-by'

>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 3 +--
>>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 3 +--
>>  4 files changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
>> index b98d44fde6b6..f93d6cf6e094 100644
>> --- a/arch/arm/boot/dts/meson8.dtsi
>> +++ b/arch/arm/boot/dts/meson8.dtsi
>> @@ -289,9 +289,8 @@
>>  &saradc {
>>         compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
>>         clocks = <&clkc CLKID_XTAL>,
>> -               <&clkc CLKID_SAR_ADC>,
>> -               <&clkc CLKID_SANA>;
>> -       clock-names = "clkin", "core", "sana";
>> +               <&clkc CLKID_SAR_ADC>;
>> +       clock-names = "clkin", "core";
>>  };
>>
>>  &spifc {
>> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> index bc278da7df0d..4aa444284f0c 100644
>> --- a/arch/arm/boot/dts/meson8b.dtsi
>> +++ b/arch/arm/boot/dts/meson8b.dtsi
>> @@ -185,9 +185,8 @@
>>  &saradc {
>>         compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
>>         clocks = <&clkc CLKID_XTAL>,
>> -               <&clkc CLKID_SAR_ADC>,
>> -               <&clkc CLKID_SANA>;
>> -       clock-names = "clkin", "core", "sana";
>> +               <&clkc CLKID_SAR_ADC>;
>> +       clock-names = "clkin", "core";
>>  };
>>
>>  &uart_AO {
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> index af834cdbba79..b77f2593cdc3 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> @@ -686,10 +686,9 @@
>>         compatible = "amlogic,meson-gxbb-saradc", "amlogic,meson-saradc";
>>         clocks = <&xtal>,
>>                  <&clkc CLKID_SAR_ADC>,
>> -                <&clkc CLKID_SANA>,
>>                  <&clkc CLKID_SAR_ADC_CLK>,
>>                  <&clkc CLKID_SAR_ADC_SEL>;
>> -       clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
>> +       clock-names = "clkin", "core", "adc_clk", "adc_sel";
>>  };
>>
>>  &sd_emmc_a {
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> index d8dd3298b15c..07805a3b4db0 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> @@ -628,10 +628,9 @@
>>         compatible = "amlogic,meson-gxl-saradc", "amlogic,meson-saradc";
>>         clocks = <&xtal>,
>>                  <&clkc CLKID_SAR_ADC>,
>> -                <&clkc CLKID_SANA>,
>>                  <&clkc CLKID_SAR_ADC_CLK>,
>>                  <&clkc CLKID_SAR_ADC_SEL>;
>> -       clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
>> +       clock-names = "clkin", "core", "adc_clk", "adc_sel";
>>  };
>>
>>  &sd_emmc_a {
>> --
>> 2.14.1
>>
> 
> .
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
