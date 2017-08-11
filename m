From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] firmware: of: populate /firmware/ node during init
Date: Fri, 11 Aug 2017 09:15:40 -0500
Message-ID: <CABGGisx7d+SQ7Sbyyu2hoNeuCFHZt1erjMg3zd5mHsqUF-Zk-Q@mail.gmail.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com> <1502458237-1683-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502458237-1683-2-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

+Bjorn

On Fri, Aug 11, 2017 at 8:30 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> Since "/firmware" does not have its own "compatible" property as it's
> just collection of nodes representing firmware interface, it's sub-nodes
> are not populated during system initialization.
>
> Currently different firmware drivers search the /firmware/ node and
> populate the sub-node devices selectively. Instead we can populate
> the /firmware/ node during init to avoid more drivers continuing to
> populate the devices selectively.
>
> This patch adds initcall to achieve the same.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/Makefile |  1 +
>  drivers/firmware/of.c     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 drivers/firmware/of.c
>
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 91d3ff62c653..d9a6fce43613 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_ISCSI_IBFT)      += iscsi_ibft.o
>  obj-$(CONFIG_FIRMWARE_MEMMAP)  += memmap.o
>  obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
>  obj-$(CONFIG_FW_CFG_SYSFS)     += qemu_fw_cfg.o
> +obj-$(CONFIG_OF)               += of.o
>  obj-$(CONFIG_QCOM_SCM)         += qcom_scm.o
>  obj-$(CONFIG_QCOM_SCM_64)      += qcom_scm-64.o
>  obj-$(CONFIG_QCOM_SCM_32)      += qcom_scm-32.o
> diff --git a/drivers/firmware/of.c b/drivers/firmware/of.c
> new file mode 100644
> index 000000000000..149b9660fb44
> --- /dev/null
> +++ b/drivers/firmware/of.c
> @@ -0,0 +1,34 @@
> +/*
> + * Populates the nodes under /firmware/ device tree node
> + *
> + * Copyright (C) 2017 ARM Ltd.
> + *
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + *
> + * Released under the GPLv2 only.

Why do you have both the above 2 paragraphs and an SPDX tag? I'd drop
the above (unless your lawyers told you otherwise).

> + * SPDX-License-Identifier: GPL-2.0
> + */
> +
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +
> +static int __init firmware_of_init(void)

I'd prefer this is added to of_platform_default_populate_init() and
handled like /reserved-memory.

But be aware that Bjorn is reworking this function[1].

> +{
> +       struct device_node *fw_np;
> +       int ret;
> +
> +       fw_np = of_find_node_by_name(NULL, "firmware");

This matches any node named firmware. I see a few instances like RPi
that are not /firmware (though RPi we can move probably).
of_find_node_by_path would be safer.

> +
> +       if (!fw_np)
> +               return 0;
> +
> +       ret = of_platform_populate(fw_np, NULL, NULL, NULL);
> +
> +       of_node_put(fw_np);
> +
> +       return ret;
> +}
> +arch_initcall_sync(firmware_of_init);

You perhaps missed a few instances. "amlogic,meson-gxbb-sm" looks like
it could be converted to a driver. "tlm,trusted-foundations" appears
to be needed early for bringing up cores, so it probably can't change.
They don't have to be converted as part of this series though.

Rob

[1] https://lkml.org/lkml/2017/8/2/981
