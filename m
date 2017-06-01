From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
Date: Thu, 1 Jun 2017 01:27:17 -0700
Message-ID: <20170601082717.GC20170@codeaurora.org>
References: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yuantian Tang <andy.tang@nxp.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Scott Wood <oss@buserror.net>
List-Id: devicetree@vger.kernel.org

On 03/20, Yuantian Tang wrote:
> From: Scott Wood <oss@buserror.net>
> 
> ls1012a has separate input root clocks for core PLLs versus the platform
> PLL, with the latter described as sysclk in the hw docs.
> Update the qoriq-clock binding to allow a second input clock, named
> "coreclk".  If present, this clock will be used for the core PLLs.
> 
> Signed-off-by: Scott Wood <oss@buserror.net>
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
