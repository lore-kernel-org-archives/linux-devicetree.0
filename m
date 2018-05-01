From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 03/15] clk: imx7d: fix mipi dphy div parent
Date: Tue, 01 May 2018 15:11:33 -0700
Message-ID: <152521269309.138124.2596659349470455371@swboyd.mtv.corp.google.com>
References: <20180423134750.30403-1-rui.silva@linaro.org>
 <20180423134750.30403-4-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180423134750.30403-4-rui.silva@linaro.org>
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

Quoting Rui Miguel Silva (2018-04-23 06:47:38)
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
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>

You have double signed-off-by here. Please resend.

Also, add a "Fixes:" tag so we know where to backport this to.
