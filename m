From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v10 06/12] peci: Add a PECI adapter driver for Aspeed AST24xx/AST25xx
Date: Mon, 14 Jan 2019 22:07:33 +1030
Message-ID: <CACPK8XfMyXfomepZEPJCr=A-cCPw-CVAZ0B2CuKn7oXCNz6LbQ@mail.gmail.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com> <20190107214136.5256-7-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107214136.5256-7-jae.hyun.yoo@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, Robin Murphy <robin.murphy@arm.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> +       ret = of_property_read_u32(priv->dev->of_node, "cmd-timeout-ms",
> +                                  &priv->cmd_timeout_ms);
> +       if (ret || priv->cmd_timeout_ms > PECI_CMD_TIMEOUT_MS_MAX ||
> +           priv->cmd_timeout_ms == 0) {
> +               if (!ret)
> +                       dev_warn(priv->dev,
> +                                "Invalid cmd-timeout-ms : %u. Use default : %u\n",
> +                                priv->cmd_timeout_ms,
> +                                PECI_CMD_TIMEOUT_MS_DEFAULT);

As this property is documented as optional, I'd split out the checks
so you only warn when the value provided is invalid.

> +
> +       regmap_write(priv->regmap, ASPEED_PECI_CTRL,
> +                    FIELD_PREP(PECI_CTRL_CLK_DIV_MASK, PECI_CLK_DIV_DEFAULT) |
> +                    PECI_CTRL_PECI_CLK_EN);
> +
> +       /**

Just the one *.

> +        * Timing negotiation period setting.
> +        * The unit of the programmed value is 4 times of PECI clock period.
> +        */
> +       regmap_write(priv->regmap, ASPEED_PECI_TIMING,
> +                    FIELD_PREP(PECI_TIMING_MESSAGE_MASK, msg_timing) |
> +                    FIELD_PREP(PECI_TIMING_ADDRESS_MASK, addr_timing));

> +static int aspeed_peci_xfer(struct peci_adapter *adapter,
> +                           struct peci_xfer_msg *msg)
> +{
> +       struct aspeed_peci *priv = peci_get_adapdata(adapter);
> +
> +       return aspeed_peci_xfer_native(priv, msg);
> +}

It looks like you could do the peci_get_adapdata in
aspeed_peci_xfer_native and drop the need for this wrapper.

> +
> +static int aspeed_peci_probe(struct platform_device *pdev)
> +{

>
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base)) {
> +               ret = PTR_ERR(base);
> +               goto err_put_adapter_dev;
> +       }
> +
> +       priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +                                            &aspeed_peci_regmap_config);
> +       if (IS_ERR(priv->regmap)) {
> +               ret = PTR_ERR(priv->regmap);
> +               goto err_put_adapter_dev;
> +       }
> +
> +       /**
> +        * We check that the regmap works on this very first access,
> +        * but as this is an MMIO-backed regmap, subsequent regmap
> +        * access is not going to fail and we skip error checks from
> +        * this point.

Why do you use a regmap for this driver? AFAICT it has exclusive
ownership over the register range it uses, which is sometimes a reason
to use a regmap over a mmio region.

I'm not sure if you've ever disassembled drivers/base/regmap/regmap.o,
but if you do you will find that a single mmio read turns into
hundreds of instructions.

Cheers,

Joel
