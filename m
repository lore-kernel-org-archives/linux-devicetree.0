From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/8] soc: qcom: rpmpd: Add a Power domain driver to model
 corners
Date: Tue, 04 Dec 2018 15:12:47 -0800
Message-ID: <154396516737.88331.4646719751490719649@swboyd.mtv.corp.google.com>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-4-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204052119.806-4-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Overall looks good to me, just some nitpicks around modules and
includes.

Quoting Rajendra Nayak (2018-12-03 21:21:14)
> The Power domains for corners just pass the performance state set by the
> consumers to the RPM (Remote Power manager) which then takes care
> of setting the appropriate voltage on the corresponding rails to
> meet the performance needs.
> =

> We add all Power domain data needed on msm8996 here. This driver can easi=
ly
> be extended by adding data for other qualcomm SoCs as well.
> =


Why is "Power" capitalized in power domain?

> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index f25b54cd6cf8..f1b25fdcf2ad 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -21,3 +21,4 @@ obj-$(CONFIG_QCOM_WCNSS_CTRL) +=3D wcnss_ctrl.o
>  obj-$(CONFIG_QCOM_APR) +=3D apr.o
>  obj-$(CONFIG_QCOM_LLCC) +=3D llcc-slice.o
>  obj-$(CONFIG_QCOM_SDM845_LLCC) +=3D llcc-sdm845.o
> +obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> new file mode 100644
> index 000000000000..a0b9f122d793
> --- /dev/null
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved. */
> +
> +#include <linux/err.h>
> +#include <linux/export.h>

And what is exported?

> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

Is it a module? It's only bool so I don't think so.

> +#include <linux/mutex.h>
> +#include <linux/pm_domain.h>
> +#include <linux/mfd/qcom_rpm.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/qcom/smd-rpm.h>
> +
> +#include <dt-bindings/mfd/qcom-rpm.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +
> +#define domain_to_rpmpd(domain) container_of(domain, struct rpmpd, pd)
> +
> +/* Resource types */
> +#define RPMPD_SMPA 0x61706d73
> +#define RPMPD_LDOA 0x616f646c
> +
> +/* Operation Keys */
> +#define KEY_CORNER             0x6e726f63 /* corn */
> +#define KEY_ENABLE             0x6e657773 /* swen */
> +#define KEY_FLOOR_CORNER       0x636676   /* vfc */
> +
> +#define DEFINE_RPMPD_CORN_SMPA(_platform, _name, _active, r_id)         =
       \
> +       static struct rpmpd _platform##_##_active;                      \
> +       static struct rpmpd _platform##_##_name =3D {                    =
 \
> +               .pd =3D { .name =3D #_name, },                           =
   \
> +               .peer =3D &_platform##_##_active,                        =
 \
> +               .res_type =3D RPMPD_SMPA,                                =
 \
> +               .res_id =3D r_id,                                        =
 \
> +               .key =3D KEY_CORNER,                                     =
 \
> +       };                                                              \
> +       static struct rpmpd _platform##_##_active =3D {                  =
 \
> +               .pd =3D { .name =3D #_active, },                         =
   \
> +               .peer =3D &_platform##_##_name,                          =
 \
> +               .active_only =3D true,                                   =
 \
> +               .res_type =3D RPMPD_SMPA,                                =
 \
> +               .res_id =3D r_id,                                        =
 \
> +               .key =3D KEY_CORNER,                                     =
 \
> +       }
> +
> +#define DEFINE_RPMPD_CORN_LDOA(_platform, _name, r_id)                 \
> +       static struct rpmpd _platform##_##_name =3D {                    =
 \
> +               .pd =3D { .name =3D #_name, },                           =
   \
> +               .res_type =3D RPMPD_LDOA,                                =
 \
> +               .res_id =3D r_id,                                        =
 \
> +               .key =3D KEY_CORNER,                                     =
 \
> +       }
> +
> +#define DEFINE_RPMPD_VFC(_platform, _name, r_id, r_type)               \
> +       static struct rpmpd _platform##_##_name =3D {                    =
 \
> +               .pd =3D { .name =3D #_name, },                           =
   \
> +               .res_type =3D r_type,                                    =
 \
> +               .res_id =3D r_id,                                        =
 \
> +               .key =3D KEY_FLOOR_CORNER,                               =
 \
> +       }
> +
> +#define DEFINE_RPMPD_VFC_SMPA(_platform, _name, r_id)                  \
> +       DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_SMPA)
> +
> +#define DEFINE_RPMPD_VFC_LDOA(_platform, _name, r_id)                  \
> +       DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_LDOA)
> +
> +struct rpmpd_req {
> +       __le32 key;
> +       __le32 nbytes;
> +       __le32 value;
> +};
> +
> +struct rpmpd {
> +       struct generic_pm_domain pd;
> +       struct rpmpd *peer;
> +       const bool active_only;
> +       unsigned int corner;
> +       bool enabled;
> +       const char *res_name;
> +       const int res_type;
> +       const int res_id;
> +       struct qcom_smd_rpm *rpm;
> +       __le32 key;
> +};
> +
> +struct rpmpd_desc {
> +       struct rpmpd **rpmpds;
> +       size_t num_pds;
> +};
> +
> +static DEFINE_MUTEX(rpmpd_lock);
> +
> +/* msm8996 RPM Power domains */
> +DEFINE_RPMPD_CORN_SMPA(msm8996, vddcx, vddcx_ao, 1);
> +DEFINE_RPMPD_CORN_SMPA(msm8996, vddmx, vddmx_ao, 2);
> +DEFINE_RPMPD_CORN_LDOA(msm8996, vddsscx, 26);

Mmm.. CORN...

> +
> +DEFINE_RPMPD_VFC_SMPA(msm8996, vddcx_vfc, 1);
> +DEFINE_RPMPD_VFC_LDOA(msm8996, vddsscx_vfc, 26);
> +
> +static struct rpmpd *msm8996_rpmpds[] =3D {
> +       [MSM8996_VDDCX] =3D       &msm8996_vddcx,
> +       [MSM8996_VDDCX_AO] =3D    &msm8996_vddcx_ao,
> +       [MSM8996_VDDCX_VFC] =3D   &msm8996_vddcx_vfc,
> +       [MSM8996_VDDMX] =3D       &msm8996_vddmx,
> +       [MSM8996_VDDMX_AO] =3D    &msm8996_vddmx_ao,
> +       [MSM8996_VDDSSCX] =3D     &msm8996_vddsscx,
> +       [MSM8996_VDDSSCX_VFC] =3D &msm8996_vddsscx_vfc,
> +};
> +
[...]
> +       }
> +
> +       return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
> +}
> +
> +static struct platform_driver rpmpd_driver =3D {
> +       .driver =3D {
> +               .name =3D "qcom-rpmpd",
> +               .of_match_table =3D rpmpd_match_table,

suppress bind attributes here?

> +       },
> +       .probe =3D rpmpd_probe,

Because there isn't a remove function to tear down the genpds.

> +};
> +
> +static int __init rpmpd_init(void)
> +{
> +       return platform_driver_register(&rpmpd_driver);
> +}
> +core_initcall(rpmpd_init);
> +
> +static void __exit rpmpd_exit(void)
> +{
> +       platform_driver_unregister(&rpmpd_driver);
> +}
> +module_exit(rpmpd_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPM Power Domain Driver"=
);
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:qcom-rpmpd");

Is this MODULE_ALIAS required? I thought this wasn't useful because it's
auto-generated or something like that. Also, this is bool so these can
all go away unless it becomes tristate.
