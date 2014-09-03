From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3] hwspinlock: qcom: Add support for Qualcomm HW Mutex block
Date: Wed, 3 Sep 2014 07:49:18 -0500
Message-ID: <2B6A9AA9-E69F-47DF-A1E7-5C95B4E6FA94@codeaurora.org>
References: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <Bjorn.Andersson@sonymobile.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Suman Anna <s-anna@ti.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>, Courtney Cavin <courtney.cavin@sonymobile.com>
List-Id: devicetree@vger.kernel.org


On Sep 2, 2014, at 3:04 PM, Bjorn Andersson <Bjorn.Andersson@sonymobile=
=2Ecom> wrote:

> From: Kumar Gala <galak@codeaurora.org>
>=20
> Add driver for Qualcomm Hardware Mutex block that exists on newer
> Qualcomm SoCs.
>=20
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Eric Holmberg <eholmber@codeaurora.org>
> Cc: Courtney Cavin <courtney.cavin@sonymobile.com>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>
> [bjorn: added pm_runtime calls, from Courtney,
> 	added sfpb-mutex compatible,
> 	updated DT binding documentation formatting,
> 	based stride on resource size instead of hardcoded values,
> 	replaced msm prefix with qcom,
> 	cleaned up includes]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>=20
> We need this driver to add support for the shared memory manager, so =
I'm
> reviving Kumars patch from a year ago, with some additional sprinkles=
 on top.
>=20
> Changes since v2:
> - MODULE_DEVICE_TABLE
> - Changed prefix to qcom
> - Cleaned up includes
> - Rely on reg and num-locks to figure out stride, instead of of_match=
 data

I know Jeff prefers this method of computing stride, but I=92m not a fa=
n as there isn=92t a reason one could adjust qcom,num-locks in the dt f=
or some reason and leave regs alone.

>=20
> Changes since v1:
> - Added the pm_runtime calls needed to be able to boot a kernel with
>   pm_runtime and this driver, patch from Courtney.
> - Added sfpb-mutex compatible, for re-use of the driver in family A p=
latforms.
> - Updated formatting of DT binding documentation, while adding the ex=
tra
>   compatible.
> - Dropped Stephen Boyds Reviewed-by due to these changes.
>=20
> .../devicetree/bindings/hwlock/qcom-hwspinlock.txt |   35 +++++
> drivers/hwspinlock/Kconfig                         |   11 ++
> drivers/hwspinlock/Makefile                        |    1 +
> drivers/hwspinlock/qcom_hwspinlock.c               |  147 +++++++++++=
+++++++++
> 4 files changed, 194 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwsp=
inlock.txt
> create mode 100644 drivers/hwspinlock/qcom_hwspinlock.c
>=20
> diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock=
=2Etxt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> new file mode 100644
> index 0000000..27c7c80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> @@ -0,0 +1,35 @@
> +Qualcomm Hardware Mutex Block:
> +
> +The hardware block provides mutexes utilized between different proce=
ssors
> +on the SoC as part of the communication protocol used by these proce=
ssors.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,sfpb-mutex",
> +		    "qcom,tcsr-mutex=94

I dont get the purpose of having different compatible strings if there =
is no difference in the code between them.

> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: base address and size of the mutex registers
> +
> +- reg-names:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "mutex-base"
> +
> +- qcom,num-locks:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: the number of locks/mutex available in this block
> +
> +Example:
> +
> +	hwlock@fd484000 {
> +		compatible =3D "qcom,tcsr-mutex";
> +		reg =3D <0xfd484000 0x1000>;
> +		reg-names =3D "mutex-base";
> +		qcom,num-locks =3D <32>;
> +	};
> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
> index 3612cb5..af4c7e6 100644
> --- a/drivers/hwspinlock/Kconfig
> +++ b/drivers/hwspinlock/Kconfig
> @@ -8,6 +8,17 @@ config HWSPINLOCK
>=20
> menu "Hardware Spinlock drivers"
>=20
> +config HWSPINLOCK_QCOM
> +	tristate "Qualcomm Hardware Spinlock device"
> +	depends on ARCH_QCOM
> +	select HWSPINLOCK
> +	help
> +	  Say y here to support the Qualcomm Hardware Mutex functionality, =
which
> +	  provides a synchronisation mechanism for the various processors o=
n
> +	  the SoC.
> +
> +	  If unsure, say N.
> +
> config HWSPINLOCK_OMAP
> 	tristate "OMAP Hardware Spinlock device"
> 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SO=
C_AM43XX
> diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefil=
e
> index 93eb64b..f3bff48 100644
> --- a/drivers/hwspinlock/Makefile
> +++ b/drivers/hwspinlock/Makefile
> @@ -3,5 +3,6 @@
> #
>=20
> obj-$(CONFIG_HWSPINLOCK)		+=3D hwspinlock_core.o
> +obj-$(CONFIG_HWSPINLOCK_QCOM)		+=3D qcom_hwspinlock.o
> obj-$(CONFIG_HWSPINLOCK_OMAP)		+=3D omap_hwspinlock.o
> obj-$(CONFIG_HSEM_U8500)		+=3D u8500_hsem.o
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinloc=
k/qcom_hwspinlock.c
> new file mode 100644
> index 0000000..a9e5fa4
> --- /dev/null
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -0,0 +1,147 @@
> +/*
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2014, Sony Mobile Communications AB
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/hwspinlock.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "hwspinlock_internal.h"
> +
> +#define SPINLOCK_ID_APPS_PROC	1
> +#define BASE_ID			0
> +
> +static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
> +{
> +	void __iomem *lock_addr =3D lock->priv;
> +
> +	writel_relaxed(SPINLOCK_ID_APPS_PROC, lock_addr);
> +
> +	return readl_relaxed(lock_addr) =3D=3D SPINLOCK_ID_APPS_PROC;
> +}
> +
> +static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
> +{
> +	void __iomem *lock_addr =3D lock->priv;
> +	u32 lock_owner;
> +
> +	lock_owner =3D readl_relaxed(lock_addr);
> +	if (lock_owner !=3D SPINLOCK_ID_APPS_PROC) {
> +		pr_err("%s: spinlock not owned by us (actual owner is %d)\n",
> +				__func__, lock_owner);
> +	}
> +
> +	writel_relaxed(0, lock_addr);
> +}
> +
> +static const struct hwspinlock_ops qcom_hwspinlock_ops =3D {
> +	.trylock	=3D qcom_hwspinlock_trylock,
> +	.unlock		=3D qcom_hwspinlock_unlock,
> +};
> +
> +static const struct of_device_id qcom_hwspinlock_of_match[] =3D {
> +	{ .compatible =3D "qcom,sfpb-mutex" },
> +	{ .compatible =3D "qcom,tcsr-mutex" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
> +
> +static int qcom_hwspinlock_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct hwspinlock_device *bank;
> +	struct hwspinlock *hwlock;
> +	struct resource *res;
> +	void __iomem *iobase;
> +	size_t array_size;
> +	long stride, i;
> +	u32 num_locks;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(node, "qcom,num-locks", &num_locks);
> +	if (ret || num_locks =3D=3D 0)
> +		return -ENODEV;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "mutex-b=
ase");
> +	iobase =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(iobase))
> +		return PTR_ERR(iobase);
> +
> +	array_size =3D num_locks * sizeof(*hwlock);
> +	bank =3D devm_kzalloc(&pdev->dev, sizeof(*bank) + array_size, GFP_K=
ERNEL);
> +	if (!bank)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, bank);
> +
> +	stride =3D (long)resource_size(res) / num_locks;
> +	for (i =3D 0, hwlock =3D &bank->lock[0]; i < num_locks; i++, hwlock=
++)
> +		hwlock->priv =3D iobase + i * stride;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret =3D hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops=
,
> +						BASE_ID, num_locks);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int qcom_hwspinlock_remove(struct platform_device *pdev)
> +{
> +	struct hwspinlock_device *bank =3D platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret =3D hwspin_lock_unregister(bank);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_hwspinlock_driver =3D {
> +	.probe		=3D qcom_hwspinlock_probe,
> +	.remove		=3D qcom_hwspinlock_remove,
> +	.driver		=3D {
> +		.name	=3D "qcom_hwspinlock",
> +		.of_match_table =3D qcom_hwspinlock_of_match,
> +	},
> +};
> +
> +static int __init qcom_hwspinlock_init(void)
> +{
> +	return platform_driver_register(&qcom_hwspinlock_driver);
> +}
> +/* board init code might need to reserve hwspinlocks for predefined =
purposes */
> +postcore_initcall(qcom_hwspinlock_init);
> +
> +static void __exit qcom_hwspinlock_exit(void)
> +{
> +	platform_driver_unregister(&qcom_hwspinlock_driver);
> +}
> +module_exit(qcom_hwspinlock_exit);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Hardware spinlock driver for Qualcomm SoCs");
> +MODULE_AUTHOR("Kumar Gala <galak@codeaurora.org>");
> +MODULE_AUTHOR("Jeffrey Hugo <jhugo@codeaurora.org>");
> +MODULE_AUTHOR("Eric Holmberg <eholmber@codeaurora.org>");
> --=20
> 1.7.9.5
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-m=
sm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
