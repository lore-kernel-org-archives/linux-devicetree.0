From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/4] clk: Hi6220: add stub clock driver
Date: Wed, 12 Aug 2015 01:33:36 -0700
Message-ID: <20150812083336.GC13623@codeaurora.org>
References: <1438673249-6051-1-git-send-email-leo.yan@linaro.org>
 <1438673249-6051-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438673249-6051-4-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Wei Xu <xuwei5@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, sunzhaosheng@hisilicon.com, victor.lixin@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 08/04, Leo Yan wrote:
> On Hi6220, there have some clocks which can use mailbox channel to send
> messages to power controller to change frequency; this includes CPU, GPU
> and DDR clocks.
> 
> For dynamic frequency scaling, firstly need write the frequency value to
> SRAM region, and then send message to mailbox to trigger power controller
> to handle this requirement. This driver will use syscon APIs to pass SRAM
> memory region and use common mailbox APIs for channels accessing.
> 
> This init driver will support cpu frequency change firstly.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
