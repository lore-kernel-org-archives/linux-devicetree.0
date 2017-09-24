From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] extcon: gpio: Add DT bindings
Date: Sun, 24 Sep 2017 14:56:04 -0500
Message-ID: <CAL_JsqKth+EHVZEVpT1U7qVvN77i7oZjBJH5bbowXcjJxETuoA@mail.gmail.com>
References: <20170924145622.4031-1-linus.walleij@linaro.org> <20170924145622.4031-2-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170924145622.4031-2-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Mike Lockwood <lockwood@google.com>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 24, 2017 at 9:56 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Add some reasonable device tree bindings and also add the cable defines
> to the extcon include in <dt-bindings/extcon/connectors.h> since
> the GPIO extcon definately need to specify which cable/connector it is
> detecting.
>
> Adding the include file makes the (as it happens) Linux numbers into an
> ABI, but I do not see any better method. It is possible to define strings
> for all cable types but it seems like overkill, just reusing Linux'
> enumerators seems like a good idea.
>
> The binding supports any number of GPIOs and connectors, but the driver
> currently only supports one connector on one GPIO line.

My view of extcon binding is it is fundamentally broken. I've
expressed this multiple times before.

TL;DR: Anything extending the existing extcon binding will be NAKed.

>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/extcon/extcon-gpio.txt     | 24 ++++++++++++++
>  include/dt-bindings/extcon/connectors.h            | 38 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>  create mode 100644 include/dt-bindings/extcon/connectors.h
>
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> new file mode 100644
> index 000000000000..2f5e21b94a64
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> @@ -0,0 +1,24 @@
> +External Connector Using GPIO

What kind of connector? All connectors external to something... And
GPIO is not a kind of connector on its own, but an implementation.

> +
> +Required properties:
> +- compatible: should be "extcon-gpio"
> +- extcon-gpios: the GPIO lines used for the external connectors

This doesn't tell me what the GPIOs functions are and should. For
example we have hpd-gpios for HDMI hotplug detect in HDMI connector
binding.

> +  See gpio/gpio.txt
> +- extcon-connector-types: set to an unsigned integer value arrat representing the types
> +  of this connector, matched to the corresponding GPIO lines in the previous array.

This should be determined by the compatible string.

> +  Those are defined with unique IDs in <dt-bindings/extcon/connectors.h>
> +- input-debounce: The number of microseconds to wait for the
> +  connector state to stabilize. This property is reused from pin control
> +  See pinctrl/pinctrl-bindings.txt
> +
> +Example:
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/extcon/connectors.h>
> +
> +extcon {
> +       compatible = "extcon-gpio";
> +       extcon-gpios = <&gpio0 42 GPIO_ACTIVE_LOW>;
> +       extcon-connector-types = <EXTCON_USB>;
> +       input-debounce = <20000>; /* 20 ms */
> +};
> diff --git a/include/dt-bindings/extcon/connectors.h b/include/dt-bindings/extcon/connectors.h
> new file mode 100644
> index 000000000000..61bed24eaadc
> --- /dev/null
> +++ b/include/dt-bindings/extcon/connectors.h
> @@ -0,0 +1,38 @@
> +#ifndef _DT_BINDINGS_EXTCON_CONNECTORS_H
> +#define _DT_BINDINGS_EXTCON_CONNECTORS_H
> +
> +/* USB external connector */
> +#define EXTCON_USB             1
> +#define EXTCON_USB_HOST                2
> +#define EXTCON_CHG_USB_SDP     5       /* Standard Downstream Port */
> +#define EXTCON_CHG_USB_DCP     6       /* Dedicated Charging Port */
> +#define EXTCON_CHG_USB_CDP     7       /* Charging Downstream Port */
> +#define EXTCON_CHG_USB_ACA     8       /* Accessory Charger Adapter */
> +#define EXTCON_CHG_USB_FAST    9
> +#define EXTCON_CHG_USB_SLOW    10
> +#define EXTCON_CHG_WPT         11      /* Wireless Power Transfer */
> +#define EXTCON_CHG_USB_PD      12      /* USB Power Delivery */

These don't all look to be mutually exclusive.

For USB PD, isn't that discoverable?

> +/* Jack external connector */
> +#define EXTCON_JACK_MICROPHONE 20
> +#define EXTCON_JACK_HEADPHONE  21
> +#define EXTCON_JACK_LINE_IN    22
> +#define EXTCON_JACK_LINE_OUT   23
> +#define EXTCON_JACK_VIDEO_IN   24
> +#define EXTCON_JACK_VIDEO_OUT  25
> +#define EXTCON_JACK_SPDIF_IN   26      /* Sony Philips Digital InterFace */
> +#define EXTCON_JACK_SPDIF_OUT  27

> +/* Display external connector */
> +#define EXTCON_DISP_HDMI       40      /* High-Definition Multimedia Interface */
> +#define EXTCON_DISP_MHL                41      /* Mobile High-Definition Link */
> +#define EXTCON_DISP_DVI                42      /* Digital Visual Interface */
> +#define EXTCON_DISP_VGA                43      /* Video Graphics Array */
> +#define EXTCON_DISP_DP         44      /* Display Port */
> +#define EXTCON_DISP_HMD                45      /* Head-Mounted Display */

We already have connector bindings for most of these. Use those as a
model for whatever you want to do.

> +/* Miscellaneous external connector */
> +#define EXTCON_DOCK            60
> +#define EXTCON_JIG             61
> +#define EXTCON_MECHANICAL      62
> +
> +#define EXTCON_NUM             63
> +
> +#endif /* _DT_BINDINGS_EXTCON_CONNECTORS_H */
> --
> 2.13.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
