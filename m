From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] clk: qcom: Add CPU clock driver for msm8996
Date: Mon, 10 Apr 2017 11:23:38 -0500
Message-ID: <20170410162338.lfdkkyp36lcptqex@rob-hp-laptop>
References: <1491368129-24721-1-git-send-email-rnayak@codeaurora.org>
 <1491368129-24721-4-git-send-email-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491368129-24721-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 05, 2017 at 10:25:26AM +0530, Rajendra Nayak wrote:
> Each of the CPU clusters (Power and Perf) on msm8996 are
> clocked via 2 PLLs, a primary and alternate. There are also
> 2 Mux'es, a primary and secondary all connected together
> as shown below
> 
>                              +-------+
>               XO             |       |
>           +------------------>0      |
>                              |       |
>                    PLL/2     | SMUX  +----+
>                      +------->1      |    |
>                      |       |       |    |
>                      |       +-------+    |    +-------+
>                      |                    +---->0      |
>                      |                         |       |
> +---------------+    |             +----------->1      | CPU clk
> |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> |               +------+-----------+    +------>2 PMUX |
> +---------------+      |                |      |       |
>                        |   +------+     |   +-->3      |
>                        +--^+  ACD +-----+   |  +-------+
> +---------------+          +------+         |
> |Alt PLL        |                           |
> |               +---------------------------+
> +---------------+         PLL_EARLY
> 
> The primary PLL is what drives the CPU clk, except for times
> when we are reprogramming the PLL itself (for rate changes) when
> we temporarily switch to an alternate PLL. A subsequent patch adds
> support to switch between primary and alternate PLL during rate
> changes.
> 
> The primary PLL operates on a single VCO range, between 600Mhz
> and 3Ghz. However the CPUs do support OPPs with frequencies
> between 300Mhz and 600Mhz. In order to support running the CPUs
> at those frequencies we end up having to lock the PLL at twice
> the rate and drive the CPU clk via the PLL/2 output and SMUX.
> 
> So for frequencies above 600Mhz we follow the following path
>  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> and for frequencies between 300Mhz and 600Mhz we follow
>  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
> Support for this is added in a subsequent patch as well.
> 
> ACD stands for Adaptive Clock Distribution and is used to
> detect voltage droops. We do not add support for ACD as yet.
> This can be added at a later point as needed.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,kryocc.txt      |  17 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |   8 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-cpu-8996.c                    | 388 +++++++++++++++++++++
>  4 files changed, 414 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt
>  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
