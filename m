From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH V3 2/4] nvmem: imx: add i.MX8 nvmem driver
Date: Tue, 21 May 2019 09:32:47 +0100
Message-ID: <36036b4c-c154-d987-ffff-06f61005120c@linaro.org>
References: <20190515080703.19147-1-peng.fan@nxp.com>
 <20190515080703.19147-2-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515080703.19147-2-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org



On 15/05/2019 08:53, Peng Fan wrote:
> This patch adds i.MX8 nvmem ocotp driver to access fuse via
> RPC to i.MX8 system controller.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I don't see any dt-binding patches in my list. May be you forgot to add 
me in CC.

Can You please make sure that you add me to the cc of the dt-bindings 
patch so that I can take the driver and dt-bindings together via nvmem tree.
I will not be able to apply any driver patches without dt-bindings.

Thanks,
srini
> ---
> 
> V3:
>   Use imx_sc_msg_misc_fuse_read for req/resp
>   Drop uneccessary check
>   Drop the unnecessary type conversion
>   Minor fixes according to v2 comments
> 
> V2:
>   Add "scu" or "SCU", Add imx_sc_misc_otp_fuse_read, minor fixes
> 
>   drivers/nvmem/Kconfig         |   7 ++
>   drivers/nvmem/Makefile        |   2 +
>   drivers/nvmem/imx-ocotp-scu.c | 161 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 170 insertions(+)
>   create mode 100644 drivers/nvmem/imx-ocotp-scu.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 530d570724c9..79afe44195a1 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -36,6 +36,13 @@ config NVMEM_IMX_OCOTP
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-imx-ocotp.
>   
> +config NVMEM_IMX_OCOTP_SCU
> +	tristate "i.MX8 SCU On-Chip OTP Controller support"
> +	depends on IMX_SCU
> +	help
> +	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
> +	  available on i.MX8 SoCs.
> +
>   config NVMEM_LPC18XX_EEPROM
>   	tristate "NXP LPC18XX EEPROM Memory Support"
>   	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 2ece8ffffdda..30d653d34e57 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -13,6 +13,8 @@ obj-$(CONFIG_NVMEM_IMX_IIM)	+= nvmem-imx-iim.o
>   nvmem-imx-iim-y			:= imx-iim.o
>   obj-$(CONFIG_NVMEM_IMX_OCOTP)	+= nvmem-imx-ocotp.o
>   nvmem-imx-ocotp-y		:= imx-ocotp.o
> +obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+= nvmem-imx-ocotp-scu.o
> +nvmem-imx-ocotp-scu-y		:= imx-ocotp-scu.o
>   obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
>   nvmem_lpc18xx_eeprom-y	:= lpc18xx_eeprom.o
>   obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+= nvmem_lpc18xx_otp.o
> diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
> new file mode 100644
> index 000000000000..d9dc482ecb2f
> --- /dev/null
> +++ b/drivers/nvmem/imx-ocotp-scu.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * i.MX8 OCOTP fusebox driver
> + *
> + * Copyright 2019 NXP
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + */
> +
> +#include <linux/firmware/imx/sci.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +enum ocotp_devtype {
> +	IMX8QXP,
> +};
> +
> +struct ocotp_devtype_data {
> +	int devtype;
> +	int nregs;
> +};
> +
> +struct ocotp_priv {
> +	struct device *dev;
> +	const struct ocotp_devtype_data *data;
> +	struct imx_sc_ipc *nvmem_ipc;
> +};
> +
> +struct imx_sc_msg_misc_fuse_read {
> +	struct imx_sc_rpc_msg hdr;
> +	u32 word;
> +} __packed;
> +
> +static struct ocotp_devtype_data imx8qxp_data = {
> +	.devtype = IMX8QXP,
> +	.nregs = 800,
> +};
> +
> +static int imx_sc_misc_otp_fuse_read(struct imx_sc_ipc *ipc, u32 word,
> +				     u32 *val)
> +{
> +	struct imx_sc_msg_misc_fuse_read msg;
> +	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> +	int ret;
> +
> +	hdr->ver = IMX_SC_RPC_VERSION;
> +	hdr->svc = IMX_SC_RPC_SVC_MISC;
> +	hdr->func = IMX_SC_MISC_FUNC_OTP_FUSE_READ;
> +	hdr->size = 2;
> +
> +	msg.word = word;
> +
> +	ret = imx_scu_call_rpc(ipc, &msg, true);
> +	if (ret)
> +		return ret;
> +
> +	*val = msg.word;
> +
> +	return 0;
> +}
> +
> +static int imx_scu_ocotp_read(void *context, unsigned int offset,
> +			      void *val, size_t bytes)
> +{
> +	struct ocotp_priv *priv = context;
> +	u32 count, index, num_bytes;
> +	u32 *buf;
> +	void *p;
> +	int i, ret;
> +
> +	index = offset >> 2;
> +	num_bytes = round_up((offset % 4) + bytes, 4);
> +	count = num_bytes >> 2;
> +
> +	if (count > (priv->data->nregs - index))
> +		count = priv->data->nregs - index;
> +
> +	p = kzalloc(num_bytes, GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	buf = p;
> +
> +	for (i = index; i < (index + count); i++) {
> +		if (priv->data->devtype == IMX8QXP) {
> +			if ((i > 271) && (i < 544)) {
> +				*buf++ = 0;
> +				continue;
> +			}
> +		}
> +
> +		ret = imx_sc_misc_otp_fuse_read(priv->nvmem_ipc, i, buf);
> +		if (ret) {
> +			kfree(p);
> +			return ret;
> +		}
> +		buf++;
> +	}
> +
> +	memcpy(val, (u8 *)p + offset % 4, bytes);
> +
> +	kfree(p);
> +
> +	return 0;
> +}
> +
> +static struct nvmem_config imx_scu_ocotp_nvmem_config = {
> +	.name = "imx-scu-ocotp",
> +	.read_only = true,
> +	.word_size = 4,
> +	.stride = 1,
> +	.owner = THIS_MODULE,
> +	.reg_read = imx_scu_ocotp_read,
> +};
> +
> +static const struct of_device_id imx_scu_ocotp_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qxp-scu-ocotp", (void *)&imx8qxp_data },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, imx_scu_ocotp_dt_ids);
> +
> +static int imx_scu_ocotp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ocotp_priv *priv;
> +	struct nvmem_device *nvmem;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = imx_scu_get_handle(&priv->nvmem_ipc);
> +	if (ret)
> +		return ret;
> +
> +	priv->data = of_device_get_match_data(dev);
> +	priv->dev = dev;
> +	imx_scu_ocotp_nvmem_config.size = 4 * priv->data->nregs;
> +	imx_scu_ocotp_nvmem_config.dev = dev;
> +	imx_scu_ocotp_nvmem_config.priv = priv;
> +	nvmem = devm_nvmem_register(dev, &imx_scu_ocotp_nvmem_config);
> +
> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +static struct platform_driver imx_scu_ocotp_driver = {
> +	.probe	= imx_scu_ocotp_probe,
> +	.driver = {
> +		.name	= "imx_scu_ocotp",
> +		.of_match_table = imx_scu_ocotp_dt_ids,
> +	},
> +};
> +module_platform_driver(imx_scu_ocotp_driver);
> +
> +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> +MODULE_DESCRIPTION("i.MX8 SCU OCOTP fuse box driver");
> +MODULE_LICENSE("GPL v2");
> 
