From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V3 2/2] ARM: dts: imx6sx-sabreauto: add external 24MHz
 clock source
Date: Wed, 2 May 2018 21:19:36 +0800
Message-ID: <20180502131934.GK3443@dragon>
References: <1524209891-14146-1-git-send-email-Anson.Huang@nxp.com>
 <1524209891-14146-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524209891-14146-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, shengjiu.wang@nxp.com, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 20, 2018 at 03:38:11PM +0800, Anson Huang wrote:
> On i.MX6SX SabreAuto board, there is external 24MHz clock
> source for analog clock2, add this clock source to clock tree
> and remove "clocks" container for all input clocks.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
