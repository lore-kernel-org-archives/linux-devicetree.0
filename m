From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 2/3] mfd: qcom-rpm: Driver for the Qualcomm RPM
Date: Tue, 20 Jan 2015 17:02:06 +0000
Message-ID: <20150120170206.GK30656@x1>
References: <1417038661-30209-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1417038661-30209-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417038661-30209-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Nov 2014, Bjorn Andersson wrote:

> Driver for the Resource Power Manager (RPM) found in Qualcomm 8660, 8=
960
> and 8064 based devices. The driver exposes resources that child drive=
rs
> can operate on; to implementing regulator, clock and bus frequency
> drivers.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>=20
> Lee, since your Acked-by earlier I've folded in the part of the RFC w=
here I add
> an extra parameter to qcom_rpm_write(). Part of that this is unchange=
d.
>=20
>  drivers/mfd/Kconfig          |  14 ++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/qcom_rpm.c       | 581 +++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/qcom_rpm.h |  13 +
>  4 files changed, 609 insertions(+)
>  create mode 100644 drivers/mfd/qcom_rpm.c
>  create mode 100644 include/linux/mfd/qcom_rpm.h

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 1456ea7..b6bcb79 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -567,6 +567,20 @@ config MFD_PM8921_CORE
>  	  Say M here if you want to include support for PM8921 chip as a mo=
dule.
>  	  This will build a module called "pm8921-core".
> =20
> +config MFD_QCOM_RPM
> +	tristate "Qualcomm Resource Power Manager (RPM)"
> +	depends on ARCH_QCOM && OF
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Resource Power Manager system found in the Qualcomm 8660, 8960 an=
d
> +	  8064 based devices.
> +
> +	  This is required to access many regulators, clocks and bus
> +	  frequencies controlled by the RPM on these devices.
> +
> +	  Say M here if you want to include support for the Qualcomm RPM as=
 a
