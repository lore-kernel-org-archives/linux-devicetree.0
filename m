From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx: Add dummy PHYs for HSIC-only USB
 controllers
Date: Mon, 26 Nov 2018 22:02:10 +0800
Message-ID: <20181126140208.GA31334@dragon>
References: <1539848729-27646-1-git-send-email-frieder.schrempf@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539848729-27646-1-git-send-email-frieder.schrempf@kontron.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: devicetree@vger.kernel.org, peter.chen@nxp.com, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 09:45:04AM +0200, Frieder Schrempf wrote:
> Some SOCs in the i.MX6 family have a USB host controller that is
> only capable of the HSIC interface and has no on-board PHY.
> 
> To be able to use these controllers, we need to add "usb-nop-xceiv"
> dummy PHYs.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied, thanks.
