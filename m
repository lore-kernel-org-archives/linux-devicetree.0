From: saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v4 2/2] drivers: soc: Add LLCC driver
Date: Mon, 16 Apr 2018 22:50:10 +0530
Message-ID: <2ca31c0ffd699d0aea13d09a3b2be0a8@codeaurora.org>
References: <1523390893-10904-1-git-send-email-rishabhb@codeaurora.org>
 <1523390893-10904-3-git-send-email-rishabhb@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523390893-10904-3-git-send-email-rishabhb@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, tsoni@codeaurora.org, kyan@codeaurora.org, ckadabi@codeaurora.org, stanimir.varbanov@linaro.org, evgreen@chromium.org, linux-kernel@vger.kernel.org, linux-arm@lists.infradead.orgevgreen@chromium.org
List-Id: devicetree@vger.kernel.org

Hi Rishabh,

> +MODULE_DESCRIPTION("QTI sdm845 LLCC driver");

I think it should be QCOM or Qualcomm and not QTI

> +
> +	desc = devm_kzalloc(dev, sizeof(struct llcc_slice_desc), GFP_KERNEL);

Can use *desc instead

> +struct llcc_slice_desc *llcc_slice_getd(struct device *dev, const char 
> *name)
> +{
> +	struct device_node *np = dev->of_node;
> +	int index = 0;
> +	const char *slice_name;
> +	struct property *prop;
> +
> +	if (!np)
> +		return ERR_PTR(-ENOENT);

Is this check required?

> diff --git a/include/linux/soc/qcom/llcc-qcom.h
> b/include/linux/soc/qcom/llcc-qcom.h
> new file mode 100644
> index 0000000..3e97569
> --- /dev/null
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0

Should be within /* */ for headers as per kernel licensing rules.

Regards,
Sai Prakash
