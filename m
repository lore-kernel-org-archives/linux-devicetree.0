From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6q-logicpd: Reduce inrush current on USBH1
Date: Thu, 11 Apr 2019 13:48:06 +0800
Message-ID: <20190411054805.GV26817@dragon>
References: <20190402193204.4745-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402193204.4745-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, adam.ford@logicpd.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 02:32:04PM -0500, Adam Ford wrote:
> Some USB peripherals draw more power, and the sourcing regulator
> take a little time to turn on.  This patch fixes an issue where
> some devices occasionally do not get detected, because the power
> isn't quite ready when communication starts, so we add a bit
> of a delay.
> 
> Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
> i.MX6QD EVM")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.
