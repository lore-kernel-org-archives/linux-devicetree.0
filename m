From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v2 1/4] iio: adc: Document the regulator/clocks for exynos-adc
Date: Wed, 27 Mar 2013 11:35:32 -0700
Message-ID: <CAHfPSqDLXD-T6__eF=d+U7Me953DqTgMXi=Jmx7LnHL+W-FLhQ@mail.gmail.com>
References: <1363129994-10438-1-git-send-email-dianders@chromium.org>
 <1363207202-10858-1-git-send-email-dianders@chromium.org> <1363207202-10858-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1363207202-10858-2-git-send-email-dianders@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Olof Johansson <olof@lixom.net>, Guenter Roeck <linux@roeck-us.net>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13 March 2013 13:39, Doug Anderson <dianders@chromium.org> wrote:
> The exynos ADC won't work without a regulator called "vdd" and a clock
> called "adc".  Document this fact in the device tree bindings.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>

Lars, any update on this patch set. This change is required.
> ---
> Changes in v2: None
>
>  Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> index f686378..96db940 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
> @@ -20,6 +20,9 @@ Required properties:
>                         format is being dependent on which interrupt controller
>                         the Samsung device uses.
>  - #io-channel-cells = <1>; As ADC has multiple outputs
> +- clocks               From common clock binding: handle to adc clock.
> +- clock-names          From common clock binding: Shall be "adc".
> +- vdd-supply           VDD input supply.
>
>  Note: child nodes can be added for auto probing from device tree.
>
> @@ -31,6 +34,11 @@ adc: adc@12D10000 {
>         interrupts = <0 106 0>;
>         #io-channel-cells = <1>;
>         io-channel-ranges;
> +
> +       clocks = <&clock 303>;
> +       clock-names = "adc";
> +
> +       vdd-supply = <&buck5_reg>;
>  };
>
>
> --
> 1.8.1.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



--
Shine bright,
(: Nav :)
