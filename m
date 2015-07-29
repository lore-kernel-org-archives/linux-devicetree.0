From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 7/7] ARM: dts: ifc6410: add inforce LVDS panel support
Date: Wed, 29 Jul 2015 15:03:34 +0100
Message-ID: <55B8DD36.7040907@linaro.org>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org> <1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org> <55B86710.4090507@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B86710.4090507-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 29/07/15 06:39, Archit Taneja wrote:
> Hi Srini,
>
> On 07/28/2015 06:24 PM, Srinivas Kandagatla wrote:
>> This patch adds LVDS panel for IFC6410.
>>
>> Signed-off-by: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> [Rob Clark: WIP patch]
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 66
>> ++++++++++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> index 1ab71f1..3bdac02 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> @@ -63,6 +63,12 @@
>>                       qcom,switch-mode-frequency = <3200000>;
>>                   };
>>
>> +                pm8921_l2: l2 {
>> +                    regulator-min-microvolt = <1200000>;
>> +                    regulator-max-microvolt = <1200000>;
>> +                    bias-pull-down;
>> +                };
>> +
>>                   pm8921_l3: l3 {
>>                       regulator-min-microvolt = <3050000>;
>>                       regulator-max-microvolt = <3300000>;
>> @@ -96,6 +102,10 @@
>>                   pm8921_lvs1: lvs1 {
>>                       bias-pull-down;
>>                   };
>> +
>> +                pm8921_lvs7: lvs7 {
>> +                    bias-pull-down;
>> +                };
>>               };
>>           };
>>
>> @@ -119,6 +129,41 @@
>>
>>           mdp: qcom,mdp@5100000 {
>>               status = "okay";
>> +            qcom,lvds-panel = <&panel>;
>
> We're trying to switch to the of_graph way of representing connected
> panels. With that, the above phandle will go away. This needs to be
> replaced with:
>

Thanks for the input, I modified the panel support to use graphs which 
works perfectly fine.

thanks,
srini
>              port {
>                  lvds_out: endpoint {
>                      remote_endpoint = <&auo_in>;
>                  };
>              };
>
>> +            lvds-vccs-3p3v-supply = <&ext_3p3v>;
>> +            lvds-pll-vdda-supply = <&pm8921_l2>;
>> +            lvds-vdda-supply = <&pm8921_lvs7>;
>> +        };
>> +
>> +        panel_3p3v: panel_3p3v {
>> +            compatible = "regulator-fixed";
>> +            pinctrl-0 = <&disp_en_gpios>;
>> +            pinctrl-names = "default";
>> +            regulator-min-microvolt = <3300000>;
>> +            regulator-max-microvolt = <3300000>;
>> +            regulator-name = "panel_en_3p3v";
>> +            regulator-type = "voltage";
>> +            startup-delay-us = <0>;
>> +            gpio = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
>> +            enable-active-high;
>> +            regulator-boot-on;
>> +        };
>> +
>> +        backlight: backlight{
>> +            pinctrl-0 = <&pwm_bl_gpios>;
>> +            pinctrl-names = "default";
>> +            compatible = "gpio-backlight";
>> +            gpios = <&pm8921_gpio 26 GPIO_ACTIVE_HIGH>;
>> +            default-on;
>> +        };
>> +
>> +        panel: auo,b101xtn01 {
>> +            status = "okay";
>> +            compatible = "auo,b101xtn01";
>> +
>> +            ddc-i2c-bus = <&i2c3>;
>> +            backlight = <&backlight>;
>> +            power-supply = <&panel_3p3v>;
>
> and for the panel:
>
>              port {
>                  auo_in: endpoint {
>                      remote-endpoint = <&lvds_out>;
>                  };
>              };
>
> Thanks,
> Archit
>
>>           };
>>
>>           gsbi3: gsbi@16200000 {
>> @@ -235,6 +280,27 @@
>>                   pm8921_gpio: gpio@150 {
>>                       pinctrl-names = "default";
>>                       pinctrl-0 = <&wlan_default_gpios>;
>> +
>> +                    pwm_bl_gpios: pwm-bl-gpios {
>> +                        pios {
>> +                            pins = "gpio26";
>> +                            bias-disable;
>> +                            function = "normal";
>> +                            qcom,drive-strength =
>> <PMIC_GPIO_STRENGTH_HIGH>;
>> +                            power-source = <PM8921_GPIO_S4>;
>> +                        };
>> +                    };
>> +
>> +                    disp_en_gpios: disp-en-gpios {
>> +                        pios {
>> +                            pins = "gpio36";
>> +                            bias-disable;
>> +                            function = "normal";
>> +                            qcom,drive-strength =
>> <PMIC_GPIO_STRENGTH_HIGH>;
>> +                            power-source = <PM8921_GPIO_S4>;
>> +                        };
>> +                    };
>> +
>>                       wlan_default_gpios: wlan-gpios {
>>                           pios {
>>                               pins = "gpio43";
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
