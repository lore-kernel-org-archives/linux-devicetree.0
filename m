From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: add support to configure ipq40xx
 GPIO_PULL bits
Date: Wed, 5 Jul 2017 22:15:09 -0700
Message-ID: <20170706051509.GO18666@tuxbook>
References: <73f822f3f969fa2c9ed25097ab8c70826b265491.1498925339.git.chunkeey@googlemail.com>
 <a30335a8948ddcb0bc2d3db5bb13d9599af86cca.1498925339.git.chunkeey@googlemail.com>
 <e8b73406f36f47a408196f4bf8f6126ecc9e68aa.1498925339.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e8b73406f36f47a408196f4bf8f6126ecc9e68aa.1498925339.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Ram Chandra Jangir <rjangir@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Sat 01 Jul 09:25 PDT 2017, Christian Lamparter wrote:

[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 54fdd04ce9d5..71e97db5ba18 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -115,6 +115,7 @@ struct msm_pinctrl_soc_data {
>  	const struct msm_pingroup *groups;
>  	unsigned ngroups;
>  	unsigned ngpios;
> +	bool pull_no_keeper;

This should be accompanied by a kerneldoc update in the lines of:
@pull_no_keeper:	The SoC does not support keeper bias

With something like that added:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
