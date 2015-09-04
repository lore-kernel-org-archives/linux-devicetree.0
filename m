From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] spmi-pmic-arb: support configurable number of peripherals
Date: Thu, 3 Sep 2015 17:16:30 -0700
Message-ID: <20150904001630.GJ15099@codeaurora.org>
References: <1441322451-30149-1-git-send-email-gavidov@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441322451-30149-1-git-send-email-gavidov@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Gilad Avidov <gavidov@codeaurora.org>
Cc: sdharia@codeaurora.org, mlocke@codeaurora.org, linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, svarbanov@mm-sol.com, wsa@the-dreams.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iivanov@mm-sol.com, agross@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 09/03, Gilad Avidov wrote:
> +			 supported by HW. Default (minimum supported) is 128.
> +
> +Example V1 PMIC-Arbiter:
>  
>  	spmi {
>  		compatible = "qcom,spmi-pmic-arb";
> @@ -62,4 +66,32 @@ Example:
>  
>  		interrupt-controller;
>  		#interrupt-cells = <4>;
> +
> +		qcom,max-peripherals = <256>;

If it's v1 isn't it always 128? So having 256 here is just
confusing.

> +	};
> +
> @@ -129,14 +131,15 @@ struct spmi_pmic_arb_dev {
>  	u8			channel;
>  	int			irq;
>  	u8			ee;
> -	u8			min_apid;
> -	u8			max_apid;
> -	u32			mapping_table[SPMI_MAPPING_TABLE_LEN];
> +	u16			min_irq_apid;
> +	u16			max_irq_apid;
> +	u16			max_apid;
> +	u32			*mapping_table;
>  	struct irq_domain	*domain;
>  	struct spmi_controller	*spmic;
> -	u16			apid_to_ppid[256];
> +	u16			*irq_apid_to_ppid;

Please drop all this renaming noise, or at the least, put it in a
different patch. More than half the patch is just changing the
names of these variables for what seems like no reason.

>  	const struct pmic_arb_ver_ops *ver_ops;
> -	u8			*ppid_to_chan;
> +	u16			*ppid_to_chan;
>  };
>  
>  	struct spmi_pmic_arb_dev *pa = irq_get_handler_data(irq);
>  	struct irq_chip *chip = irq_get_chip(irq);
>  	void __iomem *intr = pa->intr;
> -	int first = pa->min_apid >> 5;
> -	int last = pa->max_apid >> 5;
> +	int first = pa->min_irq_apid >> 5;
> +	int last = pa->max_irq_apid >> 5;
>  	u32 status;
>  	int i, id;
>  
> @@ -903,14 +915,30 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>  
>  	pa->ee = ee;
>  
> -	for (i = 0; i < ARRAY_SIZE(pa->mapping_table); ++i)
> -		pa->mapping_table[i] = readl_relaxed(
> -				pa->cnfg + SPMI_MAPPING_TABLE_REG(i));
> +	pa->irq_apid_to_ppid = devm_kzalloc(&ctrl->dev, pa->max_apid *
> +					    sizeof(*pa->irq_apid_to_ppid),
> +					    GFP_KERNEL);
> +	if (!pa->irq_apid_to_ppid) {
> +		err = -ENOMEM;
> +		goto err_put_ctrl;
> +	}
> +
> +	pa->mapping_table = devm_kzalloc(&ctrl->dev,
> +					(pa->max_apid - 1) * sizeof(u32),
> +					GFP_KERNEL);
> +	if (!pa->mapping_table) {
> +		err = -ENOMEM;
> +		goto err_put_ctrl;
> +	}
> +
> +	for (i = 0; i < (pa->max_apid - 1); ++i)
> +		pa->mapping_table[i] = readl_relaxed(pa->cnfg +
> +						  SPMI_MAPPING_TABLE_REG(i));

Maybe we should stop doing this during probe and always allocate
an empty cache of size 128 on v1 and 512 on v2 chips? So when
we're searching through the mapping table we can cache the value
from the register if the entry isn't 0. This delays the
processing to when we're mapping irqs, hopefully speeding up
probe for the case where you have a handful of irqs to map.

The DT property wouldn't be necessary then. Arguably it's being
added there to optimize the size of the mapping table and isn't
really necessary otherwise.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
