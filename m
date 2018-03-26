From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] clk: imx6sx: add missing lvds2 clock to the clock
 tree
Date: Mon, 26 Mar 2018 17:23:20 -0500
Message-ID: <20180326222320.kcbudvanuyvo42fa@rob-hp-laptop>
References: <1521426645-19246-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521426645-19246-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mark.rutland@arm.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, shengjiu.wang@nxp.com, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 19, 2018 at 10:30:44AM +0800, Anson Huang wrote:
> i.MX6SX has lvds2 (analog clock2), an I/O clock like lvds1.
> And this lvds2, along with lvds1, can be used to provide
> external clock source to the internal pll, such as pll4_audio
> and pll5_video.
> 
> This patch mainly adds the lvds2 to the clock tree and fix its
> relationship with pll accordingly.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx6sx.c             | 8 ++++++--
>  include/dt-bindings/clock/imx6sx-clock.h | 6 +++++-
>  2 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
