From: Andy Gross <agross@codeaurora.org>
Subject: Re: [Patch v3 2/2] dmaengine: Add ADM driver
Date: Wed, 11 Feb 2015 22:47:48 -0600
Message-ID: <20150212044748.GB29515@qualcomm.com>
References: <1423634619-614-1-git-send-email-agross@codeaurora.org>
 <1423634619-614-3-git-send-email-agross@codeaurora.org>
 <20150212012814.GI11190@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150212012814.GI11190@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 11, 2015 at 05:28:14PM -0800, Stephen Boyd wrote:
> On 02/11, Andy Gross wrote:
> > +static struct platform_driver adm_dma_driver = {
> > +	.probe = adm_dma_probe,
> > +	.remove = adm_dma_remove,
> > +	.driver = {
> > +		.name = "adm-dma-engine",
> > +		.owner = THIS_MODULE,
> > +		.of_match_table = adm_of_match,
> > +	},
> > +};
> 
> The THIS_MODULE script will find you. Am I a script?

darn it.  I skimmed right over that.  I'll resend.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
