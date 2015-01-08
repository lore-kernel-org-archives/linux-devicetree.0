From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] soc: qcom: Add TCSR driver
Date: Thu, 08 Jan 2015 15:39:44 -0800
Message-ID: <54AF1540.6090800@codeaurora.org>
References: <1420757577-20425-1-git-send-email-agross@codeaurora.org> <1420757577-20425-2-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420757577-20425-2-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/08/2015 02:52 PM, Andy Gross wrote:
> +
> +static struct platform_driver qcom_tcsr_driver = {
> +	.driver = {
> +		.name		= "tcsr",
> +		.owner		= THIS_MODULE,

This is done by the module_platform_driver() macro now so it's largely
unnecessary. Best to remove it so that the janitors don't find you!

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
