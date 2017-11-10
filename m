From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: qoriq: add more divider clocks support
Date: Fri, 10 Nov 2017 15:45:35 -0600
Message-ID: <20171110214535.r3rp4g4ypj5spmue@rob-hp-laptop>
References: <20171108082615.46769-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171108082615.46769-1-andy.tang@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: andy.tang@nxp.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 08, 2017 at 04:26:15PM +0800, andy.tang@nxp.com wrote:
> From: Yuantian Tang <andy.tang@nxp.com>
> 
> More divider clocks are needed by IP. So enlarge the PLL divider
> array to accommodate more divider clocks.
> 
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> ---
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 1 +
>  drivers/clk/clk-qoriq.c                                 | 9 ++++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
