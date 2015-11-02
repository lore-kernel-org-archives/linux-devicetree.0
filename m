From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND 02/16] Documentation: dt-bindings: backlight: add
 TI LMU backlight binding information
Date: Mon, 2 Nov 2015 09:02:29 -0600
Message-ID: <CAL_JsqJVtObYi5+KYNC7fKDokM3a77mH5nqkExW73s+yPcC9DQ@mail.gmail.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com> <1446441875-1256-3-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446441875-1256-3-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 1, 2015 at 11:24 PM, Milo Kim <milo.kim@ti.com> wrote:
> LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697 use common dt-bindings
> for describing device.
>
> Cc: devicetree@vger.kernel.org
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>  .../bindings/video/backlight/ti-lmu-backlight.txt  | 67 ++++++++++++++++++++++

Please move to bindings/leds/backlight/

>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
>
> diff --git a/Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt b/Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
> new file mode 100644
> index 0000000..27b0036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
> @@ -0,0 +1,67 @@
> +TI LMU backlight device tree bindings
> +
> +Required properties:
> +  - compatible: Should be one of lists below.
> +                "ti,lm3532-backlight"
> +                "ti,lm3631-backlight"
> +                "ti,lm3632-backlight"
> +                "ti,lm3633-backlight"
> +                "ti,lm3695-backlight"
> +                "ti,lm3697-backlight"
> +
> +Optional properties:
> +  There are two backlight control mode. One is I2C, the other is PWM mode.
> +  Following properties are only specified in PWM mode.
> +  Please note that LMU backlight device can have only one PWM channel.
> +
> +  - pwms: OF device-tree PWM specification.
> +  - pwm-names: a list of names for the PWM devices specified in the "pwms"
> +               property.
> +
> +  For the PWM user nodes, please refer to [1].
> +
> +Child nodes:
> +  LMU backlight is represented as sub-nodes of the TI LMU device [2].
> +  So, LMU backlight should have more than one backlight child node.
> +  Each node exactly matches with backlight control bank configuration.
> +  Maximum numbers of child nodes depend on the device.
> +  1 = LM3631, LM3632, LM3695
> +  2 = LM3633, LM3697
> +  3 = LM3532
> +
> +  Required property of a child node:
> +  - hvled1-used, hvled2-used, hvled3-used:
> +    High voltage backlight strings configuration. Type is <boolean>.
> +    Please describe which output backlight string is used.
> +    Please refer to the datasheets [3].

Use led-sources.

> +
> +  Optional properties of a child node:
> +  - backlight-name: Name string for backlight device identification.
> +                    It is used for creating backlight sysfs,
> +                    /sys/class/backlight/<backlight-name>/.

Use label.

> +  - backlight-max-microamp: Max current setting. Type is <u32>.
> +                            Unit is microampere.
> +                            Range is from 5000 to 30000.

Use led-max-microamp

> +  - initial-brightness: Backlight initial brightness value. Type is <u32>.
> +                        It is set as soon as backlight device is created.
> +                        0 ~ 2047 = LM3631, LM3632, LM3633, LM3695 and LM3697
> +                        0 ~ 255  = LM3532

Use default-brightness-level

> +  - ramp-up-msec, ramp-down-msec: Light dimming effect properties.
> +                                  Type is <u32>. Unit is millisecond.
> +                                  0 ~ 65 msec    = LM3532
> +                                  0 ~ 4000 msec  = LM3631
> +                                  0 ~ 16000 msec = LM3633 and LM3697
> +  - pwm-period: PWM period. Only valid in PWM brightness mode.
> +                Type is <u32>. If this property is missing, then control
> +                mode is set to I2C by default.
> +
> +Examples: Please refer to ti-lmu dt-bindings. [2].
> +
> +[1] Documentation/devicetree/bindings/pwm/pwm.txt
> +[2] Documentation/devicetree/bindings/mfd/ti-lmu.txt
> +[3] LM3532: http://www.ti.com/product/LM3532/datasheet
> +    LM3631: http://www.ti.com/product/LM3631/datasheet
> +    LM3632: http://www.ti.com/product/LM3632A/datasheet
> +    LM3633: http://www.ti.com/product/LM3633/datasheet
> +    LM3695: Datasheet is not opened yet, but only two strings are used.
> +    LM3697: http://www.ti.com/product/LM3697/datasheet
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
