From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2 v2] clk: qoriq: Separate root input clock for core
 PLLs on ls1012a
Date: Thu, 1 Jun 2017 01:28:04 -0700
Message-ID: <20170601082804.GE20170@codeaurora.org>
References: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
 <1489977443-33582-2-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489977443-33582-2-git-send-email-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuantian Tang <andy.tang@nxp.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Scott Wood <oss@buserror.net>
List-Id: devicetree@vger.kernel.org

On 03/20, Yuantian Tang wrote:
> From: Scott Wood <oss@buserror.net>
> 
> ls1012a has separate input root clocks for core PLLs versus the
> platform PLL, with the latter described as sysclk in the hw docs.
> If a second input clock, named "coreclk", is present, this clock will be
> used for the core PLLs.
> 
> Signed-off-by: Scott Wood <oss@buserror.net>
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
