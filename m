From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 3/6] pinctrl: freescale: imx: allow mux_reg offset zero
Date: Fri, 25 Sep 2015 17:39:10 -0700
Message-ID: <20150926003909.GD3529@tiger>
References: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
 <1443215162-13716-3-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443215162-13716-3-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, linus.walleij@linaro.org, lznuaa@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 04:05:59PM -0500, Adrian Alonso wrote:
> Allow mux_reg offset zero to be a valid pin_id, on imx7d
> mux_conf reg offset is zero for iomuxc-lspr controller
> 
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>

For #3 ~ #6,

Acked-by: Shawn Guo <shawnguo@kernel.org>
