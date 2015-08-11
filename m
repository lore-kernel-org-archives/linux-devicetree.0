From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: add bindings for the Ux500 clocks
Date: Tue, 11 Aug 2015 16:39:05 -0700
Message-ID: <20150811233905.31346.32970@quantum>
References: <1438262400-29213-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438262400-29213-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Linus Walleij (2015-07-30 06:20:00)
> These Ux500 clocks have been around for years and were never
> properly documented. Add the proper binding documentation.
> 
> Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This type of binding description isn't preferred but I guess we've been
supporting it all this time:

Acked-by: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> ---
> Ulf/Mike: please ACK this patch so I can take it through
> ARM SoC.
> ---
>  Documentation/devicetree/bindings/clock/ux500.txt | 64 +++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/ux500.txt b/Documentation/devicetree/bindings/clock/ux500.txt
> new file mode 100644
> index 000000000000..e52bd4b72348
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ux500.txt
> @@ -0,0 +1,64 @@
> +Clock bindings for ST-Ericsson Ux500 clocks
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +  "stericsson,u8500-clks"
> +  "stericsson,u8540-clks"
> +  "stericsson,u9540-clks"
> +- reg : shall contain base register location and length for
> +  CLKRST1, 2, 3, 5, and 6 in an array. Note the absence of
> +  CLKRST4, which does not exist.
> +
> +Required subnodes:
> +- prcmu-clock: a subnode with one clock cell for PRCMU (power,
> +  reset, control unit) clocks. The cell indicates which PRCMU
> +  clock in the prcmu-clock node the consumer wants to use.
> +- prcc-periph-clock: a subnode with two clock cells for
> +  PRCC (programmable reset- and clock controller) peripheral clocks.
> +  The first cell indicates which PRCC block the consumer
> +  wants to use, possible values are 1, 2, 3, 5, 6. The second
> +  cell indicates which clock inside the PRCC block it wants,
> +  possible values are 0 thru 31.
> +- prcc-kernel-clock: a subnode with two clock cells for
> +  PRCC (programmable reset- and clock controller) kernel clocks
> +  The first cell indicates which PRCC block the consumer
> +  wants to use, possible values are 1, 2, 3, 5, 6. The second
> +  cell indicates which clock inside the PRCC block it wants,
> +  possible values are 0 thru 31.
> +- rtc32k-clock: a subnode with zero clock cells for the 32kHz
> +  RTC clock.
> +- smp-twd-clock: a subnode for the ARM SMP Timer Watchdog cluster
> +  with zero clock cells.
> +
> +Example:
> +
> +clocks {
> +       compatible = "stericsson,u8500-clks";
> +       /*
> +        * Registers for the CLKRST block on peripheral
> +        * groups 1, 2, 3, 5, 6,
> +        */
> +       reg = <0x8012f000 0x1000>, <0x8011f000 0x1000>,
> +           <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
> +           <0xa03cf000 0x1000>;
> +
> +       prcmu_clk: prcmu-clock {
> +               #clock-cells = <1>;
> +       };
> +
> +       prcc_pclk: prcc-periph-clock {
> +               #clock-cells = <2>;
> +       };
> +
> +       prcc_kclk: prcc-kernel-clock {
> +               #clock-cells = <2>;
> +       };
> +
> +       rtc_clk: rtc32k-clock {
> +               #clock-cells = <0>;
> +       };
> +
> +       smp_twd_clk: smp-twd-clock {
> +               #clock-cells = <0>;
> +       };
> +};
> -- 
> 2.4.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
