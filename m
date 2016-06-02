From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH 1/5] clk: qcom: ipq4019: Modified the fixed clock rate to
 proper values
Date: Fri, 3 Jun 2016 00:45:32 +0530
Message-ID: <20160602191532.GA23619@chewinlnx07.qualcomm.com>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
 <1464618758-20965-2-git-send-email-absahu@codeaurora.org>
 <20160601221808.GI28218@codeaurora.org>
 <9a9ac449-4c14-e0fa-5637-5ca7aac321aa@codeaurora.org>
 <20160602183540.GK28218@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160602183540.GK28218@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "Banavathi, Pradeep" <pradeepb@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, galak@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 02, 2016 at 11:35:40AM -0700, Stephen Boyd wrote:
> On 06/02, Banavathi, Pradeep wrote:
> > The PLLs on IPQ4019 cannot be reconfigured by design. The
> > recommendation is to program these PLLS only once. Since, the
> > Bootloaders configure the PLLs and clocks already. we did not
> > support the recalc rate and marked them as fixed clocks.
> > 
> 
> (Please don't top post)
> 
> That doesn't matter. We recalculate PLL rates on all other qcom
> SoCs by reading the hardware even though an overwhelming majority
> of them are fixed by the bootloader.
>
We will check for this. Already we added the APSS CPU PLL divider
in clock framework in next 3 patches of this patchset. Could you
please review the same so that we can follow the similar thing for
other PLL and dividers.
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
