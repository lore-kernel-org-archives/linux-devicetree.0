From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [Patch v3 2/2] dmaengine: Add ADM driver
Date: Wed, 11 Feb 2015 17:28:14 -0800
Message-ID: <20150212012814.GI11190@codeaurora.org>
References: <1423634619-614-1-git-send-email-agross@codeaurora.org>
 <1423634619-614-3-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423634619-614-3-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 02/11, Andy Gross wrote:
> +static struct platform_driver adm_dma_driver = {
> +	.probe = adm_dma_probe,
> +	.remove = adm_dma_remove,
> +	.driver = {
> +		.name = "adm-dma-engine",
> +		.owner = THIS_MODULE,
> +		.of_match_table = adm_of_match,
> +	},
> +};

The THIS_MODULE script will find you. Am I a script?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
