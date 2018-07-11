From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 2/2] ARM: dts: imx6sx: add ocram_s support
Date: Wed, 11 Jul 2018 21:14:32 +0800
Message-ID: <20180711131431.GJ6959@dragon>
References: <1531270739-3075-1-git-send-email-Anson.Huang@nxp.com>
 <1531270739-3075-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531270739-3075-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, shengjiu.wang@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 11, 2018 at 08:58:59AM +0800, Anson Huang wrote:
> i.MX6SX has a 16KB always-on ocram bank called
> ocram_s, enable it as another mmio sram.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Since the clock ID has already been defined before, this dts patch can
be applied independently to clock driver one.

Applied, thanks.
