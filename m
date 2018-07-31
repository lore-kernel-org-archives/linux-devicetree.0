From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [RFC PATCH 2/2] fpga manager: Adding FPGA Manager support for
 Xilinx zynqmp
Date: Tue, 31 Jul 2018 13:08:48 +0000
Message-ID: <MWHPR0201MB34811402926886136673CE68C22E0@MWHPR0201MB3481.namprd02.prod.outlook.com>
References: <20180801100457.25614-1-nava.manne@xilinx.com>
 <20180801100457.25614-2-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801100457.25614-2-nava.manne@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <navam@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "atull@opensource.altera.com" <atull@opensource.altera.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Appana Durga Kedareswara Rao <appanad@xilinx.com>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>, "atull@kernel.org" <atull@kernel.org>
List-Id: devicetree@vger.kernel.org


+Alan Tull,

> -----Original Message-----
> From: Nava kishore Manne [mailto:nava.manne@xilinx.com]
> Sent: Wednesday, August 1, 2018 3:35 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; Soren Brinkmann <sorenb@xilinx.com>;
> atull@opensource.altera.com; moritz.fischer@ettus.com; Nava kishore Manne
> <navam@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Appana Durga
> Kedareswara Rao <appanad@xilinx.com>; chinnikishore369@gmail.com
> Subject: [RFC PATCH 2/2] fpga manager: Adding FPGA Manager support for
> Xilinx zynqmp
>=20
> This patch adds FPGA Manager support for the Xilinx ZynqMp chip.
>=20
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
>  drivers/fpga/Kconfig       |   6 ++
>  drivers/fpga/Makefile      |   1 +
>  drivers/fpga/zynqmp-fpga.c | 164
> +++++++++++++++++++++++++++++++++++++
>  3 files changed, 171 insertions(+)
>  create mode 100644 drivers/fpga/zynqmp-fpga.c
>=20
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig index
> cd84934774cc..b84e3555b3e3 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -26,6 +26,12 @@ config FPGA_MGR_ZYNQ_FPGA
>  	help
>  	  FPGA manager driver support for Xilinx Zynq FPGAs.
>=20
> +config FPGA_MGR_ZYNQMP_FPGA
> +	tristate "Xilinx Zynqmp FPGA"
> +	depends on ARCH_ZYNQMP || COMPILE_TEST
> +	help
> +	  FPGA manager driver support for Xilinx ZynqMp FPGAs.
> +
>  endif # FPGA
>=20
>  endmenu
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile index
> 8d83fc6b1613..ef444512cb01 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_FPGA)			+=3D fpga-mgr.o
>  # FPGA Manager Drivers
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+=3D socfpga.o
>  obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+=3D zynq-fpga.o
> +obj-$(CONFIG_FPGA_MGR_ZYNQMP_FPGA)	+=3D zynqmp-fpga.o
> diff --git a/drivers/fpga/zynqmp-fpga.c b/drivers/fpga/zynqmp-fpga.c new =
file
> mode 100644 index 000000000000..e4172c3a6868
> --- /dev/null
> +++ b/drivers/fpga/zynqmp-fpga.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2018 Xilinx, Inc.
> + *
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/fpga/fpga-mgr.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/string.h>
> +#include <linux/firmware/xilinx/zynqmp/firmware.h>
> +
> +/* Constant Definitions */
> +#define IXR_FPGA_DONE_MASK	0X00000008U
> +#define IXR_FPGA_ENCRYPTION_EN	0x00000008U
> +
> +/**
> + * struct zynqmp_fpga_priv - Private data structure
> + * @dev:	Device data structure
> + * @flags:	flags which is used to identify the bitfile type
> + */
> +struct zynqmp_fpga_priv {
> +	struct device *dev;
> +	u32 flags;
> +};
> +
> +static int zynqmp_fpga_ops_write_init(struct fpga_manager *mgr,
> +				      struct fpga_image_info *info,
> +				      const char *buf, size_t size) {
> +	struct zynqmp_fpga_priv *priv;
> +
> +	priv =3D mgr->priv;
> +	priv->flags =3D info->flags;
> +
> +	return 0;
> +}
> +
> +static int zynqmp_fpga_ops_write(struct fpga_manager *mgr,
> +				 const char *buf, size_t size)
> +{
> +	struct zynqmp_fpga_priv *priv;
> +	char *kbuf;
> +	size_t dma_size;
> +	dma_addr_t dma_addr;
> +	int ret;
> +	const struct zynqmp_eemi_ops *eemi_ops =3D
> zynqmp_pm_get_eemi_ops();
> +
> +	if (!eemi_ops || !eemi_ops->fpga_load)
> +		return -ENXIO;
> +
> +	priv =3D mgr->priv;
> +
> +	if (mgr->flags & IXR_FPGA_ENCRYPTION_EN)
> +		dma_size =3D size + ENCRYPTED_KEY_LEN;
> +	else
> +		dma_size =3D size;
> +
> +	kbuf =3D dma_alloc_coherent(priv->dev, dma_size, &dma_addr,
> GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	memcpy(kbuf, buf, size);
> +
> +	if (mgr->flags & IXR_FPGA_ENCRYPTION_EN)
> +		memcpy(kbuf + size, mgr->key, ENCRYPTED_KEY_LEN);
> +
> +	wmb(); /* ensure all writes are done before initiate FW call */
> +
> +	if (mgr->flags & IXR_FPGA_ENCRYPTION_EN)
> +		ret =3D eemi_ops->fpga_load(dma_addr, dma_addr + size,
> +					  mgr->flags);
> +	else
> +		ret =3D eemi_ops->fpga_load(dma_addr, size, mgr->flags);
> +
> +	dma_free_coherent(priv->dev, dma_size, kbuf, dma_addr);
> +
> +	return ret;
> +}
> +
> +static int zynqmp_fpga_ops_write_complete(struct fpga_manager *mgr,
> +					  struct fpga_image_info *info)
> +{
> +	return 0;
> +}
> +
> +static enum fpga_mgr_states zynqmp_fpga_ops_state(struct fpga_manager
> +*mgr) {
> +	u32 status;
> +	const struct zynqmp_eemi_ops *eemi_ops =3D
> zynqmp_pm_get_eemi_ops();
> +
> +	if (!eemi_ops || !eemi_ops->fpga_get_status)
> +		return FPGA_MGR_STATE_UNKNOWN;
> +
> +	eemi_ops->fpga_get_status(&status);
> +	if (status & IXR_FPGA_DONE_MASK)
> +		return FPGA_MGR_STATE_OPERATING;
> +
> +	return FPGA_MGR_STATE_UNKNOWN;
> +}
> +
> +static const struct fpga_manager_ops zynqmp_fpga_ops =3D {
> +	.state =3D zynqmp_fpga_ops_state,
> +	.write_init =3D zynqmp_fpga_ops_write_init,
> +	.write =3D zynqmp_fpga_ops_write,
> +	.write_complete =3D zynqmp_fpga_ops_write_complete, };
> +
> +static int zynqmp_fpga_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct zynqmp_fpga_priv *priv;
> +	int err, ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	ret =3D dma_set_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(44));
> +	if (ret < 0)
> +		dev_err(dev, "no usable DMA configuration");
> +
> +	err =3D fpga_mgr_register(dev, "Xilinx ZynqMP FPGA Manager",
> +				&zynqmp_fpga_ops, priv);
> +	if (err) {
> +		dev_err(dev, "unable to register FPGA manager");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zynqmp_fpga_remove(struct platform_device *pdev) {
> +	fpga_mgr_unregister(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id zynqmp_fpga_of_match[] =3D {
> +	{ .compatible =3D "xlnx,zynqmp-pcap-fpga", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, zynqmp_fpga_of_match);
> +
> +static struct platform_driver zynqmp_fpga_driver =3D {
> +	.probe =3D zynqmp_fpga_probe,
> +	.remove =3D zynqmp_fpga_remove,
> +	.driver =3D {
> +		.name =3D "zynqmp_fpga_manager",
> +		.of_match_table =3D of_match_ptr(zynqmp_fpga_of_match),
> +	},
> +};
> +
> +module_platform_driver(zynqmp_fpga_driver);
> +
> +MODULE_AUTHOR("Nava kishore Manne <navam@xilinx.com>");
> +MODULE_DESCRIPTION("Xilinx ZynqMp FPGA Manager");
> +MODULE_LICENSE("GPL");
> --
> 2.18.0
