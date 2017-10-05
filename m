From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/10] pinctrl: move gpio-axp209 to pinctrl
Date: Thu, 5 Oct 2017 15:50:37 -0500
Message-ID: <20171005205037.hxtoyeryiolflkda@rob-hp-laptop>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <e193f8efe9092171ebeffb77ab77422179fd3cab.1506428208.git-series.quentin.schulz@free-electrons.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBH5W3LHAKGQETETBBVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <e193f8efe9092171ebeffb77ab77422179fd3cab.1506428208.git-series.quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 02:17:11PM +0200, Quentin Schulz wrote:
> To prepare the driver for the upcoming pinctrl features, move the GPIO
> driver AXP209 from GPIO to pinctrl subsystem.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-axp209.txt       |  30 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt |  30 +-
>  drivers/gpio/Kconfig                                         |   6 +-
>  drivers/gpio/Makefile                                        |   1 +-
>  drivers/gpio/gpio-axp209.c                                   | 188 +-------
>  drivers/pinctrl/Kconfig                                      |   6 +-
>  drivers/pinctrl/Makefile                                     |   1 +-
>  drivers/pinctrl/pinctrl-axp209.c                             | 188 +++++++-
>  8 files changed, 225 insertions(+), 225 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
>  delete mode 100644 drivers/gpio/gpio-axp209.c
>  create mode 100644 drivers/pinctrl/pinctrl-axp209.c
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> deleted file mode 100644
> index a661130..0000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -AXP209 GPIO controller
> -
> -This driver follows the usual GPIO bindings found in
> -Documentation/devicetree/bindings/gpio/gpio.txt
> -
> -Required properties:
> -- compatible: Should be "x-powers,axp209-gpio"
> -- #gpio-cells: Should be two. The first cell is the pin number and the
> -  second is the GPIO flags.
> -- gpio-controller: Marks the device node as a GPIO controller.
> -
> -This node must be a subnode of the axp20x PMIC, documented in
> -Documentation/devicetree/bindings/mfd/axp20x.txt
> -
> -Example:
> -
> -axp209: pmic@34 {
> -	compatible = "x-powers,axp209";
> -	reg = <0x34>;
> -	interrupt-parent = <&nmi_intc>;
> -	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> -	interrupt-controller;
> -	#interrupt-cells = <1>;
> -
> -	axp_gpio: gpio {
> -		compatible = "x-powers,axp209-gpio";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
> new file mode 100644
> index 0000000..a661130
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-axp209.txt
> @@ -0,0 +1,30 @@
> +AXP209 GPIO controller
> +
> +This driver follows the usual GPIO bindings found in
> +Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Required properties:
> +- compatible: Should be "x-powers,axp209-gpio"
> +- #gpio-cells: Should be two. The first cell is the pin number and the
> +  second is the GPIO flags.
> +- gpio-controller: Marks the device node as a GPIO controller.

Maybe there's some reason to move the driver, but the binding describes 
a gpio-controller so it should remain in bindings/gpio/. Binding and 
driver directories aren't one to one necessarily.

Rob
