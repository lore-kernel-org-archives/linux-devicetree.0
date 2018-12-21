From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v8 08/10] PM / Domains: Add a simple_opp_to_performance_state()
 helper
Date: Fri, 21 Dec 2018 11:31:28 +0100
Message-ID: <CAPDyKFpsqGJ4mMYEMto4nHcYeNr0z-dEea9LFfCuSeTfok8SDQ@mail.gmail.com>
References: <20181221085622.25573-1-rnayak@codeaurora.org> <20181221085622.25573-9-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221085622.25573-9-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 21 Dec 2018 at 09:57, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Now that we have atleast 2 genpd providers, both using a simple
> routine to read a performance state value from device tree and
> return it, in order to implement the .opp_to_performance_state
> callback, add a simple_opp_to_performance_state() helper to do
> it, so it can be resued across all such genpd providers which
> just need to read the value from DT.
>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/base/power/domain.c | 17 +++++++++++++++++
>  include/linux/pm_domain.h   |  9 +++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 8e554e6a82a2..193872afbe20 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2520,6 +2520,23 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>
> +unsigned int simple_opp_to_performance_state(struct generic_pm_domain *genpd,
> +                                            struct dev_pm_opp *opp,
> +                                            const char *name)
> +{

Looks like this function should be moved into the OPP library instead.
There is no use of the genpd.

> +       struct device_node *np;
> +       unsigned int perf_state = 0;
> +
> +       np = dev_pm_opp_get_of_node(opp);
> +       if (of_property_read_u32(np, name, &perf_state))
> +               pr_err("%s: missing %s property\n", __func__, name);
> +
> +       of_node_put(np);
> +
> +       return perf_state;
> +}
> +EXPORT_SYMBOL_GPL(simple_opp_to_performance_state);
> +

Kind regards
Uffe
