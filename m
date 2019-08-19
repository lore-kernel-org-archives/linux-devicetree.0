From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7d: cl-som-imx7: make ethernet work again
Date: Mon, 19 Aug 2019 09:51:22 +0200
Message-ID: <20190819075121.GE5999@X250>
References: <20190809031227.3319-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809031227.3319-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Cc: linux-kernel@vger.kernel.org, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 04:12:27AM +0100, André Draszik wrote:
> Recent changes to the atheros at803x driver caused
> ethernet to stop working on this board.
> In particular commit 6d4cd041f0af
> ("net: phy: at803x: disable delay only for RGMII mode")
> and commit cd28d1d6e52e
> ("net: phy: at803x: Disable phy delay for RGMII mode")
> fix the AR8031 driver to configure the phy's (RX/TX)
> delays as per the 'phy-mode' in the device tree.
> 
> This now prevents ethernet from working on this board.
> 
> It used to work before those commits, because the
> AR8031 comes out of reset with RX delay enabled, and
> the at803x driver didn't touch the delay configuration
> at all when "rgmii" mode was selected, and because
> arch/arm/mach-imx/mach-imx7d.c:ar8031_phy_fixup()
> unconditionally enables TX delay.
> 
> Since above commits ar8031_phy_fixup() also has no
> effect anymore, and the end-result is that all delays
> are disabled in the phy, no ethernet.
> 
> Update the device tree to restore functionality.
> 
> Signed-off-by: André Draszik <git@andred.net>
> CC: Ilya Ledvich <ilya@compulab.co.il>
> CC: Igor Grinberg <grinberg@compulab.co.il>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>
> CC: devicetree@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org

Applied, thanks.
