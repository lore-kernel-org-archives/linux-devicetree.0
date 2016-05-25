MIME-Version: 1.0
In-Reply-To: <1464176133-10742-2-git-send-email-vreddytalla@nvidia.com>
References: <1464176133-10742-1-git-send-email-vreddytalla@nvidia.com>
	<1464176133-10742-2-git-send-email-vreddytalla@nvidia.com>
Date: Wed, 25 May 2016 07:33:25 -0500
Message-ID: <CAL_JsqKOF9=k6P5bPzkk-fFeGkwTU=KmvABTFCj4ZdSOYnFUCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] extcon: gpio: add DT binding doc for extcon-gpio
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 25, 2016 at 6:35 AM, Venkat Reddy Talla <vreddytalla@nvidia.com> wrote:
> Adding DT binding doc for extcon gpio device
> properties.
>
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>
> ---
> changes in v2:
> - added description for extcon-gpio
> - using gpio flag cell to handle gpio active state
> - change dts property name gpio to gpios
> - removed prefix for debounce
> - added description for extcon-gpio,cable-names
> ---
> ---
>  .../devicetree/bindings/extcon/extcon-gpio.txt     | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> new file mode 100644
> index 0000000..2302960
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> @@ -0,0 +1,22 @@
> +EXTCON FOR GPIO
> +
> +extcon-gpio responsible to detect external cable state when
> +attached or detached.
> +
> +Required Properties:
> + - compatible : Should be "extcon-gpio";


> +
> +Optional Properties:
> + - extcon-gpio,name: Name of extcon device.
> + - gpios: gpio number.
> + - extcon-gpio,irq-flags: IRQ flags for gpio.


> + - debounce-ms: Debounce time in ms.
> + - extcon-gpio,cable-names: The unique id of specific external connector
> +       defined in include/linux/extcon.h
> +
> +extcon-gpio {
> +       compatible = "extcon-gpio";
> +        extcon-gpio,name = "VBUS";
> +       gpios = <&gpio 20 0>;
> +       extcon-gpio,cable-names = <EXTCON_USB EXTCON_NONE>;
> +};
> --
> 2.1.4
>
