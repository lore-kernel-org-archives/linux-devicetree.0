From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/7] PM / OPP: Add dev_pm_opp_get_of_node()
Date: Sat, 07 Apr 2018 06:00:29 -0700
Message-ID: <152310602935.180276.13934458024242240384@swboyd.mtv.corp.google.com>
References: <20180316040824.21472-1-rnayak@codeaurora.org>
 <20180316040824.21472-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316040824.21472-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-03-15 21:08:18)
> From: Viresh Kumar <viresh.kumar@linaro.org>
> =

> This adds a new helper to let the power domain drivers to access
> opp->np, so that they can read platform specific properties from the
> node.
> =

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Are there two versions of this patch floating around?

>  drivers/opp/of.c       | 19 +++++++++++++++++++
>  include/linux/pm_opp.h |  5 +++++
>  2 files changed, 24 insertions(+)
> =

> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 21265af55117..b17715bc3c0a 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -736,3 +736,22 @@ struct dev_pm_opp *of_dev_pm_opp_find_required_opp(s=
truct device *dev,
>         return opp;
>  }
>  EXPORT_SYMBOL_GPL(of_dev_pm_opp_find_required_opp);
> +
> +/**
> + * dev_pm_opp_get_of_node() - Gets the DT node corresponding to an opp
> + * @opp:       opp for which DT node has to be returned for
> + *
> + * Return: DT node corresponding to the opp, else 0 on success.
> + *
> + * The caller needs to put the node of_node_put() after using it.

put the node with of_node_put()
