From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Wed, 06 May 2015 21:12:43 +0200
Message-ID: <7101952.uOJDgn7tgf@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
> +       /*
> +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
> +        * interesting ways
> +        */
> +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
> +               struct device_node *soc_dn;
> +
> +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
> +               if (!soc_dn)
> +                       return -ENODEV;
> +
> +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
> +               if (!ctrl->soc) {
> +                       dev_err(dev, "could not probe SoC data\n");
> +                       of_node_put(soc_dn);
> +                       return -ENODEV;
> +               }
> +
> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
> +                                      DRV_NAME, ctrl);
> +
> +               /* Enable interrupt */
> +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
> +
> +               of_node_put(soc_dn);
> +       } else {
> +               /* Use standard interrupt infrastructure */
> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
> +                                      DRV_NAME, ctrl);
> +       }
> 

It looks to me like this should be handled as a nested irqchip, so the node
you look up gets used as the "interrupt-parent" instead, making the behavior
of this SoC transparent to the nand driver.

We recently merged nested irqdomain support as well, which might help here,
or might not be needed.

	Arnd
