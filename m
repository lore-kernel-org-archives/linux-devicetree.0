From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] clk: qoriq: add more divider clocks support
Date: Tue, 21 Nov 2017 12:30:38 -0600
Message-ID: <20171121183038.4jntjiqlfnewmmwt@rob-hp-laptop>
References: <20171121061300.23464-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171121061300.23464-1-andy.tang@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: andy.tang@nxp.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 02:13:00PM +0800, andy.tang@nxp.com wrote:
> From: Yuantian Tang <andy.tang@nxp.com>
> 
> More divider clocks are needed by IP. So enlarge the PLL divider
> array to accommodate more divider clocks.
> 
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> ---
> v2:
>   - fix a logical error
> 
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 1 +

Please add acks when posting new versions.

>  drivers/clk/clk-qoriq.c                                 | 9 ++++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
