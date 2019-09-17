From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Date: Mon, 16 Sep 2019 20:13:06 -0500
Message-ID: <CAL_JsqL=37HL3BnxZTxJXQTBaKoFs1_=vt4hfLqkxXkWedmPYA@mail.gmail.com>
References: <20190910104247.13142-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910104247.13142-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Yang-Leo Li <leoyang.li@nxp.com>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 5:53 AM Biwen Li <biwen.li@nxp.com> wrote:
>
> Add some properties for pcf85263/pcf85363 as follows:
>   - nxp,rtc-interrupt-type: integer type
>   - nxp,rtc-interrupt-output-pin: string type
>   - quartz-load-femtofarads: integer type
>   - nxp,quartz-drive-strength: integer type
>   - nxp,quartz-low-jitter: bool type
>   - wakeup-source: bool type
>
> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v4:
>         - Drop robust defines in include/dt-bindings/rtc/pcf85363.h
>         - Add nxp,rtc-interrupt-type property
>         - Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin
>
> Change in v3:
>         - None
>
> Change in v2:
>         - Replace properties name
>           quartz-load-capacitance -> quartz-load-femtofarads
>           quartz-drive-strength -> nxp,quartz-drive-strength
>           quartz-low-jitter -> nxp,quartz-low-jitter
>         - Replace drive strength name
>           PCF85263_QUARTZDRIVE_NORMAL -> PCF85263_QUARTZDRIVE_100ko
>           PCF85263_QUARTZDRIVE_LOW -> PCF85263_QUARTZDRIVE_60ko
>           PCF85263_QUARTZDRIVE_HIGH -> PCF85263_QUARTZDRIVE_500ko
>         - Set default interrupt-output-pin as "INTA"
>
>  .../devicetree/bindings/rtc/pcf85363.txt      | 44 ++++++++++++++++++-
>  include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363.h
>
> diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> index 94adc1cf93d9..fc1579463657 100644
> --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> @@ -8,10 +8,52 @@ Required properties:
>  Optional properties:
>  - interrupts: IRQ line for the RTC (not implemented).
>
> +- nxp,rtc-interrupt-type: integer property, represent the interrupt's
> +  type. Valid values are
> +  INT_PIE(periodic interrupt enable),
> +  INT_OIE(offset correction interrupt enable),
> +  INT_A1IE(alarm1 interrupt enable),
> +  INT_A2IE(alarm2 interrupt enable),
> +  INT_TSRIE(timestamp register interrupt enable)
> +  INT_BSIE(battery switch interrupt enable),
> +  INT_WDIE(WatchDog interrupt enable,and
> +  compose these values such as: INT_A1IE | INT_A2IE,
> +  but currently only support INT_A1IE, default value is INT_A1IE.
> +  The property and property nxp,rtc-interrupt-output-pin
> +  work together to generate some interrupts on some pins.
> +
> +- nxp,rtc-interrupt-output-pin: The interrupt output pin must be
> +  "INTA" or "INTB", default value is "INTA". The property and property
> +  nxp,rtc-interrupt-type work together to generate some interrupts on
> +  some pins.
> +
> +- quartz-load-femtofarads: The internal capacitor to select for the quartz,
> +  expressed in femto Farad (fF). Valid values are 6000, 7000 and 12500.
> +  Default value is 12500fF.
> +
> +- nxp,quartz-drive-strength: Drive strength for the quartz,
> +  expressed in kilo ohms (kOhm) Valid values are 60, 100 and 500.
> +  Default value is 100kOhm.

This needs a unit as defined in property-units.txt.

> +
> +- nxp,quartz-low-jitter: Boolean property, if present enables low jitter mode
> +  which reduces jitter at the cost of increased power consumption.
> +
> +- wakeup-source: Boolean property, Please refer to
> +  Documentation/devicetree/bindings/power/wakeup-source.txt
> +
>  Example:
>
>  pcf85363: pcf85363@51 {
>         compatible = "nxp,pcf85363";
>         reg = <0x51>;
> -};
>
> +       interrupt-parent = <&gpio1>;
> +       interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +
> +       wakeup-source;
> +       nxp,rtc-interrupt-output-pin = "INTA";
> +       nxp,rtc-interrupt-type = <INT_A1IE>;
> +       quartz-load-femtofarads = <12500>;
> +       nxp,quartz-drive-strength = <60>;
> +       nxp,quartz-low-jitter;
> +};
> diff --git a/include/dt-bindings/rtc/pcf85363.h b/include/dt-bindings/rtc/pcf85363.h
> new file mode 100644
> index 000000000000..6340bf2da8f5
> --- /dev/null
> +++ b/include/dt-bindings/rtc/pcf85363.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_RTC_PCF85363_H
> +#define _DT_BINDINGS_RTC_PCF85363_H
> +
> +/* Interrupt type */
> +#define INT_WDIE       (1 << 0)
> +#define INT_BSIE       (1 << 1)
> +#define INT_TSRIE      (1 << 2)
> +#define INT_A2IE       (1 << 3)
> +#define INT_A1IE       (1 << 4)
> +#define INT_OIE                (1 << 5)
> +#define INT_PIE                (1 << 6)
> +
> +#endif /* _DT_BINDINGS_RTC_PCF85363_H */
> --
> 2.17.1
>
