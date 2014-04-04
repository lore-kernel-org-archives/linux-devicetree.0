From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: Various fixes for MSM8960's global clock controller
Date: Fri, 04 Apr 2014 11:18:59 -0700
Message-ID: <533EF793.3050104@codeaurora.org>
References: <1396629176-7413-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396629176-7413-1-git-send-email-galak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/04/14 09:32, Kumar Gala wrote:
> * Remove CE2_SLEEP_CLK, doesn't exist on 8960 family SoCs
> * Fix incorrect offset for PMIC_SSBI2_RESET
> * Fix typo:
> 	SIC_TIC -> SPS_TIC_H
> 	SFAB_ADM0_M2_A_CLK -> SFAB_ADM0_M2_H_CLK
> * Fix naming convention:
> 	SFAB_CFPB_S_HCLK -> SFAB_CFPB_S_H_CLK
> 	SATA_SRC_CLK -> SATA_CLK_SRC
>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>

Thanks

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
