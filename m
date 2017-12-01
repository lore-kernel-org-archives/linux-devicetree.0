From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH 2/2] regulator: sc2731: Add regulator driver to support
 Spreadtrum SC2731 PMIC
Date: Fri, 1 Dec 2017 10:13:27 +0100
Message-ID: <CAOFm3uFWhOMy=0nibOjDP_vP+m7Dcf1cGOmXXgcrSy6PDfqEWQ@mail.gmail.com>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
 <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Erick Chen <erick.chen@spreadtrum.com>
Cc: Mark <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, lgirdwood@gmail.com, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

Erik,

On Fri, Dec 1, 2017 at 9:58 AM, Erick Chen <erick.chen@spreadtrum.com> wrote:
> Add regulator driver for Spreadtrum SC2731 device.
> It has 17 general purpose LDOs, BUCKs generator and
> digital output to control regulators.
>
> Signed-off-by: Erick Chen <erick.chen@spreadtrum.com>
> Reviewed-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
>  drivers/regulator/Kconfig            |    7 +
>  drivers/regulator/Makefile           |    1 +
>  drivers/regulator/sc2731-regulator.c |  276 ++++++++++++++++++++++++++++++++++
>  3 files changed, 284 insertions(+)
>  create mode 100644 drivers/regulator/sc2731-regulator.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 96cd55f..b27417c 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -744,6 +744,13 @@ config REGULATOR_S5M8767
>          via I2C bus. S5M8767A have 9 Bucks and 28 LDOs output and
>          supports DVS mode with 8bits of output voltage control.
>
> +config REGULATOR_SC2731
> +       tristate "Spreadtrum SC2731 power regulator driver"
> +       depends on MFD_SC27XX_PMIC || COMPILE_TEST
> +       help
> +         This driver provides support for the voltage regulators on the
> +         SC2731 PMIC.
> +
>  config REGULATOR_SKY81452
>         tristate "Skyworks Solutions SKY81452 voltage regulator"
>         depends on MFD_SKY81452
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 80ffc57..19fea09 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -95,6 +95,7 @@ obj-$(CONFIG_REGULATOR_RT5033)        += rt5033-regulator.o
>  obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
>  obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
>  obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
> +obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
>  obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
>  obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
>  obj-$(CONFIG_REGULATOR_STW481X_VMMC) += stw481x-vmmc.o
> diff --git a/drivers/regulator/sc2731-regulator.c b/drivers/regulator/sc2731-regulator.c
> new file mode 100644
> index 0000000..e56448a
> --- /dev/null
> +++ b/drivers/regulator/sc2731-regulator.c
> @@ -0,0 +1,276 @@
> +/*
> + * Copyright (C) 2017 Spreadtrum Communications Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */

I think that per Linus, and Thomas doc patches for SPDX ids this
should be instead either:

> +// SPDX-License-Identifier: GPL-2.0
> + // Copyright (c) 2017 Spreadtrum Communications Inc.

or at least this with the id on the first and the // comment style

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017 Spreadtrum Communications Inc.
> + *
> + */


-- 
Cordially
Philippe Ombredanne
