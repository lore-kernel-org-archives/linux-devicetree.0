From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] mfd: Add specific compatible strings for Qualcomm's
 SPMI PMIC's
Date: Wed, 04 Mar 2015 11:01:36 -0800
Message-ID: <54F75690.3010406@codeaurora.org>
References: <1425464365-3291-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425464365-3291-1-git-send-email-iivanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/04/15 02:19, Ivan T. Ivanov wrote:
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index 4b8beb2..a1af4e5 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
>
> +
> +static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
> +{
> +	unsigned int rev2, minor, major, type, subtype;
> +	int ret;
> +
> +	ret = regmap_read(map, PMIC_TYPE, &type);
> +	if (ret < 0)
> +		return;
> +
> +	if (type != PMIC_TYPE_VALUE)
> +		return;
> +
> +	ret = regmap_read(map, PMIC_SUBTYPE, &subtype);
> +	if (ret < 0)
> +		return;
> +
> +	if (subtype > ARRAY_SIZE(pmic_spmi_id_table))
> +		return;
> +
> +	rev2 = regmap_read(map, PMIC_REV2, &rev2);

ret = ?

> +	if (rev2 < 0)

if (ret < 0) ?

> +		return;
> +
> +	minor = regmap_read(map, PMIC_REV3, &minor);
> +	if (minor < 0)
> +		return;

same comment

> +
> +	major = regmap_read(map, PMIC_REV4, &major);
> +	if (major < 0)
> +		return;

same comment

> +
> +	/*
> +	 * In early versions of PM8941 and PM8226, the major revision number
> +	 * started incrementing from 0 (eg 0 = v1.0, 1 = v2.0).
> +	 * Increment the major revision number here if the chip is an early
> +	 * version of PM8941 or PM8226.
> +	 */
> +	if ((subtype == PM8941_SUBTYPE || subtype == PM8226_SUBTYPE) &&
> +	    major < 0x02)
> +		major++;
> +
> +	if (subtype == PM8110_SUBTYPE)
> +		minor = rev2;
> +
> +	dev_info(dev, "%s-v%d.%d detected\n",
> +		 pmic_spmi_id_table[subtype].compatible, major, minor);
> +}
>

I wonder if this should be dev_dbg.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
