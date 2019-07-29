From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 4/4] thermal: qoriq: Add clock operations
Date: Mon, 29 Jul 2019 09:30:36 -0300
Message-ID: <CAOMZO5AgP0BrHyFKz78rsEz1XQMgSNzMmtTV6Q+GYtCGBiFMEQ@mail.gmail.com>
References: <20190729083915.4855-1-Anson.Huang@nxp.com> <20190729083915.4855-4-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729083915.4855-4-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <Anson.Huang@nxp.com>
Cc: "rui.zhang" <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Mon, Jul 29, 2019 at 6:04 AM <Anson.Huang@nxp.com> wrote:
>
> From: Anson Huang <Anson.Huang@nxp.com>
>
> Some platforms like i.MX8MQ has clock control for this module,
> need to add clock operations to make sure the driver is working
> properly.

I haven't seen this series earlier, and I have sent a similar patch
for Guido to test.

Since this patch solves a hang problem, I would suggest that this one
becomes the first of the series.

Also, the "clk: imx8mq: Remove CLK_IS_CRITICAL flag for
IMX8MQ_CLK_TMU_ROOT" should only be applied after this one in order to
avoid the hang.

>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> ---
> Changes since V1:
>         - use devm_clk_get_optional() instead of devm_clk_get().
> ---
>  drivers/thermal/qoriq_thermal.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_ther=
mal.c
> index 2b2f79b..0ae45c0 100644
> --- a/drivers/thermal/qoriq_thermal.c
> +++ b/drivers/thermal/qoriq_thermal.c
> @@ -2,6 +2,7 @@
>  //
>  // Copyright 2016 Freescale Semiconductor, Inc.
>
> +#include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/err.h>
> @@ -72,6 +73,7 @@ struct qoriq_sensor {
>
>  struct qoriq_tmu_data {
>         struct qoriq_tmu_regs __iomem *regs;
> +       struct clk *clk;
>         bool little_endian;
>         struct qoriq_sensor     *sensor[SITES_MAX];
>  };
> @@ -208,6 +210,16 @@ static int qoriq_tmu_probe(struct platform_device *p=
dev)
>                 return PTR_ERR(data->regs);
>         }
>
> +       data->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> +       if (IS_ERR(data->clk))
> +               return PTR_ERR(data->clk);
> +
> +       ret =3D clk_prepare_enable(data->clk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to enable clock\n");
> +               return ret;
> +       }
> +
>         qoriq_tmu_init_device(data);    /* TMU initialization */
>
>         ret =3D qoriq_tmu_calibration(pdev);      /* TMU calibration */

In case of failure the TMU clock should be disabled in the error path.

Thanks
