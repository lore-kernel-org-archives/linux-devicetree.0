From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 06/10] soc: qcom: rpmhpd: Add RPMh power domain driver
Date: Tue, 11 Dec 2018 14:01:02 -0800
Message-ID: <154456566209.17204.2943300246902710989@swboyd.mtv.corp.google.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org> <20181211094938.25086-7-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-7-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-11 01:49:34)
> The RPMh power domain driver aggregates the corner votes from various
> consumers for the ARC resources and communicates it to RPMh.
>=20
> With RPMh we use 2 different numbering space for corners, one used
> by the clients to express their performance needs, and another used
> to communicate to RPMh hardware.
>=20
> The clients express their performance requirements using a sparse
> numbering space which are mapped to meaningful levels like RET, SVS,
> NOMINAL, TURBO etc which then get mapped to another number space
> between 0 and 15 which is communicated to RPMh. The sparse number space,
> also referred to as vlvl is mapped to the continuous number space of 0
> to 15, also referred to as hlvl, using command DB.
>=20
> Some power domain clients could request a performance state only while
> the CPU is active, while some others could request for a certain
> performance state all the time regardless of the state of the CPU.
> We handle this by internally aggregating the votes from both type of
> clients and then send the aggregated votes to RPMh.
>=20
> There are also 3 different types of Votes that are comunicated to RPMh

Why capitalize vote?

> for every resource.
> 1. ACTIVE_ONLY: This specifies the requirement for the resource when the
> CPU is active
> 2. SLEEP: This specifies the requirement for the resource when the CPU
> is going to sleep
> 3. WAKE_ONLY: This specifies the requirement for the resource when the
> CPU is coming out of sleep to active state

Can you tab these in?

>=20
> We add data for all power domains on sdm845 SoC as part of the patch.
> The driver can be extended to support other SoCs which support RPMh
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Just minor nitpicks ahead and a warning.

> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index f1b25fdcf2ad..dd6ca92985ee 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -22,3 +22,4 @@ obj-$(CONFIG_QCOM_APR) +=3D apr.o
>  obj-$(CONFIG_QCOM_LLCC) +=3D llcc-slice.o
>  obj-$(CONFIG_QCOM_SDM845_LLCC) +=3D llcc-sdm845.o
>  obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
> +obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o

Put this before RPMPD? At least it would be semi-sorted then.

> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> new file mode 100644
> index 000000000000..f993a86be48c
> --- /dev/null
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -0,0 +1,417 @@
[..]
> +
> +static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
> +{
> +       u8 buf[RPMH_ARC_MAX_LEVELS * RPMH_ARC_LEVEL_SIZE];
> +       int i, j, len, ret;
> +
> +       len =3D cmd_db_read_aux_data_len(rpmhpd->res_name);
> +       if (len <=3D 0)
> +               return len;
> +       else if (len > RPMH_ARC_MAX_LEVELS * RPMH_ARC_LEVEL_SIZE)
> +               return -EINVAL;
> +
> +       ret =3D cmd_db_read_aux_data(rpmhpd->res_name, buf, len);
> +       if (ret < 0)
> +               return ret;

I've changed cmd_db_read_aux_data() and that change is winding through
the arm-soc tree. This will break in the compilation phase in
linux-next.

> +
> +       rpmhpd->level_count =3D len / RPMH_ARC_LEVEL_SIZE;
> +
> +       for (i =3D 0; i < rpmhpd->level_count; i++) {
> +               rpmhpd->level[i] =3D 0;
> +               for (j =3D 0; j < RPMH_ARC_LEVEL_SIZE; j++)
> +                       rpmhpd->level[i] |=3D
> +                               buf[i * RPMH_ARC_LEVEL_SIZE + j] << (8 * =
j);
> +
> +               /*
> +                * The AUX data may be zero padded.  These 0 valued entri=
es at
> +                * the end of the map must be ignored.
> +                */
> +               if (i > 0 && rpmhpd->level[i] =3D=3D 0) {
> +                       rpmhpd->level_count =3D i;
> +                       break;
> +               }
> +               pr_debug("%s: ARC hlvl=3D%2d --> vlvl=3D%4u\n", rpmhpd->r=
es_name, i,
> +                        rpmhpd->level[i]);
> +       }
> +
> +       return 0;
> +}
> +
> +static int rpmhpd_probe(struct platform_device *pdev)
> +{
> +       int i, ret;
> +       size_t num_pds;
> +       struct device *dev =3D &pdev->dev;
> +       struct genpd_onecell_data *data;
> +       struct rpmhpd **rpmhpds;
> +       const struct rpmhpd_desc *desc;
> +
> +       desc =3D of_device_get_match_data(dev);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       rpmhpds =3D desc->rpmhpds;
> +       num_pds =3D desc->num_pds;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->domains =3D devm_kcalloc(dev, num_pds, sizeof(*data->domain=
s),
> +                                    GFP_KERNEL);
> +       if (!data->domains)
> +               return -ENOMEM;
> +
> +       data->num_domains =3D num_pds;
> +
> +       ret =3D cmd_db_ready();

Does this matter? I thought we forced cmd_db_ready() in the rpmh driver
probe, and that was the parent of all rpmh devices so we should be fine
to not need to check it again here?

> +       if (ret) {
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "Command DB unavailable, ret=3D%d\n"=
, ret);
> +               return ret;
> +       }
> +
