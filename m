From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] imx53.dtsi: Add IPU nodes for csi
Date: Tue, 9 Aug 2016 21:38:05 +0800
Message-ID: <20160809133805.GW4678@tiger>
References: <CAOMZO5BoRsrHv-+5c9bAXO2NCya8sPqmmpy9DOfav6NvQ+VMLQ@mail.gmail.com>
 <1470318452-31391-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470318452-31391-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2016 at 03:47:32PM +0200, Fabien Lahoudere wrote:
> We have the following messages that tell csi devices are not used:
> imx-ipuv3 18000000.ipu: no port@0 node in /soc/ipu@18000000, not using CSI0
> imx-ipuv3 18000000.ipu: no port@1 node in /soc/ipu@18000000, not using CSI1
> 
> So we add them in the common device tree to make CSI ports available on
> imx53 boards.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>

Updated subject 'ARM: dts: imx53: ...', and applied patch.

Shawn
