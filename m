From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 06/16] arm64: dts: add Hi6220 spi configuration nodes
Date: Tue, 12 Apr 2016 17:40:49 +0800
Message-ID: <CAFGCpxw_89GBUsMW4HCbeRgH+H_tQy5ZuD1wPmgpLFXNfeHBxA@mail.gmail.com>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
	<1459589383-16914-7-git-send-email-guodong.xu@linaro.org>
	<20160404051638.GR17806@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160404051638.GR17806@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 April 2016 at 13:16, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Apr 02, 2016 at 05:29:33PM +0800, Guodong Xu wrote:
>> From: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Add Hi6220 spi configuration nodes
>>
>> Signed-off-by: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts   |  1 +
>>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi        | 15 +++++++++++++++
>>  arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi | 21 +++++++++++++++++++++
>>  3 files changed, 37 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> index 985a2ad..5c9ee31 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> @@ -20,6 +20,7 @@
>>               serial1 = &uart1; /* BT UART */
>>               serial2 = &uart2; /* LS Expansion UART0 */
>>               serial3 = &uart3; /* LS Expansion UART1 */
>> +             spi0 = &spi_0;
>
> You shouldn't really need an alias for SPI.

Will remove it.

>
>>       };
>>
>>       chosen {
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>> index e96cc3c..dcca83b 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>> @@ -585,5 +585,20 @@
>>                       clock-names = "apb_pclk";
>>                       status = "ok";
>>               };
>> +
>> +             spi_0: spi@f7106000 {
>> +                     compatible = "arm,pl022", "arm,primecell";
>> +                     reg = <0x0 0xf7106000 0x0 0x1000>;
>> +                     interrupts = <0 50 4>;
>> +                     bus-id = <0>;
>> +                     enable-dma = <0>;
>> +                     clocks = <&sys_ctrl HI6220_SPI_CLK>;
>> +                     clock-names = "apb_pclk";
>> +                     pinctrl-names = "default";
>> +                     pinctrl-0 = <&spi0_pmx_func &spi0_cfg_func>;
>> +                     num-cs = <1>;
>> +                     cs-gpios = <&gpio6 2 0>;
>> +                     status = "ok";
>
> You only need an ok to override a disabled status, so I think you can
> drop this. Or disable by default and let boards override it if that
> makes sense.

Thanks. I will modify this to "disabled", and enable it in board dts:
hi6220-hikey.dts

-Guodong

>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
