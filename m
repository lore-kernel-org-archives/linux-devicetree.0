From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 3/4] phy: Add QMP phy based UFS phy support for sdm845
Date: Thu, 28 Jun 2018 09:16:11 +0530
Message-ID: <996e8b41-9090-7961-45c0-fdf6fc83c30a@codeaurora.org>
References: <20180619083647.10116-1-cang@codeaurora.org>
 <20180619083647.10116-4-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619083647.10116-4-cang@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>, subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 6/19/2018 2:06 PM, Can Guo wrote:
> +static int qcom_qmp_phy_poweron(struct phy *phy)
> +{
> +	struct qmp_phy *qphy = phy_get_drvdata(phy);
> +	struct qcom_qmp *qmp = qphy->qmp;
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *pcs = qphy->pcs;
> +	void __iomem *status;
> +	unsigned int mask, val;
> +	int ret = 0;
> +
> +	if (cfg->type != PHY_TYPE_UFS)
> +		return 0;
> +
> +	/*
> +	 * For UFS PHY that has not software reset control, serdes start
> +	 * should only happen when UFS driver explicitly calls phy_power_on
> +	 * after it deasserts software reset.
> +	 */

Instead of relying on UFS glue driver to assert/de-assert PHY
which requires UFS PHY initialization to be split in init() and
poweron(), we can rather register reset_controller from ufs-qcom
driver.
PHY driver can then assert/de-assert as per UFS PHY requirement
in init() function itself and there won't be any need to have
poweron() routine for UFS as init can perform complete PHY
initialization without any dependency on ufs-qcom glue driver.

-Manu

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
