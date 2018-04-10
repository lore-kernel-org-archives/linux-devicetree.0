Return-Path: <SRS0=vni6=G7=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Apr 2018 15:40:00 +0300
Message-ID: <CAHp75Vd20+dQewCsy-UPpSw+5OkuVhok=MEYLJ8OqPHEQKSZdA@mail.gmail.com>
Subject: Re: [PATCH] usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, USB <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 10, 2018 at 3:03 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds role switch support for R-Car SoCs. Some R-Car SoCs
> (e.g. R-Car H3) have USB 3.0 dual-role device controller which has
> the USB 3.0 xHCI host and Renesas USB 3.0 peripheral.
>
> Unfortunately, the mode change register contains the USB 3.0 peripheral
> controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
> manages this register. However, in peripheral mode, the host should
> stop. Also the host hardware needs to reinitialize its own registers
> when the mode changes from peripheral to host mode. Otherwise,
> the host cannot work correctly (e.g. detect a device as high-speed).
>
> To achieve this by a driver, this role switch driver manages
> the mode change register and attach/release the xhci-plat driver.
> The renesas_usb3 udc driver should call devm_of_platform_populate()
> to probe this driver.

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

> +#include <linux/of_device.h>

Do you need this one?

> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/usb/role.h>

> +static const struct of_device_id rcar_usb3_role_switch_of_match[] = {
> +       { .compatible = "renesas,rcar-usb3-role-switch" },
> +       { },

Better to remove comma at terminator line.

> +};
> +MODULE_DEVICE_TABLE(of, rcar_usb3_role_switch_of_match);

> +static int rcar_usb3_role_switch_probe(struct platform_device *pdev)
> +{

> +       /* Avoid devm_request_mem_region() calling by devm_ioremap_resource() */

Redundant comment.

> +       host_node = of_parse_phandle(pdev->dev.of_node, "renesas,host", 0);
> +       if (!host_node)
> +               return -ENODEV;
> +
> +       pdev_host = of_find_device_by_node(host_node);
> +       if (!pdev_host)
> +               return -ENODEV;
> +
> +       of_node_put(host_node);

Isn't what Heikki tried to solve with graphs and stuff like that?

> +       dev_info(&pdev->dev, "probed\n");

Noise. (Hint: initcall_debug is a good command line option)

> +}

> +#ifdef CONFIG_PM_SLEEP

Instead...

> +static int rcar_usb3_role_switch_suspend(struct device *dev)

...use __maybe_unused annotation.

> +static int rcar_usb3_role_switch_resume(struct device *dev)

Ditto.

> +#endif


> +static struct platform_driver rcar_usb3_role_switch_driver = {
> +       .probe          = rcar_usb3_role_switch_probe,
> +       .remove         = rcar_usb3_role_switch_remove,
> +       .driver         = {
> +               .name = "rcar_usb3_role_switch",
> +               .pm             = &rcar_usb3_role_switch_pm_ops,

> +               .of_match_table = of_match_ptr(rcar_usb3_role_switch_of_match),

Is it possible to have this driver w/o OF? Does it make sense in that case?
Otherwise remove of_match_ptr() call and below modalias.

> +       },
> +};

> +MODULE_ALIAS("platform:rcar_usb3_role_switch");

-- 
With Best Regards,
Andy Shevchenko
