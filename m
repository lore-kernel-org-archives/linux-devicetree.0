From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 4/8] soc: qcom: rpmpd: Add support for get/set performance
 state
Date: Tue, 04 Dec 2018 15:14:29 -0800
Message-ID: <154396526967.88331.13652897075952274639@swboyd.mtv.corp.google.com>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-5-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204052119.806-5-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-03 21:21:15)
> @@ -221,6 +224,47 @@ static int rpmpd_power_off(struct generic_pm_domain =
*domain)
>         return ret;
>  }
>  =

> +static int rpmpd_set_performance(struct generic_pm_domain *domain,
> +                                unsigned int state)
> +{
> +       int ret =3D 0;
> +       struct rpmpd *pd =3D domain_to_rpmpd(domain);
> +
> +       mutex_lock(&rpmpd_lock);
> +
> +       if (state > MAX_RPMPD_STATE)
> +               goto out;

Does this need to be under the mutex lock? Doesn't look like it.

> +
> +       pd->corner =3D state;
> +
> +       if (!pd->enabled && (pd->key !=3D KEY_FLOOR_CORNER))

Please drop useless parenthesis.

> +               goto out;
> +
> +       ret =3D rpmpd_aggregate_corner(pd);
> +
> +out:
> +       mutex_unlock(&rpmpd_lock);
> +
> +       return ret;
> +}
> +
> +static unsigned int rpmpd_get_performance(struct generic_pm_domain *genp=
d,
> +                                         struct dev_pm_opp *opp)
> +{
> +       struct device_node *np;
> +       unsigned int corner =3D 0;
> +
> +       np =3D dev_pm_opp_get_of_node(opp);
> +       if (of_property_read_u32(np, "qcom,level", &corner)) {
> +               pr_err("%s: missing 'qcom,level' property\n", __func__);

We leak np reference here, assuming dev_pm_opp_get_of_node() returns an
of_node_get() pointer to the caller.

> +               return 0;
> +       }
> +
> +       of_node_put(np);

This same code exists twice. Perhaps a helper needs to exist for
qcom_rpm_get_performance() to pull the number out of the DT.

> +
> +       return corner;
> +}
