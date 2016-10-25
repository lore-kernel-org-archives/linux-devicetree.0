From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 8/8] ARM: dts: sun6i: hummingbird-a31: Enable display
 output through VGA bridge
Date: Tue, 25 Oct 2016 16:50:25 +0800
Message-ID: <CAGb2v64bMqixiw=kA5_DyncSW7+=dC8foNvOpYUmNAM3zfL0mw@mail.gmail.com>
References: <20161020034344.14154-1-wens@csie.org> <20161020034344.14154-9-wens@csie.org>
 <bac9a59f-df97-245b-f349-bed57dec6aad@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bac9a59f-df97-245b-f349-bed57dec6aad-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 4:13 PM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
>
> On 10/20/2016 09:13 AM, Chen-Yu Tsai wrote:
>>
>> The Hummingbird A31 board has a RGB-to-VGA bridge which converts RGB
>> output from the LCD interface to VGA signals.
>>
>> Enable this part of the display pipeline.
>
>
> I couldn't find the enable-gpios binding for the bridge that you
> introduced in the previous patch. Is that intentional?

Error on my part. Thanks for spotting that.

ChenYu

>
> Thanks,
> Archit
>
>
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31-hummingbird.dts | 56
>> +++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
>> b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
>> index 9a74637f677f..05a49b2147f1 100644
>> --- a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
>> +++ b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
>> @@ -63,6 +63,49 @@
>>                 stdout-path = "serial0:115200n8";
>>         };
>>
>> +       bridge {
>> +               compatible = "dumb-vga-dac";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               ports {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       port@0 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               reg = <0>;
>> +
>> +                               vga_bridge_in: endpoint@0 {
>> +                                       reg = <0>;
>> +                                       remote-endpoint =
>> <&tcon0_out_vga>;
>> +                               };
>> +                       };
>> +
>> +                       port@1 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               reg = <1>;
>> +
>> +                               vga_bridge_out: endpoint@0 {
>> +                                       reg = <0>;
>> +                                       remote-endpoint = <&vga_con_in>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       vga {
>> +               compatible = "vga-connector";
>> +
>> +               port {
>> +                       vga_con_in: endpoint {
>> +                               remote-endpoint = <&vga_bridge_out>;
>> +                       };
>> +               };
>> +       };
>> +
>>         wifi_pwrseq: wifi_pwrseq {
>>                 compatible = "mmc-pwrseq-simple";
>>                 reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 */
>> @@ -245,6 +288,19 @@
>>         status = "okay";
>>  };
>>
>> +&tcon0 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&lcd0_rgb888_pins>;
>> +       status = "okay";
>> +};
>> +
>> +&tcon0_out {
>> +       tcon0_out_vga: endpoint@0 {
>> +               reg = <0>;
>> +               remote-endpoint = <&vga_bridge_in>;
>> +       };
>> +};
>> +
>>  &uart0 {
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&uart0_pins_a>;
>>
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
