From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RESEND PATCH 1/2 v6] clk/axs10x: Add I2S PLL clock driver
Date: Fri, 6 May 2016 10:35:31 -0700
Message-ID: <20160506173531.GU3492@codeaurora.org>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: linux-clk@vger.kernel.org, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/02, Jose Abreu wrote:
> The ARC SDP I2S clock can be programmed using a
> specific PLL.
> 
> This patch has the goal of adding a clock driver
> that programs this PLL.
> 
> At this moment the rate values are hardcoded in
> a table but in the future it would be ideal to
> use a function which determines the PLL values
> given the desired rate.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> ---

Applied to clk-next

I'm not applying the arc dts file (patch #2 in this series).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
