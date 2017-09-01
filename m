From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH 1/2] clk: hi6220: change watchdog clock source
Date: Fri, 1 Sep 2017 10:16:33 +0800
Message-ID: <20170901021633.GC516@leoy-ThinkPad-T440>
References: <1503993518-24428-1-git-send-email-leo.yan@linaro.org>
 <20170901013240.GM21656@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170901013240.GM21656@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Dmitry Shmidt <dimitrysh@google.com>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 06:32:40PM -0700, Stephen Boyd wrote:
> On 08/29, Leo Yan wrote:
> > The old code uses tcxo (19.2MHz) as watchdog clock but actually the
> > watchdog uses 32K clock, as result the watchdog timeout cannot be set
> > correctly and delay long time to reset SoC.
> > 
> > So this patch is to use 'ref32k' as clock source for watchdog.
> > 
> > Fixes: 72ea48610d43 ("clk: hi6220: Clock driver support for Hisilicon hi6220 SoC")
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> 
> Applied to clk-next

Thanks, Stephen.

> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
