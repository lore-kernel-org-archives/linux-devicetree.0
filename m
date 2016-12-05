From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: zx: support cpu-freq for zx296718
Date: Mon, 5 Dec 2016 10:48:04 +0800
Message-ID: <20161205024803.GA2667@dragon>
References: <1480657956-8140-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480657956-8140-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, jun.nie@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2016 at 01:52:36PM +0800, Baoyou Xie wrote:
> This patch adds the CPU clock phandle in CPU's node
> and uses operating-points-v2 to register operating points.
> 
> So it can be used by cpufreq-dt driver.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>

Applied, thanks.
