From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v8 09/10] soc: qcom: rpmpd: Use simple_opp_to_performance_state()
 helper
Date: Fri, 21 Dec 2018 11:32:34 +0100
Message-ID: <CAPDyKFoZmJ22uswL4nkbhfqeeSpcz09mgQ6-tsrJRxE5EwTUsw@mail.gmail.com>
References: <20181221085622.25573-1-rnayak@codeaurora.org> <20181221085622.25573-10-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221085622.25573-10-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 21 Dec 2018 at 09:57, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Get rid of the duplicate code across rpmpd and rpmhpd to read the
> performance state value from Device tree and use the
> simple_opp_to_performance_state() helper instead.
>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/soc/qcom/rpmhpd.c | 11 +----------
>  drivers/soc/qcom/rpmpd.c  | 11 +----------
>  2 files changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index e37976e87370..f7fbe57f31ae 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -276,16 +276,7 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
>  static unsigned int rpmhpd_get_performance_state(struct generic_pm_domain *genpd,
>                                                  struct dev_pm_opp *opp)
>  {
> -       struct device_node *np;
> -       unsigned int level = 0;
> -
> -       np = dev_pm_opp_get_of_node(opp);
> -       if (of_property_read_u32(np, "qcom,level", &level))
> -               pr_err("%s: missing 'qcom,level' property\n", __func__);
> -
> -       of_node_put(np);
> -
> -       return level;
> +       return simple_opp_to_performance_state(genpd, opp, "qcom,level");
>  }
>
>  static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 59e21c88a144..29288af502b0 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -248,16 +248,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
>  static unsigned int rpmpd_get_performance(struct generic_pm_domain *genpd,
>                                           struct dev_pm_opp *opp)
>  {
> -       struct device_node *np;
> -       unsigned int corner = 0;
> -
> -       np = dev_pm_opp_get_of_node(opp);
> -       if (of_property_read_u32(np, "qcom,level", &corner))
> -               pr_err("%s: missing 'qcom,level' property\n", __func__);
> -
> -       of_node_put(np);
> -
> -       return corner;
> +       return simple_opp_to_performance_state(genpd, opp, "qcom,level");
>  }
>
>  static int rpmpd_probe(struct platform_device *pdev)
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
