From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Wed, 5 Jul 2017 12:09:00 +0200
Message-ID: <CAMuHMdV1QvFAD3h7u0rL3-hx6OMRmxdvcj_jUo-ewdCHmcU0fQ@mail.gmail.com>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simoda-san,

On Wed, Jun 28, 2017 at 8:28 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car USB 2.0 controller can change the clock source from an oscillator
> to an external clock via a register. So, this patch adds support
> the clock source selector as a clock driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c

> +static void usb2_clock_sel_enable_extal_only(struct usb2_clock_sel_priv *priv)
> +{
> +       u16 val = readw(priv->base + USB20_CLKSET0);
> +
> +       pr_debug("%s: enter %d %d %x\n", __func__,
> +                priv->extal, priv->xtal, val);
> +
> +       if (priv->extal && !priv->xtal && val != CLKSET0_EXTAL_ONLY)
> +               writew(CLKSET0_EXTAL_ONLY, priv->base + USB20_CLKSET0);
> +}
> +
> +static void usb2_clock_sel_disable_extal_only(struct usb2_clock_sel_priv *priv)
> +{
> +       if (priv->extal && !priv->xtal)
> +               writew(CLKSET0_PRIVATE, priv->base + USB20_CLKSET0);
> +}
> +
> +static int usb2_clock_sel_enable(struct clk_hw *hw)
> +{
> +       usb2_clock_sel_enable_extal_only(to_priv(hw));
> +
> +       return 0;
> +}
> +
> +static void usb2_clock_sel_disable(struct clk_hw *hw)
> +{
> +       usb2_clock_sel_disable_extal_only(to_priv(hw));
> +}
> +
> +/*
> + * This module seems a mux, but this driver assumes a gate because
> + * ehci/ohci platform drivers don't support clk_set_parent() for now.
> + * If this driver acts as a gate, ehci/ohci-platform drivers don't need
> + * any modification.
> + */
> +static const struct clk_ops usb2_clock_sel_clock_ops = {
> +       .enable = usb2_clock_sel_enable,
> +       .disable = usb2_clock_sel_disable,
> +};

So you do "smart muxing" in the enable routine above?

> +static int __init rcar_usb2_clock_sel_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       struct usb2_clock_sel_priv *priv;
> +       struct resource *res;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +       int error;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       priv->base = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       priv->ehci_clk = devm_clk_get(dev, "ehci_ohci");
> +       if (!IS_ERR(priv->ehci_clk)) {
> +               error = clk_prepare_enable(priv->ehci_clk);
> +               if (error)
> +                       return error;
> +       }
> +
> +       clk = devm_clk_get(dev, "usb_extal");
> +       if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
> +               priv->extal = !!clk_get_rate(clk);
> +               clk_disable_unprepare(clk);
> +       }
> +       clk = devm_clk_get(dev, "usb_xtal");
> +       if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
> +               priv->xtal = !!clk_get_rate(clk);
> +               clk_disable_unprepare(clk);
> +       }
> +
> +       if (!priv->extal && !priv->extal) {
> +               dev_err(dev, "This driver needs usb_extal or usb_xtal\n");
> +               return -ENOENT;

Perhaps enabled clocks should be disabled on error?

> +       }
> +
> +       platform_set_drvdata(pdev, priv);
> +       dev_set_drvdata(dev, priv);
> +
> +       init.name = "rcar_usb2_clock_sel";
> +       init.ops = &usb2_clock_sel_clock_ops;
> +       init.flags = CLK_IS_BASIC;
> +       init.parent_names = NULL;
> +       init.num_parents = 0;
> +       priv->hw.init = &init;
> +
> +       clk = clk_register(NULL, &priv->hw);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);

Likewise.

> +       error = of_clk_add_provider(np, of_clk_src_simple_get, clk);
> +       if (error)
> +               return error;
> +
> +       return 0;

return of_clk_add_provider(np, of_clk_src_simple_get, clk);

> +/* Since this driver needs other ccf drivers, this uses subsys_initcall_sync */
> +subsys_initcall_sync(rcar_usb2_clock_sel_init);

I suppose this is a workaround for the lack of probe deferral support in the
USB subsystem?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
