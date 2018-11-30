From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 2/6] char: fastrpc: Add Qualcomm fastrpc basic driver
 model
Date: Fri, 30 Nov 2018 17:13:24 +0100
Message-ID: <20181130161324.GA8031@kroah.com>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
 <20181130104657.14875-3-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130104657.14875-3-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 10:46:53AM +0000, Srinivas Kandagatla wrote:
> This patch adds basic driver model for qualcomm fastrpc.
> Each DSP rpmsg channel is represented as fastrpc channel context and
> is exposed as a character driver for userspace interface.
> Each compute context bank is represented as fastrpc-session-context,
> which are dynamically managed by the channel context char device.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/char/Kconfig   |  10 ++
>  drivers/char/Makefile  |   1 +
>  drivers/char/fastrpc.c | 337 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 348 insertions(+)
>  create mode 100644 drivers/char/fastrpc.c
> 
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 9d03b2ff5df6..75fd274c67df 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -552,6 +552,16 @@ config ADI
>  	  and SSM (Silicon Secured Memory).  Intended consumers of this
>  	  driver include crash and makedumpfile.
>  
> +config QCOM_FASTRPC
> +	tristate "Qualcomm FastRPC"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on RPMSG
> +	help
> +	  Provides a communication mechanism that allows for clients to
> +	  make remote method invocations across processor boundary to
> +	  applications DSP processor. Say M if you want to enable this
> +	  module.
> +
>  endmenu
>  
>  config RANDOM_TRUST_CPU
> diff --git a/drivers/char/Makefile b/drivers/char/Makefile
> index b8d42b4e979b..30ec9187350e 100644
> --- a/drivers/char/Makefile
> +++ b/drivers/char/Makefile
> @@ -58,3 +58,4 @@ js-rtc-y = rtc.o
>  obj-$(CONFIG_XILLYBUS)		+= xillybus/
>  obj-$(CONFIG_POWERNV_OP_PANEL)	+= powernv-op-panel.o
>  obj-$(CONFIG_ADI)		+= adi.o
> +obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> diff --git a/drivers/char/fastrpc.c b/drivers/char/fastrpc.c
> new file mode 100644
> index 000000000000..97d8062eb3e1
> --- /dev/null
> +++ b/drivers/char/fastrpc.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2011-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2018, Linaro Limited
> +
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/idr.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/rpmsg.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)
> +#define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
> +#define FASTRPC_MAX_SESSIONS	9 /*8 compute, 1 cpz*/
> +#define FASTRPC_CTX_MAX (256)
> +#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_DEVICE_NAME	"fastrpc"
> +
> +#define cdev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, cdev)
> +
> +static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> +						"sdsp", "cdsp"};
> +static dev_t fastrpc_major;

Why do you need a whole major number for this?  Why not just use the
misc interface instead?
