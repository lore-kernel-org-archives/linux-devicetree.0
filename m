From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 1/6] ARM: dts: imx: imx7d add iomuxc lpsr device node
Date: Fri, 25 Sep 2015 17:28:49 -0700
Message-ID: <20150926002848.GA3529@tiger>
References: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, linus.walleij@linaro.org, lznuaa@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 04:05:57PM -0500, Adrian Alonso wrote:
> Add device tree node to support iomuxc-lpsr controller, fsl,iput-sel
> phandle allows to get input select register base address which is
> shared from main iomuxc controller.
> 
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>

For the series,

Acked-by: Shawn Guo <shawnguo@kernel.org>
