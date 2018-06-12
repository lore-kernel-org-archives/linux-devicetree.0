From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 6/7] soc: qcom: Add RPMh Power domain driver
Date: Tue, 12 Jun 2018 09:46:19 +0200
Message-ID: <CAPDyKFpLjN4F1yh0VEerzXTcpN2deNWWPG7qud_KLZgrcVcruw@mail.gmail.com>
References: <20180612044052.4402-1-rnayak@codeaurora.org> <20180612044052.4402-7-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612044052.4402-7-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, collinsd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12 June 2018 at 06:40, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> The RPMh Power domain driver aggregates the corner votes from various
> consumers for the ARC resources and communicates it to RPMh.
>
> We also add data for all power domains on sdm845 SoC as part of the patch.
> The driver can be extended to support other SoCs which support RPMh
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

> +
> +static int rpmhpd_remove(struct platform_device *pdev)
> +{
> +       of_genpd_del_provider(pdev->dev.of_node);

Similar comment as I had for patch2.

> +       return 0;
> +}
> +
> +static struct platform_driver rpmhpd_driver = {
> +       .driver = {
> +               .name = "qcom-rpmhpd",
> +               .of_match_table = rpmhpd_match_table,
> +       },
> +       .probe = rpmhpd_probe,
> +       .remove = rpmhpd_remove,
> +};

[...]

Kind regards
Uffe
