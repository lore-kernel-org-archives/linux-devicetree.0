From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v6 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Tue, 11 Dec 2018 11:22:39 +0100
Message-ID: <CAPDyKFof-rkzmzibWOrAhDFysU=y+C8Bp0cK=_iht4=vmv-0vw@mail.gmail.com>
References: <20181211094938.25086-1-rnayak@codeaurora.org> <20181211094938.25086-11-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-11-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Dec 2018 at 10:50, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Specify the active + sleep and active-only MX power domains as
> the parents of the corresponding CX power domains. This will ensure that
> performance state requests on CX automatically generate equivalent requests
> on MX power domains.
>
> This is used to enforce a requirement that exists for various
> hardware blocks on SDM845 that MX performance state >= CX performance
> state for a given operating frequency.

I assume that also means the MX power domain must not be power off as
long as the CX power domain is powered on?

Just to make sure there are no conflicting hierarchical constraints
between idle management and performance state management!?

Kind regards
Uffe

>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> This patch is dependent on the series from
> Viresh [1] which adds support to propogate performance states across the
> power domain hierarchy which is still being reviewed.
>
> [1] https://lkml.org/lkml/2018/11/26/333
>
>  drivers/soc/qcom/rpmhpd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 1ce86f0cc9fa..af7b07d49e4f 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -102,12 +102,14 @@ static struct rpmhpd sdm845_cx_ao;
>  static struct rpmhpd sdm845_cx = {
>         .pd = { .name = "cx", },
>         .peer = &sdm845_cx_ao,
> +       .parent = &sdm845_mx.pd,
>         .res_name = "cx.lvl",
>  };
>
>  static struct rpmhpd sdm845_cx_ao = {
>         .pd = { .name = "cx_ao", },
>         .peer = &sdm845_cx,
> +       .parent = &sdm845_mx_ao.pd,
>         .res_name = "cx.lvl",
>  };
>
> @@ -389,6 +391,15 @@ static int rpmhpd_probe(struct platform_device *pdev)
>                 data->domains[i] = &rpmhpds[i]->pd;
>         }
>
> +       /* Add subdomains */
> +       for (i = 0; i < num_pds; i++) {
> +               if (!rpmhpds[i])
> +                       continue;
> +               if (rpmhpds[i]->parent)
> +                       pm_genpd_add_subdomain(rpmhpds[i]->parent,
> +                                              &rpmhpds[i]->pd);
> +       }
> +
>         return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
>  }
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
