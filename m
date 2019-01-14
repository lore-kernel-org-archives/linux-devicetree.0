From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/7] soc: qcom: Add AOSS QMP genpd provider
Date: Mon, 14 Jan 2019 14:40:53 -0800
Message-ID: <154750565372.169631.9416138415370937156@swboyd.mtv.corp.google.com>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org> <20190106080915.4493-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-4-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-06 00:09:11)
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index dda19471057f..d81256ef5055 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -12,6 +12,15 @@ config QCOM_AOSS_QMP
>           micro-controller in the AOSS, using QMP, to control certain res=
ource
>           that are not exposed through RPMh.
> =20
> +config QCOM_AOSS_QMP_PD
> +       tristate "Qualcomm AOSS Messaging Power Domain driver"
> +       depends on QCOM_AOSS_QMP
> +       select PM_GENERIC_DOMAINS
> +       help
> +         This driver provides the means of controlling the AOSSs handlin=
g of

Is that possesive? AOSS's?

> +         low-power state for resources related to the remoteproc subsyst=
ems as
> +         well as controlling the debug clocks.
> +
>  config QCOM_COMMAND_DB
>         bool "Qualcomm Command DB"
>         depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/aoss-qmp-pd.c b/drivers/soc/qcom/aoss-qmp-p=
d.c
> new file mode 100644
> index 000000000000..62b8fcb9d09e
> --- /dev/null
> +++ b/drivers/soc/qcom/aoss-qmp-pd.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, Linaro Ltd
> + */
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/soc/qcom/aoss-qmp.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
> +
> +struct qmp_pd {
> +       struct qmp *qmp;
> +
> +       struct generic_pm_domain pd;
> +
> +       const char *name;
> +};
> +
> +#define to_qmp_pd_resource(res) container_of(res, struct qmp_pd, pd)
> +
> +struct qmp_pd_resource {
> +       const char *name;
> +       int (*on)(struct generic_pm_domain *domain);
> +       int (*off)(struct generic_pm_domain *domain);
> +};
> +
> +static int qmp_pd_clock_toggle(struct qmp_pd *res, bool enable)
> +{
> +       char buf[96];

Is 96 calculated from somewhere? Can it be a define because it's quite
magical.
