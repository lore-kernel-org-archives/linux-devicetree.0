From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] ARM: dts: imx6q-logicpd: Shutdown LCD regulator
 during suspend
Date: Thu, 11 Apr 2019 13:47:25 +0800
Message-ID: <20190411054724.GU26817@dragon>
References: <20190402192547.4538-1-aford173@gmail.com>
 <20190402192547.4538-2-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402192547.4538-2-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, adam.ford@logicpd.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 02:25:46PM -0500, Adam Ford wrote:
> The LCD power sequencer is very finicky.  The backlight cannot
> be driven until after the sequencer is done.  Until now, the
> regulators were marked with 'regulator-always-on' to make sure
> it came up before the backlight.  This patch allows the LCD
> regulators to power down and prevent the backlight from being
> used again until the sequencer is ready.  This reduces
> standby power consumption by ~100mW.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.
