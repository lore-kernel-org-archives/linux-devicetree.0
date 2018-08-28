From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 4/5] drivers: pinctrl: qcom: sdm845: support GPIO
 wakeup from suspend
Date: Mon, 27 Aug 2018 17:31:31 -0700
Message-ID: <20180828003131.GD2523@minitux>
References: <20180824200157.9993-1-ilina@codeaurora.org>
 <20180824200157.9993-5-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180824200157.9993-5-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: marc.zyngier@arm.com, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri 24 Aug 13:01 PDT 2018, Lina Iyer wrote:

> Enable TLMM IRQs to be sensed by PDC when we enter suspend. It is
> possible that the TLMM may be powered off and not detect GPIOs that are
> configured as wake up interrupts. By hooking into suspend callbacks, we
> allow PDC IRQs to take over and wake up the system if wakeup interrupts
> are triggered.
> 
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sdm845.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> index 2ab7a8885757..cc333b8afb99 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> @@ -1297,10 +1297,16 @@ static const struct of_device_id sdm845_pinctrl_of_match[] = {
>  	{ },
>  };
>  
> +static const struct dev_pm_ops msm_pinctrl_dev_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pinctrl_suspend_late,
> +				     msm_pinctrl_resume_late)
> +};
> +

I expect these four lines to be duplicated in every platform file, so I
think it would be better to just move it to pinctrl-msm.c and extern
declare it in pinctrl-msm.h.

>  static struct platform_driver sdm845_pinctrl_driver = {
>  	.driver = {
>  		.name = "sdm845-pinctrl",
>  		.of_match_table = sdm845_pinctrl_of_match,
> +		.pm = &msm_pinctrl_dev_pm_ops,
>  	},
>  	.probe = sdm845_pinctrl_probe,
>  	.remove = msm_pinctrl_remove,

Regards,
Bjorn
