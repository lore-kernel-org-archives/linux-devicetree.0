From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 6/8] soc: qcom: Add AOSS QMP genpd provider
Date: Mon, 11 Feb 2019 14:15:42 -0800
Message-ID: <CAD=FV=VAa_8TyD5F5jiCxPVZEH8pPcxpR8hG+aw=AM2WFBVqmw@mail.gmail.com>
References: <20190206051335.23799-1-bjorn.andersson@linaro.org> <20190206051335.23799-7-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206051335.23799-7-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Feb 5, 2019 at 9:13 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> +static int qmp_pd_image_toggle(struct qmp_pd *res, bool enable)
> +{
> +       char buf[AOSS_QMP_PD_MSG_LEN];
> +
> +       memset(buf, 0, sizeof(buf));

Personally I find it safer/cleaner to do something like:

char buf[AOSS_QMP_PD_MSG_LEN] = { };

...but I won't insist.  If you change this, change in qmp_pd_clock_toggle() too.


> +static int qmp_pd_probe(struct platform_device *pdev)
> +{
> +       struct genpd_onecell_data *data;
> +       struct device *parent = pdev->dev.parent;
> +       struct qmp_pd *res;
> +       struct qmp *qmp;
> +       size_t num = ARRAY_SIZE(sdm845_resources);
> +       int ret;
> +       int i;
> +
> +       qmp = dev_get_drvdata(pdev->dev.parent);
> +       if (!qmp)
> +               return -EINVAL;
> +
> +       res = devm_kcalloc(&pdev->dev, num, sizeof(*res), GFP_KERNEL);
> +       if (!res)
> +               return -ENOMEM;
> +
> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->domains = devm_kcalloc(&pdev->dev, num, sizeof(*data->domains),
> +                                    GFP_KERNEL);
> +       if (!data->domains)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < num; i++) {
> +               res[i].qmp = qmp;
> +               res[i].pd.name = sdm845_resources[i].name;
> +               res[i].pd.power_on = sdm845_resources[i].on;
> +               res[i].pd.power_off = sdm845_resources[i].off;
> +
> +               ret = pm_genpd_init(&res[i].pd, NULL, true);
> +               if (ret < 0) {
> +                       dev_err(&pdev->dev, "failed to init genpd\n");

It's often nice to print the error number (ret) in the message.


> +                       goto unroll_genpds;
> +               }
> +
> +               data->domains[i] = &res[i].pd;
> +       }
> +
> +       data->num_domains = i;
> +
> +       platform_set_drvdata(pdev, data);
> +
> +       return of_genpd_add_provider_onecell(parent->of_node, data);

Now that you have error handling (the calls to "pm_genpd_remove"), you
can't just do this.  You need:

ret = of_genpd_add_provider_onecell(parent->of_node, data);
if (!ret)
  return 0;


> +unroll_genpds:
> +       for (i--; i >= 0; i--)
> +               pm_genpd_remove(data->domains[i]);
> +
> +       return ret;
> +}
> +
> +static int qmp_pd_remove(struct platform_device *pdev)
> +{
> +       struct device *parent = pdev->dev.parent;
> +       struct genpd_onecell_data *data = platform_get_drvdata(pdev);
> +       int i;
> +
> +       of_genpd_del_provider(parent->of_node);
> +
> +       for (i = 0; i < data->num_domains; i++)
> +               pm_genpd_remove(data->domains[i]);

I presume it doesn't matter, but if you truly want to be the inverse
of the "probe" then you'd want to iterate starting at "num_domains -
1" and go to 0.


-Doug
