From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 2/7] soc: qcom: rpmpd: Add a Power domain driver to
 model corners
Date: Tue, 12 Jun 2018 09:39:08 +0200
Message-ID: <CAPDyKFpJPUiBfzkM__niwnbHd_BDYYXpvEJCwfDxKp-L0nLOvQ@mail.gmail.com>
References: <20180612044052.4402-1-rnayak@codeaurora.org> <20180612044052.4402-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612044052.4402-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, collinsd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

[...]

> +static int rpmpd_probe(struct platform_device *pdev)
> +{
> +       int i;
> +       size_t num;
> +       struct genpd_onecell_data *data;
> +       struct qcom_smd_rpm *rpm;
> +       struct rpmpd **rpmpds;
> +       const struct rpmpd_desc *desc;
> +
> +       rpm = dev_get_drvdata(pdev->dev.parent);
> +       if (!rpm) {
> +               dev_err(&pdev->dev, "Unable to retrieve handle to RPM\n");
> +               return -ENODEV;
> +       }
> +
> +       desc = of_device_get_match_data(&pdev->dev);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       rpmpds = desc->rpmpds;
> +       num = desc->num_pds;
> +
> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->domains = devm_kcalloc(&pdev->dev, num, sizeof(*data->domains),
> +                                    GFP_KERNEL);
> +       data->num_domains = num;
> +
> +       for (i = 0; i < num; i++) {
> +               if (!rpmpds[i]) {
> +                       dev_warn(&pdev->dev, "rpmpds[] with empty entry at index=%d\n",
> +                                i);
> +                       continue;
> +               }
> +
> +               rpmpds[i]->rpm = rpm;
> +               rpmpds[i]->pd.power_off = rpmpd_power_off;
> +               rpmpds[i]->pd.power_on = rpmpd_power_on;
> +               pm_genpd_init(&rpmpds[i]->pd, NULL, true);
> +
> +               data->domains[i] = &rpmpds[i]->pd;
> +       }
> +
> +       return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
> +}
> +
> +static int rpmpd_remove(struct platform_device *pdev)
> +{
> +       of_genpd_del_provider(pdev->dev.of_node);

In principle what you need, additionally to the above, is something like this:

while (!IS_ERR(of_genpd_remove_last(pdev->dev.of_node));

Then in the ->probe() function, use dev_set_drvdata() to store the
pointers for the allocated data, such you can use dev_get_drvdata() to
get them back here to kfree() them.

However, running the ->remove() path for this driver doesn't really
make sense. As we can't remove a genpd that has devices attached to it
anyways.

Perhaps make this a built in driver, if possible?

[...]

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
