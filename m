From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v2 2/5] media: venus: add a routine to set venus state
Date: Tue, 5 Jun 2018 16:33:27 +0530
Message-ID: <20180605110327.GU16230@vkoul-mobl>
References: <1527884768-22392-1-git-send-email-vgarodia@codeaurora.org>
 <1527884768-22392-3-git-send-email-vgarodia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527884768-22392-3-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vikash Garodia <vgarodia@codeaurora.org>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, stanimir.varbanov@linaro.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org
List-Id: devicetree@vger.kernel.org

On 02-06-18, 01:56, Vikash Garodia wrote:

> +int venus_set_hw_state(enum tzbsp_video_state state, struct venus_core *core)
> +{
> +	int ret;

this should be init to 0 ...

> +	struct device *dev = core->dev;
> +	void __iomem *reg_base = core->base;
> +
> +	switch (state) {
> +	case TZBSP_VIDEO_SUSPEND:
> +		if (qcom_scm_is_available())
> +			ret = qcom_scm_set_remote_state(TZBSP_VIDEO_SUSPEND, 0);
> +		else
> +			writel_relaxed(1, reg_base + WRAPPER_A9SS_SW_RESET);
> +		break;
> +	case TZBSP_VIDEO_RESUME:
> +		if (qcom_scm_is_available())
> +			ret = qcom_scm_set_remote_state(TZBSP_VIDEO_RESUME, 0);
> +		else
> +			venus_reset_hw(core);
> +		break;
> +	default:

if it is default, ret contains garbage

> +		dev_err(dev, "invalid state\n");
> +		break;
> +	}
> +	return ret;

and that is returned.

Compiler should complain about these ...

> -enum tzbsp_video_state {
> -	TZBSP_VIDEO_STATE_SUSPEND = 0,
> -	TZBSP_VIDEO_STATE_RESUME
> -};

ah you are moving existing defines, please mention this in changelog.
Till this line I was expecting additions...
-- 
~Vinod
