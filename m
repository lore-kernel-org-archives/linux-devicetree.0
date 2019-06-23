From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: imx8mm-evk: Enable audio codec wm8524
Date: Sun, 23 Jun 2019 15:36:06 +0800
Message-ID: <20190623073605.GA3800@dragon>
References: <20190604123257.2920-1-daniel.baluta@nxp.com>
 <20190604123257.2920-3-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604123257.2920-3-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.baluta@nxp.com
Cc: mark.rutland@arm.com, robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, m.felsch@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 08:32:57PM +0800, daniel.baluta@nxp.com wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> i.MX8MM has one wm8524 audio codec connected with
> SAI3 digital audio interface.
> 
> This patch uses simple-card machine driver in order
> to enable wm8524 codec.
> 
> We need to set:
> 	* SAI3 pinctrl configuration
> 	* codec reset gpio pinctrl configuration
> 	* clock hierarchy
> 	* codec node
> 	* simple-card configuration
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.
