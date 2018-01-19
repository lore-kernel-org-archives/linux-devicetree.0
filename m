From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] dt-bindings: gpio: Add binding for Wii GPIO
 controller
Date: Fri, 19 Jan 2018 17:05:21 -0600
Message-ID: <20180119230521.st5uon74fpi4jghc@rob-hp-laptop>
References: <20180115031401.19577-1-j.neuschaefer@gmx.net>
 <20180115031401.19577-5-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180115031401.19577-5-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 04:13:59AM +0100, Jonathan Neuschäfer wrote:
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> ---
>  .../bindings/gpio/nintendo,hollywood-gpio.txt      | 27 ++++++++++++++++++++++
>  .../devicetree/bindings/powerpc/nintendo/wii.txt   |  9 +-------
>  2 files changed, 28 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt b/Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
> new file mode 100644
> index 000000000000..a97ce6b5b724
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
> @@ -0,0 +1,27 @@
> +Nintendo Wii (Hollywood) GPIO controller
> +
> +Required properties:
> +- compatible: "nintendo,hollywood-gpio
> +- reg: Physical base address and length of the controller's registers.
> +- gpio-controller: Marks the device node as a GPIO controller.
> +- #gpio-cells: Should be <2>. The first cell is the pin number and the
> +  second cell is used to specify optional parameters:
> +   - bit 0 specifies polarity (0 for normal, 1 for inverted).
> +
> +Optional properties:
> +- ngpios: see Documentation/devicetree/bindings/gpio/gpio.txt
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: Should be two.
> +- interrupts: Interrupt specifier for the controller's Broadway (PowerPC)
> +  interrupt.
> +- interrupt-parent: phandle of the parent interrupt controller.
> +
> +Example:
> +
> +	GPIO: gpio@0d8000c0 {

Drop the leading 0.

With that,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
