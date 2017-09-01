From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/2] Add support for Hi6220 coresight
Date: Thu, 31 Aug 2017 18:33:01 -0700
Message-ID: <20170901013301.GN21656@codeaurora.org>
References: <1504226835-2115-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504226835-2115-1-git-send-email-leo.yan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Li Pengcheng <lipengcheng8@huawei.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/01, Leo Yan wrote:
> This patch series adds support for coresight on Hi6220; the first patch
> is to fix coresight PLL so can avoid system hang after we enable
> coresight, the second patch is to add DT binding according to coresight
> topology.
> 
> The patch has been tested on Hikey; By using OpenCSD snapshot mode, it
> can successfully decode ETF and ETB trace data.
> 

I can take the first one and second one goes through arm-soc?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
