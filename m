From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add imx-weim parameters to dtsi's
Date: Sat, 5 Nov 2016 19:47:00 +0800
Message-ID: <20161105114658.GI5597@dragon>
References: <1478044305-5666-1-git-send-email-stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478044305-5666-1-git-send-email-stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 01, 2016 at 04:51:45PM -0700, Joshua Clayton wrote:
> imx-weim should always set address-cells to 2,
> and size_cells to 1.
> On imx6, fsl,weim-cs-gpr will always be &gpr
> 
> Set these common parameters in the dtsi file,
> rather than in a downstream dts.
> 
> Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>

Applied, thanks.
