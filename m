From: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 2/2] drm/panel: simple: Add support for Winstar WF35LTIACD
Date: Mon, 27 Mar 2017 11:43:58 +0200
Message-ID: <CACQ1gAimmXHEoBok9=Q3cjCn-=KPOT5HWEBqB0NXPBsa1Tv8Bw@mail.gmail.com>
References: <20170320133222.21773-1-richard.genoud@gmail.com> <20170324155821.2xjginqluhjnrr2x@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324155821.2xjginqluhjnrr2x@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-03-24 16:58 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Mar 20, 2017 at 02:32:22PM +0100, Richard Genoud wrote:
>> This adds support for the Winstar Display Co. WF35LTIACD 3.5" QVGA TFT
>> LCD panel, which can be supported by the simple panel driver.
>>
>> Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> Changes since v1:
>> Add power-supply property and an example in documentation
>>
>>  .../bindings/display/panel/winstar,wf35ltiacd      | 53 ++++++++++++++++++++++
>>  drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++
>>  2 files changed, 81 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
>> new file mode 100644
>> index 000000000000..9ff59b868b28
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
>> @@ -0,0 +1,53 @@
>> +Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
>> +
>> +Required properties:
>> +- compatible: should be "winstar,wf35ltiacd"
>> +- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
>> +
>> +This binding is compatible with the simple-panel binding, which is specified
>> +in simple-panel.txt in this directory.
>> +
>> +Example:
>> +     backlight: backlight {
>> +             compatible = "pwm-backlight";
>> +             pwms = <&hlcdc_pwm 0 50000 PWM_POLARITY_INVERTED>;
>> +             brightness-levels = <0 31 63 95 127 159 191 223 255>;
>> +             default-brightness-level = <191>;
>> +             power-supply = <&bl_reg>;
>> +             status = "okay";
>
> Drop status from examples.
>
>> +     };
>> +
>> +     bl_reg: backlight_regulator {
>> +             compatible = "regulator-fixed";
>> +             regulator-name = "backlight-power-supply";
>> +             regulator-min-microvolt = <5000000>;
>> +             regulator-max-microvolt = <5000000>;
>> +             status = "okay";
>> +     };
>> +
>> +     panel: panel {
>> +             compatible = "winstar,wf35ltiacd", "simple-panel";
>> +             backlight = <&backlight>;
>> +             power-supply = <&panel_reg>;
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             status = "okay";
>> +
>> +             port@0 {
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +
>> +                     panel_input: endpoint@0 {
>> +                             reg = <0>;
>
> You don't need reg and unit-addresses for these.
>
> With that,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
Ok, I'll resend the patch with reg and unit-addresses removed.

Thanks !

>> +                             remote-endpoint = <&hlcdc_panel_output>;
>> +                     };
>> +             };
>> +     };
>> +
>> +     panel_reg: panel_regulator {
>> +             compatible = "regulator-fixed";
>> +             regulator-name = "panel-power-supply";
>> +             regulator-min-microvolt = <3300000>;
>> +             regulator-max-microvolt = <3300000>;
>> +             status = "okay";
>> +     };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
