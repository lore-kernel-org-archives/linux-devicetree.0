From: Vinay Simha <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Fri, 22 Apr 2016 12:25:52 +0530
Message-ID: <CAGWqDJ697YTCK8hGFzODCM0q-3ReOgb3qWTYnsuYWzPLqFqxBw@mail.gmail.com>
References: <20160414171500.GA11505@rob-hp-laptop>
	<1461144755-10633-1-git-send-email-simhavcs@gmail.com>
	<1461144755-10633-2-git-send-email-simhavcs@gmail.com>
	<20160421154546.GA20028@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160421154546.GA20028@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Sumit.semwal" <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 9:15 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Apr 20, 2016 at 03:02:31PM +0530, Vinay Simha BN wrote:
>> Add documentation for lt070me05000 panel
>>
>> Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../bindings/display/panel/jdi,lt070me05000.txt    | 43 ++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> new file mode 100644
>> index 0000000..ffe0550
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>> @@ -0,0 +1,43 @@
>> +JDI model LT070ME05000 1200x1920 7" DSI Panel
>> +
>> +Required properties:
>> +- compatible: should be "jdi,lt070me05000"
>> +- power-supply: phandle of the regulator that provides the supply voltage
>> +  IOVCC , power supply for LCM (1.8V)
>> +- vddp-supply: phandle of the regulator that provides the supply voltage
>> +  Power IC supply (3-5V)
>> +- dcdc_en-supply: phandle of the regulator that provides the supply voltage
>> +  Power IC supply enable, High active
>> +- reset-gpio: phandle of gpio for reset line
>> +  This should be 8mA, gpio can be configured using mux and pinctrl.
>> +  XRES, Reset, Low active
>> +- enable-gpio: phandle of gpio for enable line
>> +  LED_EN, LED backlight enable, High active
>
> These should all be -gpios instead.
will implement in v3
>
>> +- vcc-gpio: phandle of regulator/gpio that provides the supply voltage
>> +  VDD, LED power supply (3-5V)
>
> Is it a regulator or gpio?
>
VDD is LED power supply, but in nexus 7 2nd gen they are using gpio 23
instead of regulator.
if we use vcc-supply, not sure we can give the gpio device tree entry
to it in nexus 7 dts. Any inputs ?
>> +
>> +Optional properties:
>> +- pwm-gpio: phandle of gpio/pwm
>
> This should use the PWM binding. It may not be a GPIO on some hosts.

pwm-gpio will go to the backlight (pwm). right now it is not used
since pwm pm8921 upstream driver is not yet implemented. Shall i
remove this pwm-gpio now and the backlight property when pwm pm8921 is
implemented?
>
>> +  pwm backlight control, this should be mapped to the backlight level
>> +  display brightness (0x51)
>> +
>> +Example:
>> +
>> +     dsi0: qcom,mdss_dsi@4700000 {
>> +             panel@0 {
>> +                     compatible = "jdi,lt070me05000";
>> +                     reg = <0>;
>> +                     pinctrl-names = "default";
>> +                     pinctrl-0 = <&dsi_panel_pinctrl>;
>> +
>> +                     power-supply = <&pm8921_lvs5>;
>> +                     vddp-supply = <&pm8921_l17>;
>> +                     dcdc_en-supply = <&pm8921_lvs7>;
>> +
>> +                     reset-gpio = <&tlmm_pinmux 54 0>;
>> +                     enable-gpio = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
>> +                     vcc-gpio = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
>> +
>> +                     pwm-gpio = <&pm8921_gpio 26 GPIO_ACTIVE_HIGH>;
>> +             };
>> +     };
>> --
>> 2.1.2
>>



-- 
Regards,

Vinay Simha.B.N.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