> +	  module. This will build a module called "qcom_rpm".
> +
>  config MFD_SPMI_PMIC
>  	tristate "Qualcomm SPMI PMICs"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 8bd54b1..3364bbc 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+=3D si476x-core.o
>  obj-$(CONFIG_MFD_CS5535)	+=3D cs5535-mfd.o
>  obj-$(CONFIG_MFD_OMAP_USB_HOST)	+=3D omap-usb-host.o omap-usb-tll.o
>  obj-$(CONFIG_MFD_PM8921_CORE) 	+=3D pm8921-core.o ssbi.o
> +obj-$(CONFIG_MFD_QCOM_RPM)	+=3D qcom_rpm.o
>  obj-$(CONFIG_MFD_SPMI_PMIC)	+=3D qcom-spmi-pmic.o
>  obj-$(CONFIG_TPS65911_COMPARATOR)	+=3D tps65911-comparator.o
>  obj-$(CONFIG_MFD_TPS65090)	+=3D tps65090.o
> diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
> new file mode 100644
> index 0000000..f696328
> --- /dev/null
> +++ b/drivers/mfd/qcom_rpm.c
> @@ -0,0 +1,581 @@
> +/*
> + * Copyright (c) 2014, Sony Mobile Communications AB.
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Author: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 an=
d
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/qcom_rpm.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/mfd/qcom-rpm.h>
> +
> +struct qcom_rpm_resource {
> +	unsigned target_id;
> +	unsigned status_id;
> +	unsigned select_id;
> +	unsigned size;
> +};
> +
> +struct qcom_rpm_data {
> +	u32 version;
> +	const struct qcom_rpm_resource *resource_table;
> +	unsigned n_resources;
> +};
> +
> +struct qcom_rpm {
> +	struct device *dev;
> +	struct regmap *ipc_regmap;
> +	unsigned ipc_offset;
> +	unsigned ipc_bit;
> +
> +	struct completion ack;
> +	struct mutex lock;
> +
> +	void __iomem *status_regs;
> +	void __iomem *ctrl_regs;
> +	void __iomem *req_regs;
> +
> +	u32 ack_status;
> +
> +	const struct qcom_rpm_data *data;
> +};
> +
> +#define RPM_STATUS_REG(rpm, i)	((rpm)->status_regs + (i) * 4)
> +#define RPM_CTRL_REG(rpm, i)	((rpm)->ctrl_regs + (i) * 4)
> +#define RPM_REQ_REG(rpm, i)	((rpm)->req_regs + (i) * 4)
> +
> +#define RPM_REQUEST_TIMEOUT	(5 * HZ)
> +
> +#define RPM_REQUEST_CONTEXT	3
> +#define RPM_REQ_SELECT		11
> +#define RPM_ACK_CONTEXT		15
> +#define RPM_ACK_SELECTOR	23
> +#define RPM_SELECT_SIZE		7
> +
> +#define RPM_NOTIFICATION	BIT(30)
> +#define RPM_REJECTED		BIT(31)
> +
> +#define RPM_SIGNAL		BIT(2)
> +
> +static const struct qcom_rpm_resource apq8064_rpm_resource_table[] =3D=
 {
> +	[QCOM_RPM_CXO_CLK] =3D			{ 25, 9, 5, 1 },
> +	[QCOM_RPM_PXO_CLK] =3D			{ 26, 10, 6, 1 },
> +	[QCOM_RPM_APPS_FABRIC_CLK] =3D		{ 27, 11, 8, 1 },
> +	[QCOM_RPM_SYS_FABRIC_CLK] =3D		{ 28, 12, 9, 1 },
> +	[QCOM_RPM_MM_FABRIC_CLK] =3D		{ 29, 13, 10, 1 },
> +	[QCOM_RPM_DAYTONA_FABRIC_CLK] =3D		{ 30, 14, 11, 1 },
> +	[QCOM_RPM_SFPB_CLK] =3D			{ 31, 15, 12, 1 },
> +	[QCOM_RPM_CFPB_CLK] =3D			{ 32, 16, 13, 1 },
> +	[QCOM_RPM_MMFPB_CLK] =3D			{ 33, 17, 14, 1 },
> +	[QCOM_RPM_EBI1_CLK] =3D			{ 34, 18, 16, 1 },
> +	[QCOM_RPM_APPS_FABRIC_HALT] =3D		{ 35, 19, 18, 1 },
> +	[QCOM_RPM_APPS_FABRIC_MODE] =3D		{ 37, 20, 19, 1 },
> +	[QCOM_RPM_APPS_FABRIC_IOCTL] =3D		{ 40, 21, 20, 1 },
> +	[QCOM_RPM_APPS_FABRIC_ARB] =3D		{ 41, 22, 21, 12 },
> +	[QCOM_RPM_SYS_FABRIC_HALT] =3D		{ 53, 23, 22, 1 },
> +	[QCOM_RPM_SYS_FABRIC_MODE] =3D		{ 55, 24, 23, 1 },
> +	[QCOM_RPM_SYS_FABRIC_IOCTL] =3D		{ 58, 25, 24, 1 },
> +	[QCOM_RPM_SYS_FABRIC_ARB] =3D		{ 59, 26, 25, 30 },
> +	[QCOM_RPM_MM_FABRIC_HALT] =3D		{ 89, 27, 26, 1 },
> +	[QCOM_RPM_MM_FABRIC_MODE] =3D		{ 91, 28, 27, 1 },
> +	[QCOM_RPM_MM_FABRIC_IOCTL] =3D		{ 94, 29, 28, 1 },
> +	[QCOM_RPM_MM_FABRIC_ARB] =3D		{ 95, 30, 29, 21 },
> +	[QCOM_RPM_PM8921_SMPS1] =3D		{ 116, 31, 30, 2 },
> +	[QCOM_RPM_PM8921_SMPS2] =3D		{ 118, 33, 31, 2 },
> +	[QCOM_RPM_PM8921_SMPS3] =3D		{ 120, 35, 32, 2 },
> +	[QCOM_RPM_PM8921_SMPS4] =3D		{ 122, 37, 33, 2 },
> +	[QCOM_RPM_PM8921_SMPS5] =3D		{ 124, 39, 34, 2 },
> +	[QCOM_RPM_PM8921_SMPS6] =3D		{ 126, 41, 35, 2 },
> +	[QCOM_RPM_PM8921_SMPS7] =3D		{ 128, 43, 36, 2 },
> +	[QCOM_RPM_PM8921_SMPS8] =3D		{ 130, 45, 37, 2 },
> +	[QCOM_RPM_PM8921_LDO1] =3D		{ 132, 47, 38, 2 },
> +	[QCOM_RPM_PM8921_LDO2] =3D		{ 134, 49, 39, 2 },
> +	[QCOM_RPM_PM8921_LDO3] =3D		{ 136, 51, 40, 2 },
> +	[QCOM_RPM_PM8921_LDO4] =3D		{ 138, 53, 41, 2 },
> +	[QCOM_RPM_PM8921_LDO5] =3D		{ 140, 55, 42, 2 },
> +	[QCOM_RPM_PM8921_LDO6] =3D		{ 142, 57, 43, 2 },
> +	[QCOM_RPM_PM8921_LDO7] =3D		{ 144, 59, 44, 2 },
> +	[QCOM_RPM_PM8921_LDO8] =3D		{ 146, 61, 45, 2 },
> +	[QCOM_RPM_PM8921_LDO9] =3D		{ 148, 63, 46, 2 },
> +	[QCOM_RPM_PM8921_LDO10] =3D		{ 150, 65, 47, 2 },
> +	[QCOM_RPM_PM8921_LDO11] =3D		{ 152, 67, 48, 2 },
> +	[QCOM_RPM_PM8921_LDO12] =3D		{ 154, 69, 49, 2 },
> +	[QCOM_RPM_PM8921_LDO13] =3D		{ 156, 71, 50, 2 },
> +	[QCOM_RPM_PM8921_LDO14] =3D		{ 158, 73, 51, 2 },
> +	[QCOM_RPM_PM8921_LDO15] =3D		{ 160, 75, 52, 2 },
> +	[QCOM_RPM_PM8921_LDO16] =3D		{ 162, 77, 53, 2 },
> +	[QCOM_RPM_PM8921_LDO17] =3D		{ 164, 79, 54, 2 },
> +	[QCOM_RPM_PM8921_LDO18] =3D		{ 166, 81, 55, 2 },
> +	[QCOM_RPM_PM8921_LDO19] =3D		{ 168, 83, 56, 2 },
> +	[QCOM_RPM_PM8921_LDO20] =3D		{ 170, 85, 57, 2 },
> +	[QCOM_RPM_PM8921_LDO21] =3D		{ 172, 87, 58, 2 },
> +	[QCOM_RPM_PM8921_LDO22] =3D		{ 174, 89, 59, 2 },
> +	[QCOM_RPM_PM8921_LDO23] =3D		{ 176, 91, 60, 2 },
> +	[QCOM_RPM_PM8921_LDO24] =3D		{ 178, 93, 61, 2 },
> +	[QCOM_RPM_PM8921_LDO25] =3D		{ 180, 95, 62, 2 },
> +	[QCOM_RPM_PM8921_LDO26] =3D		{ 182, 97, 63, 2 },
> +	[QCOM_RPM_PM8921_LDO27] =3D		{ 184, 99, 64, 2 },
> +	[QCOM_RPM_PM8921_LDO28] =3D		{ 186, 101, 65, 2 },
> +	[QCOM_RPM_PM8921_LDO29] =3D		{ 188, 103, 66, 2 },
> +	[QCOM_RPM_PM8921_CLK1] =3D		{ 190, 105, 67, 2 },
> +	[QCOM_RPM_PM8921_CLK2] =3D		{ 192, 107, 68, 2 },
> +	[QCOM_RPM_PM8921_LVS1] =3D		{ 194, 109, 69, 1 },
> +	[QCOM_RPM_PM8921_LVS2] =3D		{ 195, 110, 70, 1 },
> +	[QCOM_RPM_PM8921_LVS3] =3D		{ 196, 111, 71, 1 },
> +	[QCOM_RPM_PM8921_LVS4] =3D		{ 197, 112, 72, 1 },
> +	[QCOM_RPM_PM8921_LVS5] =3D		{ 198, 113, 73, 1 },
> +	[QCOM_RPM_PM8921_LVS6] =3D		{ 199, 114, 74, 1 },
> +	[QCOM_RPM_PM8921_LVS7] =3D		{ 200, 115, 75, 1 },
> +	[QCOM_RPM_PM8821_SMPS1] =3D		{ 201, 116, 76, 2 },
> +	[QCOM_RPM_PM8821_SMPS2] =3D		{ 203, 118, 77, 2 },
> +	[QCOM_RPM_PM8821_LDO1] =3D		{ 205, 120, 78, 2 },
> +	[QCOM_RPM_PM8921_NCP] =3D			{ 207, 122, 80, 2 },
> +	[QCOM_RPM_CXO_BUFFERS] =3D		{ 209, 124, 81, 1 },
> +	[QCOM_RPM_USB_OTG_SWITCH] =3D		{ 210, 125, 82, 1 },
> +	[QCOM_RPM_HDMI_SWITCH] =3D		{ 211, 126, 83, 1 },
> +	[QCOM_RPM_DDR_DMM] =3D			{ 212, 127, 84, 2 },
> +	[QCOM_RPM_VDDMIN_GPIO] =3D		{ 215, 131, 89, 1 },
> +};
> +
> +static const struct qcom_rpm_data apq8064_template =3D {
> +	.version =3D 3,
> +	.resource_table =3D apq8064_rpm_resource_table,
> +	.n_resources =3D ARRAY_SIZE(apq8064_rpm_resource_table),
> +};
> +
> +static const struct qcom_rpm_resource msm8660_rpm_resource_table[] =3D=
 {
> +	[QCOM_RPM_CXO_CLK] =3D			{ 32, 12, 5, 1 },
> +	[QCOM_RPM_PXO_CLK] =3D			{ 33, 13, 6, 1 },
> +	[QCOM_RPM_PLL_4] =3D			{ 34, 14, 7, 1 },
> +	[QCOM_RPM_APPS_FABRIC_CLK] =3D		{ 35, 15, 8, 1 },
> +	[QCOM_RPM_SYS_FABRIC_CLK] =3D		{ 36, 16, 9, 1 },
> +	[QCOM_RPM_MM_FABRIC_CLK] =3D		{ 37, 17, 10, 1 },
> +	[QCOM_RPM_DAYTONA_FABRIC_CLK] =3D		{ 38, 18, 11, 1 },
> +	[QCOM_RPM_SFPB_CLK] =3D			{ 39, 19, 12, 1 },
> +	[QCOM_RPM_CFPB_CLK] =3D			{ 40, 20, 13, 1 },
> +	[QCOM_RPM_MMFPB_CLK] =3D			{ 41, 21, 14, 1 },
> +	[QCOM_RPM_SMI_CLK] =3D			{ 42, 22, 15, 1 },
> +	[QCOM_RPM_EBI1_CLK] =3D			{ 43, 23, 16, 1 },
> +	[QCOM_RPM_APPS_L2_CACHE_CTL] =3D		{ 44, 24, 17, 1 },
> +	[QCOM_RPM_APPS_FABRIC_HALT] =3D		{ 45, 25, 18, 2 },
> +	[QCOM_RPM_APPS_FABRIC_MODE] =3D		{ 47, 26, 19, 3 },
> +	[QCOM_RPM_APPS_FABRIC_ARB] =3D		{ 51, 28, 21, 6 },
> +	[QCOM_RPM_SYS_FABRIC_HALT] =3D		{ 63, 29, 22, 2 },
> +	[QCOM_RPM_SYS_FABRIC_MODE] =3D		{ 65, 30, 23, 3 },
> +	[QCOM_RPM_SYS_FABRIC_ARB] =3D		{ 69, 32, 25, 22 },
> +	[QCOM_RPM_MM_FABRIC_HALT] =3D		{ 105, 33, 26, 2 },
> +	[QCOM_RPM_MM_FABRIC_MODE] =3D		{ 107, 34, 27, 3 },
> +	[QCOM_RPM_MM_FABRIC_ARB] =3D		{ 111, 36, 29, 23 },
> +	[QCOM_RPM_PM8901_SMPS0] =3D		{ 134, 37, 30, 2 },
> +	[QCOM_RPM_PM8901_SMPS1] =3D		{ 136, 39, 31, 2 },
> +	[QCOM_RPM_PM8901_SMPS2] =3D		{ 138, 41, 32, 2 },
> +	[QCOM_RPM_PM8901_SMPS3] =3D		{ 140, 43, 33, 2 },
> +	[QCOM_RPM_PM8901_SMPS4] =3D		{ 142, 45, 34, 2 },
> +	[QCOM_RPM_PM8901_LDO0] =3D		{ 144, 47, 35, 2 },
> +	[QCOM_RPM_PM8901_LDO1] =3D		{ 146, 49, 36, 2 },
> +	[QCOM_RPM_PM8901_LDO2] =3D		{ 148, 51, 37, 2 },
> +	[QCOM_RPM_PM8901_LDO3] =3D		{ 150, 53, 38, 2 },
> +	[QCOM_RPM_PM8901_LDO4] =3D		{ 152, 55, 39, 2 },
> +	[QCOM_RPM_PM8901_LDO5] =3D		{ 154, 57, 40, 2 },
> +	[QCOM_RPM_PM8901_LDO6] =3D		{ 156, 59, 41, 2 },
> +	[QCOM_RPM_PM8901_LVS0] =3D		{ 158, 61, 42, 1 },
> +	[QCOM_RPM_PM8901_LVS1] =3D		{ 159, 62, 43, 1 },
> +	[QCOM_RPM_PM8901_LVS2] =3D		{ 160, 63, 44, 1 },
> +	[QCOM_RPM_PM8901_LVS3] =3D		{ 161, 64, 45, 1 },
> +	[QCOM_RPM_PM8901_MVS] =3D			{ 162, 65, 46, 1 },
> +	[QCOM_RPM_PM8058_SMPS0] =3D		{ 163, 66, 47, 2 },
> +	[QCOM_RPM_PM8058_SMPS1] =3D		{ 165, 68, 48, 2 },
> +	[QCOM_RPM_PM8058_SMPS2] =3D		{ 167, 70, 49, 2 },
> +	[QCOM_RPM_PM8058_SMPS3] =3D		{ 169, 72, 50, 2 },
> +	[QCOM_RPM_PM8058_SMPS4] =3D		{ 171, 74, 51, 2 },
> +	[QCOM_RPM_PM8058_LDO0] =3D		{ 173, 76, 52, 2 },
> +	[QCOM_RPM_PM8058_LDO1] =3D		{ 175, 78, 53, 2 },
> +	[QCOM_RPM_PM8058_LDO2] =3D		{ 177, 80, 54, 2 },
> +	[QCOM_RPM_PM8058_LDO3] =3D		{ 179, 82, 55, 2 },
> +	[QCOM_RPM_PM8058_LDO4] =3D		{ 181, 84, 56, 2 },
> +	[QCOM_RPM_PM8058_LDO5] =3D		{ 183, 86, 57, 2 },
> +	[QCOM_RPM_PM8058_LDO6] =3D		{ 185, 88, 58, 2 },
> +	[QCOM_RPM_PM8058_LDO7] =3D		{ 187, 90, 59, 2 },
> +	[QCOM_RPM_PM8058_LDO8] =3D		{ 189, 92, 60, 2 },
> +	[QCOM_RPM_PM8058_LDO9] =3D		{ 191, 94, 61, 2 },
> +	[QCOM_RPM_PM8058_LDO10] =3D		{ 193, 96, 62, 2 },
> +	[QCOM_RPM_PM8058_LDO11] =3D		{ 195, 98, 63, 2 },
> +	[QCOM_RPM_PM8058_LDO12] =3D		{ 197, 100, 64, 2 },
> +	[QCOM_RPM_PM8058_LDO13] =3D		{ 199, 102, 65, 2 },
> +	[QCOM_RPM_PM8058_LDO14] =3D		{ 201, 104, 66, 2 },
> +	[QCOM_RPM_PM8058_LDO15] =3D		{ 203, 106, 67, 2 },
> +	[QCOM_RPM_PM8058_LDO16] =3D		{ 205, 108, 68, 2 },
> +	[QCOM_RPM_PM8058_LDO17] =3D		{ 207, 110, 69, 2 },
> +	[QCOM_RPM_PM8058_LDO18] =3D		{ 209, 112, 70, 2 },
> +	[QCOM_RPM_PM8058_LDO19] =3D		{ 211, 114, 71, 2 },
> +	[QCOM_RPM_PM8058_LDO20] =3D		{ 213, 116, 72, 2 },
> +	[QCOM_RPM_PM8058_LDO21] =3D		{ 215, 118, 73, 2 },
> +	[QCOM_RPM_PM8058_LDO22] =3D		{ 217, 120, 74, 2 },
> +	[QCOM_RPM_PM8058_LDO23] =3D		{ 219, 122, 75, 2 },
> +	[QCOM_RPM_PM8058_LDO24] =3D		{ 221, 124, 76, 2 },
> +	[QCOM_RPM_PM8058_LDO25] =3D		{ 223, 126, 77, 2 },
> +	[QCOM_RPM_PM8058_LVS0] =3D		{ 225, 128, 78, 1 },
> +	[QCOM_RPM_PM8058_LVS1] =3D		{ 226, 129, 79, 1 },
> +	[QCOM_RPM_PM8058_NCP] =3D			{ 227, 130, 80, 2 },
> +	[QCOM_RPM_CXO_BUFFERS] =3D		{ 229, 132, 81, 1 },
> +};
> +
> +static const struct qcom_rpm_data msm8660_template =3D {
> +	.version =3D 2,
> +	.resource_table =3D msm8660_rpm_resource_table,
> +	.n_resources =3D ARRAY_SIZE(msm8660_rpm_resource_table),
> +};
> +
> +static const struct qcom_rpm_resource msm8960_rpm_resource_table[] =3D=
 {
> +	[QCOM_RPM_CXO_CLK] =3D			{ 25, 9, 5, 1 },
> +	[QCOM_RPM_PXO_CLK] =3D			{ 26, 10, 6, 1 },
> +	[QCOM_RPM_APPS_FABRIC_CLK] =3D		{ 27, 11, 8, 1 },
> +	[QCOM_RPM_SYS_FABRIC_CLK] =3D		{ 28, 12, 9, 1 },
> +	[QCOM_RPM_MM_FABRIC_CLK] =3D		{ 29, 13, 10, 1 },
> +	[QCOM_RPM_DAYTONA_FABRIC_CLK] =3D		{ 30, 14, 11, 1 },
> +	[QCOM_RPM_SFPB_CLK] =3D			{ 31, 15, 12, 1 },
> +	[QCOM_RPM_CFPB_CLK] =3D			{ 32, 16, 13, 1 },
> +	[QCOM_RPM_MMFPB_CLK] =3D			{ 33, 17, 14, 1 },
> +	[QCOM_RPM_EBI1_CLK] =3D			{ 34, 18, 16, 1 },
> +	[QCOM_RPM_APPS_FABRIC_HALT] =3D		{ 35, 19, 18, 1 },
> +	[QCOM_RPM_APPS_FABRIC_MODE] =3D		{ 37, 20, 19, 1 },
> +	[QCOM_RPM_APPS_FABRIC_IOCTL] =3D		{ 40, 21, 20, 1 },
> +	[QCOM_RPM_APPS_FABRIC_ARB] =3D		{ 41, 22, 21, 12 },
> +	[QCOM_RPM_SYS_FABRIC_HALT] =3D		{ 53, 23, 22, 1 },
> +	[QCOM_RPM_SYS_FABRIC_MODE] =3D		{ 55, 24, 23, 1 },
> +	[QCOM_RPM_SYS_FABRIC_IOCTL] =3D		{ 58, 25, 24, 1 },
> +	[QCOM_RPM_SYS_FABRIC_ARB] =3D		{ 59, 26, 25, 29 },
> +	[QCOM_RPM_MM_FABRIC_HALT] =3D		{ 88, 27, 26, 1 },
> +	[QCOM_RPM_MM_FABRIC_MODE] =3D		{ 90, 28, 27, 1 },
> +	[QCOM_RPM_MM_FABRIC_IOCTL] =3D		{ 93, 29, 28, 1 },
> +	[QCOM_RPM_MM_FABRIC_ARB] =3D		{ 94, 30, 29, 23 },
> +	[QCOM_RPM_PM8921_SMPS1] =3D		{ 117, 31, 30, 2 },
> +	[QCOM_RPM_PM8921_SMPS2] =3D		{ 119, 33, 31, 2 },
> +	[QCOM_RPM_PM8921_SMPS3] =3D		{ 121, 35, 32, 2 },
> +	[QCOM_RPM_PM8921_SMPS4] =3D		{ 123, 37, 33, 2 },
> +	[QCOM_RPM_PM8921_SMPS5] =3D		{ 125, 39, 34, 2 },
> +	[QCOM_RPM_PM8921_SMPS6] =3D		{ 127, 41, 35, 2 },
> +	[QCOM_RPM_PM8921_SMPS7] =3D		{ 129, 43, 36, 2 },
> +	[QCOM_RPM_PM8921_SMPS8] =3D		{ 131, 45, 37, 2 },
> +	[QCOM_RPM_PM8921_LDO1] =3D		{ 133, 47, 38, 2 },
> +	[QCOM_RPM_PM8921_LDO2] =3D		{ 135, 49, 39, 2 },
> +	[QCOM_RPM_PM8921_LDO3] =3D		{ 137, 51, 40, 2 },
> +	[QCOM_RPM_PM8921_LDO4] =3D		{ 139, 53, 41, 2 },
> +	[QCOM_RPM_PM8921_LDO5] =3D		{ 141, 55, 42, 2 },
> +	[QCOM_RPM_PM8921_LDO6] =3D		{ 143, 57, 43, 2 },
> +	[QCOM_RPM_PM8921_LDO7] =3D		{ 145, 59, 44, 2 },
> +	[QCOM_RPM_PM8921_LDO8] =3D		{ 147, 61, 45, 2 },
> +	[QCOM_RPM_PM8921_LDO9] =3D		{ 149, 63, 46, 2 },
> +	[QCOM_RPM_PM8921_LDO10] =3D		{ 151, 65, 47, 2 },
> +	[QCOM_RPM_PM8921_LDO11] =3D		{ 153, 67, 48, 2 },
> +	[QCOM_RPM_PM8921_LDO12] =3D		{ 155, 69, 49, 2 },
> +	[QCOM_RPM_PM8921_LDO13] =3D		{ 157, 71, 50, 2 },
> +	[QCOM_RPM_PM8921_LDO14] =3D		{ 159, 73, 51, 2 },
> +	[QCOM_RPM_PM8921_LDO15] =3D		{ 161, 75, 52, 2 },
> +	[QCOM_RPM_PM8921_LDO16] =3D		{ 163, 77, 53, 2 },
> +	[QCOM_RPM_PM8921_LDO17] =3D		{ 165, 79, 54, 2 },
> +	[QCOM_RPM_PM8921_LDO18] =3D		{ 167, 81, 55, 2 },
> +	[QCOM_RPM_PM8921_LDO19] =3D		{ 169, 83, 56, 2 },
> +	[QCOM_RPM_PM8921_LDO20] =3D		{ 171, 85, 57, 2 },
> +	[QCOM_RPM_PM8921_LDO21] =3D		{ 173, 87, 58, 2 },
> +	[QCOM_RPM_PM8921_LDO22] =3D		{ 175, 89, 59, 2 },
> +	[QCOM_RPM_PM8921_LDO23] =3D		{ 177, 91, 60, 2 },
> +	[QCOM_RPM_PM8921_LDO24] =3D		{ 179, 93, 61, 2 },
> +	[QCOM_RPM_PM8921_LDO25] =3D		{ 181, 95, 62, 2 },
> +	[QCOM_RPM_PM8921_LDO26] =3D		{ 183, 97, 63, 2 },
> +	[QCOM_RPM_PM8921_LDO27] =3D		{ 185, 99, 64, 2 },
> +	[QCOM_RPM_PM8921_LDO28] =3D		{ 187, 101, 65, 2 },
> +	[QCOM_RPM_PM8921_LDO29] =3D		{ 189, 103, 66, 2 },
> +	[QCOM_RPM_PM8921_CLK1] =3D		{ 191, 105, 67, 2 },
> +	[QCOM_RPM_PM8921_CLK2] =3D		{ 193, 107, 68, 2 },
> +	[QCOM_RPM_PM8921_LVS1] =3D		{ 195, 109, 69, 1 },
> +	[QCOM_RPM_PM8921_LVS2] =3D		{ 196, 110, 70, 1 },
> +	[QCOM_RPM_PM8921_LVS3] =3D		{ 197, 111, 71, 1 },
> +	[QCOM_RPM_PM8921_LVS4] =3D		{ 198, 112, 72, 1 },
> +	[QCOM_RPM_PM8921_LVS5] =3D		{ 199, 113, 73, 1 },
> +	[QCOM_RPM_PM8921_LVS6] =3D		{ 200, 114, 74, 1 },
> +	[QCOM_RPM_PM8921_LVS7] =3D		{ 201, 115, 75, 1 },
> +	[QCOM_RPM_PM8921_NCP] =3D			{ 202, 116, 80, 2 },
> +	[QCOM_RPM_CXO_BUFFERS] =3D		{ 204, 118, 81, 1 },
> +	[QCOM_RPM_USB_OTG_SWITCH] =3D		{ 205, 119, 82, 1 },
> +	[QCOM_RPM_HDMI_SWITCH] =3D		{ 206, 120, 83, 1 },
> +	[QCOM_RPM_DDR_DMM] =3D			{ 207, 121, 84, 2 },
> +};
> +
> +static const struct qcom_rpm_data msm8960_template =3D {
> +	.version =3D 3,
> +	.resource_table =3D msm8960_rpm_resource_table,
> +	.n_resources =3D ARRAY_SIZE(msm8960_rpm_resource_table),
> +};
> +
> +static const struct of_device_id qcom_rpm_of_match[] =3D {
> +	{ .compatible =3D "qcom,rpm-apq8064", .data =3D &apq8064_template }=
,
> +	{ .compatible =3D "qcom,rpm-msm8660", .data =3D &msm8660_template }=
,
> +	{ .compatible =3D "qcom,rpm-msm8960", .data =3D &msm8960_template }=
,
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_rpm_of_match);
> +
> +int qcom_rpm_write(struct qcom_rpm *rpm,
> +		   int state,
> +		   int resource,
> +		   u32 *buf, size_t count)
> +{
> +	const struct qcom_rpm_resource *res;
> +	const struct qcom_rpm_data *data =3D rpm->data;
> +	u32 sel_mask[RPM_SELECT_SIZE] =3D { 0 };
> +	int left;
> +	int ret =3D 0;
> +	int i;
> +
> +	if (WARN_ON(resource < 0 || resource >=3D data->n_resources))
> +		return -EINVAL;
> +
> +	res =3D &data->resource_table[resource];
> +	if (WARN_ON(res->size !=3D count))
> +		return -EINVAL;
> +
> +	mutex_lock(&rpm->lock);
> +
> +	for (i =3D 0; i < res->size; i++)
> +		writel_relaxed(buf[i], RPM_REQ_REG(rpm, res->target_id + i));
> +
> +	bitmap_set((unsigned long *)sel_mask, res->select_id, 1);
> +	for (i =3D 0; i < ARRAY_SIZE(sel_mask); i++) {
> +		writel_relaxed(sel_mask[i],
> +			       RPM_CTRL_REG(rpm, RPM_REQ_SELECT + i));
> +	}
> +
> +	writel_relaxed(BIT(state), RPM_CTRL_REG(rpm, RPM_REQUEST_CONTEXT));
> +
> +	reinit_completion(&rpm->ack);
> +	regmap_write(rpm->ipc_regmap, rpm->ipc_offset, BIT(rpm->ipc_bit));
> +
> +	left =3D wait_for_completion_timeout(&rpm->ack, RPM_REQUEST_TIMEOUT=
);
> +	if (!left)
> +		ret =3D -ETIMEDOUT;
> +	else if (rpm->ack_status & RPM_REJECTED)
> +		ret =3D -EIO;
> +
> +	mutex_unlock(&rpm->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(qcom_rpm_write);
> +
> +static irqreturn_t qcom_rpm_ack_interrupt(int irq, void *dev)
> +{
> +	struct qcom_rpm *rpm =3D dev;
> +	u32 ack;
> +	int i;
> +
> +	ack =3D readl_relaxed(RPM_CTRL_REG(rpm, RPM_ACK_CONTEXT));
> +	for (i =3D 0; i < RPM_SELECT_SIZE; i++)
> +		writel_relaxed(0, RPM_CTRL_REG(rpm, RPM_ACK_SELECTOR + i));
> +	writel(0, RPM_CTRL_REG(rpm, RPM_ACK_CONTEXT));
> +
> +	if (ack & RPM_NOTIFICATION) {
> +		dev_warn(rpm->dev, "ignoring notification!\n");
> +	} else {
> +		rpm->ack_status =3D ack;
> +		complete(&rpm->ack);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t qcom_rpm_err_interrupt(int irq, void *dev)
> +{
> +	struct qcom_rpm *rpm =3D dev;
> +
> +	regmap_write(rpm->ipc_regmap, rpm->ipc_offset, BIT(rpm->ipc_bit));
> +	dev_err(rpm->dev, "RPM triggered fatal error\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t qcom_rpm_wakeup_interrupt(int irq, void *dev)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_rpm_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *syscon_np;
> +	struct resource *res;
> +	struct qcom_rpm *rpm;
> +	u32 fw_version[3];
> +	int irq_wakeup;
> +	int irq_ack;
> +	int irq_err;
> +	int ret;
> +
> +	rpm =3D devm_kzalloc(&pdev->dev, sizeof(*rpm), GFP_KERNEL);
> +	if (!rpm)
> +		return -ENOMEM;
> +
> +	rpm->dev =3D &pdev->dev;
> +	mutex_init(&rpm->lock);
> +	init_completion(&rpm->ack);
> +
> +	irq_ack =3D platform_get_irq_byname(pdev, "ack");
> +	if (irq_ack < 0) {
> +		dev_err(&pdev->dev, "required ack interrupt missing\n");
> +		return irq_ack;
> +	}
> +
> +	irq_err =3D platform_get_irq_byname(pdev, "err");
> +	if (irq_err < 0) {
> +		dev_err(&pdev->dev, "required err interrupt missing\n");
> +		return irq_err;
> +	}
> +
> +	irq_wakeup =3D platform_get_irq_byname(pdev, "wakeup");
> +	if (irq_wakeup < 0) {
> +		dev_err(&pdev->dev, "required wakeup interrupt missing\n");
> +		return irq_wakeup;
> +	}
> +
> +	match =3D of_match_device(qcom_rpm_of_match, &pdev->dev);
> +	rpm->data =3D match->data;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rpm->status_regs =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(rpm->status_regs))
> +		return PTR_ERR(rpm->status_regs);
> +	rpm->ctrl_regs =3D rpm->status_regs + 0x400;
> +	rpm->req_regs =3D rpm->status_regs + 0x600;
> +
> +	syscon_np =3D of_parse_phandle(pdev->dev.of_node, "qcom,ipc", 0);
> +	if (!syscon_np) {
> +		dev_err(&pdev->dev, "no qcom,ipc node\n");
> +		return -ENODEV;
> +	}
> +
> +	rpm->ipc_regmap =3D syscon_node_to_regmap(syscon_np);
> +	if (IS_ERR(rpm->ipc_regmap))
> +		return PTR_ERR(rpm->ipc_regmap);
> +
> +	ret =3D of_property_read_u32_index(pdev->dev.of_node, "qcom,ipc", 1=
,
> +					 &rpm->ipc_offset);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "no offset in qcom,ipc\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_read_u32_index(pdev->dev.of_node, "qcom,ipc", 2=
,
> +					 &rpm->ipc_bit);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "no bit in qcom,ipc\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, rpm);
> +
> +	fw_version[0] =3D readl(RPM_STATUS_REG(rpm, 0));
> +	fw_version[1] =3D readl(RPM_STATUS_REG(rpm, 1));
> +	fw_version[2] =3D readl(RPM_STATUS_REG(rpm, 2));
> +	if (fw_version[0] !=3D rpm->data->version) {
> +		dev_err(&pdev->dev,
> +			"RPM version %u.%u.%u incompatible with driver version %u",
> +			fw_version[0],
> +			fw_version[1],
> +			fw_version[2],
> +			rpm->data->version);
> +		return -EFAULT;
> +	}
> +
> +	dev_info(&pdev->dev, "RPM firmware %u.%u.%u\n", fw_version[0],
> +							fw_version[1],
> +							fw_version[2]);
> +
> +	ret =3D devm_request_irq(&pdev->dev,
> +			       irq_ack,
> +			       qcom_rpm_ack_interrupt,
> +			       IRQF_TRIGGER_RISING | IRQF_NO_SUSPEND,
> +			       "qcom_rpm_ack",
> +			       rpm);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request ack interrupt\n");
> +		return ret;
> +	}
> +
> +	ret =3D irq_set_irq_wake(irq_ack, 1);
> +	if (ret)
> +		dev_warn(&pdev->dev, "failed to mark ack irq as wakeup\n");
> +
> +	ret =3D devm_request_irq(&pdev->dev,
> +			       irq_err,
> +			       qcom_rpm_err_interrupt,
> +			       IRQF_TRIGGER_RISING,
> +			       "qcom_rpm_err",
> +			       rpm);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request err interrupt\n");
> +		return ret;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev,
> +			       irq_wakeup,
> +			       qcom_rpm_wakeup_interrupt,
> +			       IRQF_TRIGGER_RISING,
> +			       "qcom_rpm_wakeup",
> +			       rpm);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request wakeup interrupt\n");
> +		return ret;
> +	}
> +
> +	ret =3D irq_set_irq_wake(irq_wakeup, 1);
> +	if (ret)
> +		dev_warn(&pdev->dev, "failed to mark wakeup irq as wakeup\n");
> +
> +	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->d=
ev);
> +}
> +
> +static int qcom_rpm_remove(struct platform_device *pdev)
> +{
> +	of_platform_depopulate(&pdev->dev);
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_rpm_driver =3D {
> +	.probe =3D qcom_rpm_probe,
> +	.remove =3D qcom_rpm_remove,
> +	.driver  =3D {
> +		.name  =3D "qcom_rpm",
> +		.of_match_table =3D qcom_rpm_of_match,
> +	},
> +};
> +
> +static int __init qcom_rpm_init(void)
> +{
> +	return platform_driver_register(&qcom_rpm_driver);
> +}
> +arch_initcall(qcom_rpm_init);
> +
> +static void __exit qcom_rpm_exit(void)
> +{
> +	platform_driver_unregister(&qcom_rpm_driver);
> +}
> +module_exit(qcom_rpm_exit)
> +
> +MODULE_DESCRIPTION("Qualcomm Resource Power Manager driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@sonymobile.com>");
> diff --git a/include/linux/mfd/qcom_rpm.h b/include/linux/mfd/qcom_rp=
m.h
> new file mode 100644
> index 0000000..742ebf1
> --- /dev/null
> +++ b/include/linux/mfd/qcom_rpm.h
> @@ -0,0 +1,13 @@
> +#ifndef __QCOM_RPM_H__
> +#define __QCOM_RPM_H__
> +
> +#include <linux/types.h>
> +
> +struct qcom_rpm;
> +
> +#define QCOM_RPM_ACTIVE_STATE	0
> +#define QCOM_RPM_SLEEP_STATE	1
> +
> +int qcom_rpm_write(struct qcom_rpm *rpm, int state, int resource, u3=
2 *buf, size_t count);
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
