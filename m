From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/2] clk: max77620: Add DT binding doc for MAX77620 clock
Date: Fri, 10 Jun 2016 09:26:46 -0400
Message-ID: <CABxcv==dd8x3WA1o7v-EoLgUxBye5jqnzQQ6OmPR=T692NYA1A@mail.gmail.com>
References: <1465553536-23838-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465553536-23838-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Laxman,

On Fri, Jun 10, 2016 at 6:12 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> MAXIM MAX77620 is the power management IC with multiple DCDC/LDO
> regulators, RTC, GPIOs, Watchdog, 32KHz clock source etc.
>
> Add DT binding doc for the details of the properties for MAX76620
> clocks.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  .../devicetree/bindings/clock/clk-max77620.txt     | 31 ++++++++++++++++++++++

The DT binding for the clock outputs found in the other Maxim PMICs
(max77686 and max77802) are named maxim,max77{686,802} so I think it
would be better to call this maxim,max7720 for consistency.

>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-max77620.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/clk-max77620.txt b/Documentation/devicetree/bindings/clock/clk-max77620.txt
> new file mode 100644
> index 0000000..cda6ef7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clk-max77620.txt
> @@ -0,0 +1,31 @@
> +* Maxim MAX77620 32KHz clocks *
> +
> +Maxim Power Management IC (PMIC) has clock output pins for 32KHz.
> +

I think it would be nice to mention that this should be defined in the
node for the max77620 PMIC and probably have a reference to the MFD
binding. Look how the other max77xxx DT bindings do.

> +This binding uses the common clock binding ./clock-bindings.txt.
> +
> +Required Properties:
> +--------------------
> +
> +-#clock-cells : shall be set to 0.
> +
> +Example:
> +
> +#include <dt-bindings/mfd/max77620.h>
> +...
> +
> +i2c@7000d000 {
> +       spmic: max77620@3c {
> +               compatible = "maxim,max77620";
> +               :::::
> +               #clock-cells = <0>;
> +               :::
> +       };
> +};
> +
> +bluetooth {
> +       compatible = "bcom,bluuetooth-device";
> +       clocks = <&smic>;
> +       clock-names = "in-32k";
> +       :::
> +};
> --

Best regards,
Javier
