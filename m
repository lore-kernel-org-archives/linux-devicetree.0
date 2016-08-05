From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/4] irqchip: irq-mvebu-pic: new driver for Marvell Armada
 7K/8K PIC
Date: Fri, 5 Aug 2016 19:00:13 -0400
Message-ID: <CAP=VYLqoubxSMcJJLSqfGUPVfyggMYwpS1aVRmWri+AQvgHt5g@mail.gmail.com>
References: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470408921-447-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470408921-447-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Hanna Hawa <hannah@marvell.com>, Omri Itach <omrii@marvell.com>, LKML <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Neta Zur Hershkovits <neta@marvell.com>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 5, 2016 at 10:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The Marvell Armada 7K/8K integrates a secondary interrupt controller
> very originally named "PIC". It is connected to the main GIC via a
> PPI. Amongst other things, this PIC is used for the ARM PMU.
>
> This commit adds a simple irqchip driver for this interrupt
> controller. Since this interrupt controller is not needed early at boot
> time, we make the driver a proper platform driver rather than use the
> IRQCHIP_DECLARE() mechanism.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  drivers/irqchip/Kconfig         |   3 +
>  drivers/irqchip/Makefile        |   1 +
>  drivers/irqchip/irq-mvebu-pic.c | 195 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 drivers/irqchip/irq-mvebu-pic.c
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index fa33c50..a6f90c5 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -246,6 +246,9 @@ config MVEBU_ODMI
>         bool
>         select GENERIC_MSI_IRQ_DOMAIN
>
> +config MVEBU_PIC
> +       bool

Please switch to a builtin registration call, and remove module.h and
all the MODULE_<xyz> references since this is a bool and not a
tristate Kconfig.

Thanks,
Paul.
--

> +
>  config LS_SCFG_MSI
>         def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
>         depends on PCI && PCI_MSI
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 38853a1..024a78d 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -67,5 +67,6 @@ obj-$(CONFIG_INGENIC_IRQ)             += irq-ingenic.o
>  obj-$(CONFIG_IMX_GPCV2)                        += irq-imx-gpcv2.o
>  obj-$(CONFIG_PIC32_EVIC)               += irq-pic32-evic.o
>  obj-$(CONFIG_MVEBU_ODMI)               += irq-mvebu-odmi.o
> +obj-$(CONFIG_MVEBU_PIC)                        += irq-mvebu-pic.o
>  obj-$(CONFIG_LS_SCFG_MSI)              += irq-ls-scfg-msi.o
>  obj-$(CONFIG_EZNPS_GIC)                        += irq-eznps.o
> diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
> new file mode 100644
> index 0000000..4a3aa7f
> --- /dev/null
> +++ b/drivers/irqchip/irq-mvebu-pic.c
> @@ -0,0 +1,195 @@
> +/*
> + * Copyright (C) 2016 Marvell
> + *
> + * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>

[...]

> +static const struct of_device_id mvebu_pic_of_match[] = {
> +       { .compatible = "marvell,armada-8k-pic", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mvebu_pic_of_match);
> +
> +static struct platform_driver mvebu_pic_driver = {
> +       .probe  = mvebu_pic_probe,
> +       .remove = mvebu_pic_remove,
> +       .driver = {
> +               .name = "mvebu-pic",
> +               .of_match_table = mvebu_pic_of_match,
> +       },
> +};
> +module_platform_driver(mvebu_pic_driver);
> +
> +MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:mvebu_pic");
> +
> --
> 2.7.4
>
