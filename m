From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/3] clk: xgene: Add PMD clock
Date: Wed, 14 Sep 2016 13:55:41 -0700
Message-ID: <20160914205541.GB7243@codeaurora.org>
References: <1473704605-28126-1-git-send-email-hotran@apm.com>
 <1473704605-28126-3-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473704605-28126-3-git-send-email-hotran@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lho@apm.com, Duc Dang <dhdang@apm.com>
List-Id: devicetree@vger.kernel.org

On 09/12, Hoan Tran wrote:
> Add X-Gene PMD clock support.
> 
> PMD clock is implemented for a single register field.
>   Output rate = parent_rate * (denominator - scale) / denominator
> with
>   - denominator = bitmask of register field + 1
>   - scale = values of register field
> 
> For example, for bitmask is 0x7, denominator will be 8 and scale
> will be computed and programmed accordingly.
> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
