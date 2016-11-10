From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] firmware: qcom: scm: add a video command for
 state setting
Date: Wed, 9 Nov 2016 17:52:51 -0800
Message-ID: <20161110015251.GC16026@codeaurora.org>
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-2-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478539853-23218-2-git-send-email-stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/07, Stanimir Varbanov wrote:
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index d95c70227c05..7e364691a87c 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -320,6 +320,22 @@ bool qcom_scm_is_available(void)
>  }
>  EXPORT_SYMBOL(qcom_scm_is_available);
>  
> +int qcom_scm_video_set_state(u32 state, u32 spare)
> +{
> +	int ret;
> +
> +	ret = qcom_scm_clk_enable();

Do we need clk control for this? Usually it's only required for
crypto engine things, and turning on video doesn't sound like it
uses crypto. I don't think downstream android kernel does this.

> +	if (ret)
> +		return ret;
> +
> +	ret = __qcom_scm_video_set_state(__scm->dev, state, spare);
> +
> +	qcom_scm_clk_disable();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(qcom_scm_video_set_state);
> +
>  static int qcom_scm_probe(struct platform_device *pdev)
>  {
>  	struct qcom_scm *scm;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
