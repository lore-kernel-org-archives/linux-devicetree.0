From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver for i.MX
 6ULL
Date: Fri, 5 Jan 2018 10:42:19 -0600
Message-ID: <20180105164219.ug5w4xrsxl7lwwag@rob-hp-laptop>
References: <20180102164059.14641-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180102164059.14641-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linus.walleij@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bai Ping <ping.bai@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 02, 2018 at 05:40:59PM +0100, Stefan Agner wrote:
> From: Bai Ping <ping.bai@nxp.com>
> 
> On i.MX 6ULL, the BOOT_MODEx and TAMPERx pin MUX and CTRL registers
> are available in a separate IOMUXC_SNVS module. Add support for the
> IOMUXC_SNVS module to the i.MX 6UL pinctrl driver.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../bindings/pinctrl/fsl,imx6ul-pinctrl.txt        |  3 +-

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/freescale/pinctrl-imx6ul.c         | 52 +++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 3 deletions(-)
