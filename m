From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1] ARM: dts: imx6qdl-sabreauto: add ecspi dts for
 sabreauto board
Date: Mon, 16 Apr 2018 16:34:27 +0800
Message-ID: <20180416083426.GF25429@dragon>
References: <1521627768-942-1-git-send-email-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521627768-942-1-git-send-email-yibin.gong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Gong <yibin.gong@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kernel@pengutronix.de, fabio.estevam@nxp.com, aisheng.dong@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 21, 2018 at 06:22:48PM +0800, Robin Gong wrote:
> DIN pin of SPI-NOR muxed with I2C3_SDA which connected to one gpio expand
> chip, thus have to disable all those module which compacted by those gpios
> if enable SPI-NOR support on Sabreauto board.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>

I'm not in the position to maintain a bunch of dts files for a single
board with different device multiplexing options.

Shawn
