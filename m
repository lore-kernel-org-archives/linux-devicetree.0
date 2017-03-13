From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/4] fpga pr ip: Core driver support for Altera Partial
 Reconfiguration IP.
Date: Mon, 13 Mar 2017 13:49:46 -0700
Message-ID: <CAAtXAHdVk5hWTZ5mi__Togtqk3Mw0FGZeFrsXR-EwUDr1k1vAA@mail.gmail.com>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com> <1489174827-6033-3-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489174827-6033-3-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 11:40 AM,  <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Adding the core functions necessary for a fpga-mgr driver
> for the Altera Partial IP component.  It is intended for
> these functions to be used by the various bus implementations
> like the platform bus or the PCIe bus.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Reviewed-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v5:
>     Fix comment as suggested by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> v4:
>     v3 patch set mistakenly sent out labeled as v4
> v3:
>     s/alt_pr_probe/alt_pr_register/
>     s/alt_pr_remove/alt_pr_unregister/
> ---
>  drivers/fpga/Kconfig             |   5 +
>  drivers/fpga/Makefile            |   1 +
>  drivers/fpga/altera-pr-ip-core.c | 217 +++++++++++++++++++++++++++++++++++++++
>  drivers/fpga/altera-pr-ip-core.h |  29 ++++++
>  4 files changed, 252 insertions(+)
>  create mode 100644 drivers/fpga/altera-pr-ip-core.c
>  create mode 100644 drivers/fpga/altera-pr-ip-core.h
>
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index ce861a2..a46c173 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -63,6 +63,11 @@ config ALTERA_FREEZE_BRIDGE
>           isolate one region of the FPGA from the busses while that
>           region is being reprogrammed.
>
> +config ALTERA_PR_IP_CORE
> +        tristate "Altera Partial Reconfiguration IP Core"
> +        help
> +          Core driver support for Altera Partial Reconfiguration IP component
> +
>  endif # FPGA
>
>  endmenu
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index 8df07bc..82693d2 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_FPGA)                      += fpga-mgr.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)         += socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)     += socfpga-a10.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)       += zynq-fpga.o
> +obj-$(CONFIG_ALTERA_PR_IP_CORE)         += altera-pr-ip-core.o
>
>  # FPGA Bridge Drivers
>  obj-$(CONFIG_FPGA_BRIDGE)              += fpga-bridge.o
> diff --git a/drivers/fpga/altera-pr-ip-core.c b/drivers/fpga/altera-pr-ip-core.c
> new file mode 100644
> index 0000000..738d7d1
> --- /dev/null
> +++ b/drivers/fpga/altera-pr-ip-core.c
> @@ -0,0 +1,217 @@
> +/*
> + * Driver for Altera Partial Reconfiguration IP Core
> + *
> + * Copyright (C) 2016-2017 Intel Corporation
> + *
> + * Based on socfpga-a10.c Copyright (C) 2015-2016 Altera Corporation
> + *  by Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "altera-pr-ip-core.h"
> +#include <linux/delay.h>
> +#include <linux/fpga/fpga-mgr.h>
> +#include <linux/module.h>
> +
> +#define ALT_PR_DATA_OFST               0x00
> +#define ALT_PR_CSR_OFST                        0x04
> +
> +#define ALT_PR_CSR_PR_START            BIT(0)
> +#define ALT_PR_CSR_STATUS_SFT          2
> +#define ALT_PR_CSR_STATUS_MSK          (7 << ALT_PR_CSR_STATUS_SFT)
> +#define ALT_PR_CSR_STATUS_NRESET       (0 << ALT_PR_CSR_STATUS_SFT)
> +#define ALT_PR_CSR_STATUS_PR_ERR       (1 << ALT_PR_CSR_STATUS_SFT)
> +#define ALT_PR_CSR_STATUS_CRC_ERR      (2 << ALT_PR_CSR_STATUS_SFT)
> +#define ALT_PR_CSR_STATUS_BAD_BITS     (3 << ALT_PR_CSR_STATUS_SFT)
> +#define ALT_PR_CSR_STATUS_PR_IN_PROG   (4 << ALT_PR_CSR_STATUS_SFT)
> +#define ALT_PR_CSR_STATUS_PR_SUCCESS   (5 << ALT_PR_CSR_STATUS_SFT)
> +
> +struct alt_pr_priv {
> +       void __iomem *reg_base;
> +};
> +
> +static enum fpga_mgr_states alt_pr_fpga_state(struct fpga_manager *mgr)
> +{
> +       struct alt_pr_priv *priv = mgr->priv;
> +       const char *err = "unknown";
> +       enum fpga_mgr_states ret = FPGA_MGR_STATE_UNKNOWN;
> +       u32 val;
> +
> +       val = readl(priv->reg_base + ALT_PR_CSR_OFST);
> +
> +       val &= ALT_PR_CSR_STATUS_MSK;
> +
> +       switch (val) {
> +       case ALT_PR_CSR_STATUS_NRESET:
> +               return FPGA_MGR_STATE_RESET;
> +
> +       case ALT_PR_CSR_STATUS_PR_ERR:
> +               err = "pr error";
> +               ret = FPGA_MGR_STATE_WRITE_ERR;
> +               break;
> +
> +       case ALT_PR_CSR_STATUS_CRC_ERR:
> +               err = "crc error";
> +               ret = FPGA_MGR_STATE_WRITE_ERR;
> +               break;
> +
> +       case ALT_PR_CSR_STATUS_BAD_BITS:
> +               err = "bad bits";
> +               ret = FPGA_MGR_STATE_WRITE_ERR;
> +               break;
> +
> +       case ALT_PR_CSR_STATUS_PR_IN_PROG:
> +               return FPGA_MGR_STATE_WRITE;
> +
> +       case ALT_PR_CSR_STATUS_PR_SUCCESS:
> +               return FPGA_MGR_STATE_OPERATING;
> +
> +       default:
> +               break;
> +       }
> +
> +       dev_err(&mgr->dev, "encountered error code %d (%s) in %s()\n",
> +               val, err, __func__);
> +       return ret;
> +}
> +
> +static int alt_pr_fpga_write_init(struct fpga_manager *mgr,
> +                                 struct fpga_image_info *info,
> +                                 const char *buf, size_t count)
> +{
> +       struct alt_pr_priv *priv = mgr->priv;
> +       u32 val;
> +
> +       if (!(info->flags & FPGA_MGR_PARTIAL_RECONFIG)) {
> +               pr_err("%s Partial Reconfiguration flag not set\n", __func__);
> +               return -EINVAL;
> +       }
> +
> +       val = readl(priv->reg_base + ALT_PR_CSR_OFST);
> +
> +       if (val & ALT_PR_CSR_PR_START) {
> +               pr_err("%s Partial Reconfiguration already started\n",
> +                      __func__);
> +               return -EINVAL;
> +       }
> +
> +       writel(val | ALT_PR_CSR_PR_START, priv->reg_base + ALT_PR_CSR_OFST);
> +
> +       return 0;
> +}
> +
> +static int alt_pr_fpga_write(struct fpga_manager *mgr, const char *buf,
> +                            size_t count)
> +{
> +       struct alt_pr_priv *priv = mgr->priv;
> +       u32 *buffer_32 = (u32 *)buf;
> +       size_t i = 0;
> +
> +       if (count <= 0)
> +               return -EINVAL;
> +
> +       /* Write out the complete 32-bit chunks */
> +       while (count >= sizeof(u32)) {
> +               writel(buffer_32[i++], priv->reg_base);
> +               count -= sizeof(u32);
> +       }
> +
> +       /* Write out remaining non 32-bit chunks */
> +       switch (count) {
> +       case 3:
> +               writel(buffer_32[i++] & 0x00ffffff, priv->reg_base);
> +               break;
> +       case 2:
> +               writel(buffer_32[i++] & 0x0000ffff, priv->reg_base);
> +               break;
> +       case 1:
> +               writel(buffer_32[i++] & 0x000000ff, priv->reg_base);
> +               break;
> +       case 0:
> +               break;
> +       default:
> +               /* This will never happen */
> +               return -EFAULT;
> +       }
> +
> +       if (alt_pr_fpga_state(mgr) == FPGA_MGR_STATE_WRITE_ERR)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +static int alt_pr_fpga_write_complete(struct fpga_manager *mgr,
> +                                     struct fpga_image_info *info)
> +{
> +       u32 i;
> +
> +       for (i = 0; i < info->config_complete_timeout_us; i++) {
> +               switch (alt_pr_fpga_state(mgr)) {
> +               case FPGA_MGR_STATE_WRITE_ERR:
> +                       return -EIO;
> +
> +               case FPGA_MGR_STATE_OPERATING:
> +                       dev_info(&mgr->dev,
> +                                "successful partial reconfiguration\n");
> +                       return 0;
> +
> +               default:
> +                       break;
> +               }
> +               udelay(1);
> +       }
> +       dev_err(&mgr->dev, "timed out waiting for write to complete\n");
> +       return -ETIMEDOUT;
> +}
> +
> +static const struct fpga_manager_ops alt_pr_ops = {
> +       .state = alt_pr_fpga_state,
> +       .write_init = alt_pr_fpga_write_init,
> +       .write = alt_pr_fpga_write,
> +       .write_complete = alt_pr_fpga_write_complete,
> +};
> +
> +int alt_pr_register(struct device *dev, void __iomem *reg_base)
> +{
> +       struct alt_pr_priv *priv;
> +       u32 val;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->reg_base = reg_base;
> +
> +       val = readl(priv->reg_base + ALT_PR_CSR_OFST);
> +
> +       dev_dbg(dev, "%s status=%d start=%d\n", __func__,
> +               (val & ALT_PR_CSR_STATUS_MSK) >> ALT_PR_CSR_STATUS_SFT,
> +               (int)(val & ALT_PR_CSR_PR_START));
> +
> +       return fpga_mgr_register(dev, dev_name(dev), &alt_pr_ops, priv);
> +}
> +EXPORT_SYMBOL_GPL(alt_pr_register);
> +
> +int alt_pr_unregister(struct device *dev)
> +{
> +       dev_dbg(dev, "%s\n", __func__);
> +
> +       fpga_mgr_unregister(dev);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(alt_pr_unregister);
> +
> +MODULE_AUTHOR("Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
> +MODULE_DESCRIPTION("Altera Partial Reconfiguration IP Core");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/fpga/altera-pr-ip-core.h b/drivers/fpga/altera-pr-ip-core.h
> new file mode 100644
> index 0000000..3810a90
> --- /dev/null
> +++ b/drivers/fpga/altera-pr-ip-core.h
> @@ -0,0 +1,29 @@
> +/*
> + * Driver for Altera Partial Reconfiguration IP Core
> + *
> + * Copyright (C) 2016 Intel Corporation
> + *
> + * Based on socfpga-a10.c Copyright (C) 2015-2016 Altera Corporation
> + *  by Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _ALT_PR_IP_CORE_H
> +#define _ALT_PR_IP_CORE_H
> +#include <linux/io.h>
> +
> +int alt_pr_register(struct device *dev, void __iomem *reg_base);
> +int alt_pr_unregister(struct device *dev);
> +
> +#endif /* _ALT_PR_IP_CORE_H */
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
