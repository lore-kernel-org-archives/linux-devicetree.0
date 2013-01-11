From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/4] ARM: dts: mxs-phy: Change mxs phy clock usage
Date: Fri, 11 Jan 2013 10:25:27 +0800
Message-ID: <20130111022525.GC9139@S2101-09.ap.freescale.net>
References: <1357806954-27960-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1357806954-27960-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: alexander.shishkin@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, dong.aisheng@linaro.org, rob@landley.net, balbi@ti.com, kernel@pengutronix.de, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, festevam@gmail.com, marex@denx.de, mkl@pengutronix.de, m.grzeschik@pengutronix.de, matt@genesi-usa.com, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2013 at 04:35:51PM +0800, Peter Chen wrote:
> For mxs-phy user i.mx6q, the PHY's clock is controlled by
> hardware automatically, the software only needs to enable it
> at probe, this clock should be used like below:
> 
> - Enable at mxs-phy's probe, and disable at mxs-phy's remove, so
> The clk framework doesn't need to know it. But other mxs-phy user
> mx28/mx23 may need it, so we give mxs-phy a dummy clock for imx6q.
> - During the runtime, we don't need to control it.
> 
Turning it into a dummy clock, you will have no way to maintain the
use count.  It could possibly cause parent clock be turned off while
usbphy is in use.

Let's try to find some other way.

Shawn

