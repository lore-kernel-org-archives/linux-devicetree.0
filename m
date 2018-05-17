From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/12] clk: imx7d: fix mipi dphy div parent
Date: Thu, 17 May 2018 11:05:10 -0700
Message-ID: <152658031035.210890.12212209931570500982@swboyd.mtv.corp.google.com>
References: <20180517125033.18050-1-rui.silva@linaro.org>
 <20180517125033.18050-4-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180517125033.18050-4-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rui Miguel Silva (2018-05-17 05:50:24)
> Fix the mipi dphy root divider to mipi_dphy_pre_div, this would remove a orphan
> clock and set the correct parent.
> 
> before:
> cat clk_orphan_summary
>                                  enable  prepare  protect
>    clock                          count    count    count        rate   accuracy   phase
> ----------------------------------------------------------------------------------------
>  mipi_dphy_post_div                   1        1        0           0          0 0
>     mipi_dphy_root_clk                1        1        0           0          0 0
> 
> cat clk_dump | grep mipi_dphy
> mipi_dphy_post_div                    1        1        0           0          0 0
>     mipi_dphy_root_clk                1        1        0           0          0 0
> 
> after:
> cat clk_dump | grep mipi_dphy
>    mipi_dphy_src                     1        1        0    24000000          0 0
>        mipi_dphy_cg                  1        1        0    24000000          0 0
>           mipi_dphy_pre_div          1        1        0    24000000          0 0
>              mipi_dphy_post_div      1        1        0    24000000          0 0
>                 mipi_dphy_root_clk   1        1        0    24000000          0 0
> 
> Fixes: 8f6d8094b215 ("ARM: imx: add imx7d clk tree support")
> 
> Cc: linux-clk@vger.kernel.org
> Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---

I only get two patches out of the 12 and I don't get a cover letter.
Did you want me to pick up these clk patches into clk-next? Where are
the other patches? Can you cc lkml on all your kernel emails so I can
easily find them?
