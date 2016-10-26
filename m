From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: stm32: move dma translation to board files
Date: Wed, 26 Oct 2016 11:09:36 +0200
Message-ID: <404315f0-fc9e-93e2-54df-f85e484d9389@st.com>
References: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, ">" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ">" <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bruno,

On 10/25/2016 11:06 PM, Bruno Herrera wrote:
> Hi Alexandre,
>
>>
>> stm32f469-disco and stm32f429-eval boards use SDRAM start address remapping
>> (to @0) to boost performances. A DMA translation through "dma-ranges"
>> property was needed for other masters than the M4 CPU.
>> stm32f429-disco doesn't use remapping so doesn't need this DMA translation.
>> This patches moves this DMA translation definition from stm32f429 soc file
>> to board files.
>>
>> Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>>
>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
>> index 13c7cd2..a763c15 100644
>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> @@ -82,6 +82,10 @@
>>                 };
>>         };
>>
>> +       soc {
>> +               dma-ranges = <0xc0000000 0x0 0x10000000>;
>> +       };
>> +
>>         usbotg_hs_phy: usbphy {
>>                 #phy-cells = <0>;
>>                 compatible = "usb-nop-xceiv";
>
> Shouldn't also the peripheral dma-ranges property move to board specific too?
> I  had this patch for while but I didn't had the time to submit:

Well spot I forgot it. Actually, discussing with Arnd ysterday on IIRC, 
empty dma-ranges is not needed. Can you test on your side by removing 
dma-ranges in usb node please ?
I will push a v2 by removing empty dma-ranges if tests are ok in your side.

Thanks in advance
Alex

>
> Author: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Sun Oct 16 14:50:00 2016 -0200
>
>     ARM: DT: STM32: Use dma-ranges property per board not at dtsi file
>
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> b/arch/arm/boot/dts/stm32429i-eval.dts
> index 6bfc595..2a22a82 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -52,6 +52,10 @@
>         model = "STMicroelectronics STM32429i-EVAL board";
>         compatible = "st,stm32429i-eval", "st,stm32f429";
>
> +       soc {
> +               dma-ranges = <0xC0000000 0x0 0x10000000>;
> +       };
> +
>         chosen {
>                 bootargs = "root=/dev/ram rdinit=/linuxrc";
>                 stdout-path = "serial0:115200n8";
> @@ -96,6 +100,7 @@
>
>  &ethernet0 {
>         status = "okay";
> +       dma-ranges;
>         pinctrl-0       = <&ethernet0_mii>;
>         pinctrl-names   = "default";
>         phy-mode        = "mii-id";
> @@ -116,6 +121,7 @@
>  };
>
>  &usbotg_hs {
> +       dma-ranges;
>         dr_mode = "host";
>         phys = <&usbotg_hs_phy>;
>         phy-names = "usb2-phy";
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index 7d624a2..697a133 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -59,7 +59,6 @@
>         };
>
>         soc {
> -               dma-ranges = <0xc0000000 0x0 0x10000000>;
>
>                 timer2: timer@40000000 {
>                         compatible = "st,stm32-timer";
> @@ -472,13 +471,11 @@
>                         st,syscon = <&syscfg 0x4>;
>                         snps,pbl = <8>;
>                         snps,mixed-burst;
> -                       dma-ranges;
>                         status = "disabled";
>                 };
>
>                 usbotg_hs: usb@40040000 {
>                         compatible = "snps,dwc2";
> -                       dma-ranges;
>                         reg = <0x40040000 0x40000>;
>                         interrupts = <77>;
>                         clocks = <&rcc 0 29>;
>
>
>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
>> index 0596d60..3a1cfdd 100644
>> --- a/arch/arm/boot/dts/stm32f429.dtsi
>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
>> @@ -59,8 +59,6 @@
>>         };
>>
>>         soc {
>> -               dma-ranges = <0xc0000000 0x0 0x10000000>;
>> -
>>                 timer2: timer@40000000 {
>>                         compatible = "st,stm32-timer";
>>                         reg = <0x40000000 0x400>;
>> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
>> index 9e73656..c2213c0 100644
>> --- a/arch/arm/boot/dts/stm32f469-disco.dts
>> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
>> @@ -64,6 +64,10 @@
>>         aliases {
>>                 serial0 = &usart3;
>>         };
>> +
>> +       soc {
>> +               dma-ranges = <0xc0000000 0x0 0x10000000>;
>> +       };
>>  };
>>
>>  &clk_hse {
>> --
>
>
> Br.,
> Bruno
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
