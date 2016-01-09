From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH] arm64: dts: Add L2 cache node to msm8916
Date: Fri, 8 Jan 2016 22:41:30 -0600
Message-ID: <20160109044130.GA20052@hector.attlocal.net>
References: <1452297429-6382-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452297429-6382-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 03:57:09PM -0800, Stephen Boyd wrote:
> The msm8916 SoC has an L2 cache for all 4 CPUs. Add it to the
> dtsi file so that the cache hierarchy can be probed.
> 
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Reviewed-by: Andy Gross <andy.gross@linaro.org>
