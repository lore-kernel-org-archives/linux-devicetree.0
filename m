From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V3 2/3] Documentation: gpio: Add APM X-Gene SoC GPIO
 controller DTS binding
Date: Mon, 16 Jun 2014 08:02:35 +0900
Message-ID: <CAAVeFuKnBzK5hfq0G+x7uJPbCrA9ejQMMAbPqLQLX2JJ1=MWKQ@mail.gmail.com>
References: <1402362278-12419-1-git-send-email-fkan@apm.com> <1402362278-12419-3-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1402362278-12419-3-git-send-email-fkan@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: patches <patches@apm.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 10, 2014 at 10:04 AM, Feng Kan <fkan@apm.com> wrote:
> Documentation for APM X-Gene SoC GPIO controller DTS binding.
>
> Signed-off-by: Feng Kan <fkan@apm.com>
> ---
>  .../devicetree/bindings/gpio/gpio-xgene.txt          | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
> new file mode 100644
> index 0000000..bd5fd85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
> @@ -0,0 +1,20 @@
> +APM X-Gene SoC GPIO controller bindings
> +
> +This is a gpio controller that is part of the flash controller.
> +This gpio controller controls a total of 48 gpios.
> +
> +Required properties:
> +- compatible: "apm,xgene-gpio" for X-Gene GPIO controller
> +- reg: Physical base address and size of the controller's registers
> +- #gpio-cells: Should be two.
> +       - first cell is the pin number
> +       - second cell is used to specify optional parameters (unused)
> +- gpio-controller: Marks the device node as a GPIO controller.
> +
> +Example:
> +       gpio0: gpio0@1701c000 {
> +               compatible = "apm,xgene-gpio";
> +               reg = <0x0 0x1701c000 0x0 0x40>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };

Much simpler, and a better fit if the number of banks and GPIOs are
fixed on this chip as they seem to be.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
