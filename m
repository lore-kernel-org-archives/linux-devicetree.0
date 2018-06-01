From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v6 05/13] clk: imx7d: reset parent for mipi csi root
Date: Fri, 01 Jun 2018 12:41:39 -0700
Message-ID: <152788209979.225090.13218442162083992241@swboyd.mtv.corp.google.com>
References: <20180522145245.3143-1-rui.silva@linaro.org>
 <20180522145245.3143-6-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180522145245.3143-6-rui.silva@linaro.org>
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

Quoting Rui Miguel Silva (2018-05-22 07:52:37)
> To guarantee that we do not get Overflow in image FIFO the outer bandwidth has
> to be faster than inputer bandwidth. For that it must be possible to set a
> faster frequency clock. So set new parent to sys_pfd3 clock for the mipi csi
> block.
> 
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---

Applied to clk-next
