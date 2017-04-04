From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 7/9] clk: hi6220: add debug APB clock
Date: Tue, 4 Apr 2017 14:51:09 -0700
Message-ID: <20170404215109.GH18246@codeaurora.org>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-8-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490466197-29163-8-git-send-email-leo.yan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, mike.leach@linaro.org, Suzuki.Poulose@arm.com, sudeep.holla@arm.com
List-Id: devicetree@vger.kernel.org

On 03/26, Leo Yan wrote:
> The debug APB clock is absent in hi6220 driver, so this patch is to add
> support for it.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---

Applied to clk-next. I suspect we don't need a topic branch for
the DT header because arm-soc won't be taking the dts side of the
changes?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
