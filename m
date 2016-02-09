From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v6 2/2] clk: clk-pic32: Add PIC32 clock driver
Date: Mon, 08 Feb 2016 17:02:46 -0800
Message-ID: <20160209010246.26445.78949@quark.deferred.io>
References: <1454966902-15228-1-git-send-email-joshua.henderson@microchip.com>
 <1454966902-15228-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454966902-15228-2-git-send-email-joshua.henderson@microchip.com>
Sender: linux-clk-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Purna Chandra Mandal <purna.mandal@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Ralf Baechle <ralf@linux-mips.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joshua,

Quoting Joshua Henderson (2016-02-08 13:28:17)
> +static const struct of_device_id pic32_clk_match[] __initconst = {
> +       {
> +               .compatible = "microchip,pic32mzda-refoclk",
> +               .data = of_refo_clk_setup,
> +       },
> +       {
> +               .compatible = "microchip,pic32mzda-pbclk",
> +               .data = of_periph_clk_setup,
> +       },
> +       {
> +               .compatible = "microchip,pic32mzda-syspll",
> +               .data = of_sys_pll_setup,
> +       },
> +       {
> +               .compatible = "microchip,pic32mzda-sosc",
> +               .data = of_sosc_clk_setup,
> +       },
> +       {
> +               .compatible = "microchip,pic32mzda-frcdivclk",
> +               .data = of_frcdiv_setup,
> +       },
> +       {
> +               .compatible = "microchip,pic32mzda-sysclk-v2",
> +               .data = of_sys_mux_setup,
> +       },
> +       {}
> +};

As I mentioned in my review of the DT binding, instead of having a bunch
of compatible strings for stuff that is inside of your SoC, you should
have clock generator nodes in DT, and put the actual clock data here in
your driver. You might only need one node, perhaps a second for the
USBPLL.

In your case this would result in static inits of struct pic32_spll,
struct pic32_sclk, etc.

I'm guessing you have a lot of derivative chips with slightly different
clock trees? If so you should create a drivers/clk/pic32 directory. The
code in this patch could be common code re-used by your derivatives and
then you could store your clock data as a platform_driver in the same
directory that inits the static data and uses these common clk_ops
functions.

Each chip derivative would have a new compatible string, instead of each
clock node having a compatible string, which makes no sense.

> +static void __init of_pic32_soc_clock_init(struct device_node *np)
> +{
> +       void (*clk_setup)(struct device_node *);
> +       const struct of_device_id *clk_id;
> +       struct device_node *childnp;
> +
> +       pic32_clk_regbase = of_io_request_and_map(np, 0, of_node_full_name(np));
> +       if (IS_ERR(pic32_clk_regbase))
> +               panic("pic32-clk: failed to map registers\n");
> +
> +       for_each_child_of_node(np, childnp) {
> +               clk_id = of_match_node(pic32_clk_match, childnp);
> +               if (!clk_id)
> +                       continue;
> +               clk_setup = clk_id->data;
> +               clk_setup(childnp);
> +       }
> +
> +       /* register failsafe-clock-monitor NMI */
> +       register_nmi_notifier(&failsafe_clk_notifier);
> +}
> +
> +CLK_OF_DECLARE(pic32_soc_clk, "microchip,pic32mzda-clk",
> +              of_pic32_soc_clock_init);

I hate CLK_OF_DECLARE. Sometimes we absolutely must live with
it, but most of the time you can create a proper platform_driver that
gets probed and registers its clocks from within the Linux Driver Model.

Please try to make this into a platform_driver. You requested an example
in V5, so please see:

drivers/clk/qcom/gcc-apq8084.c

Best regards,
Mike
