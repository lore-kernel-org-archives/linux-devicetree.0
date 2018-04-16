From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm: dts: hummingboard: convert onboard audio to
 simple-audio-card
Date: Mon, 16 Apr 2018 15:29:39 +0800
Message-ID: <20180416072938.GD25429@dragon>
References: <20180319201414.29481-1-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180319201414.29481-1-mporter@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@konsulko.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 19, 2018 at 04:14:13PM -0400, Matt Porter wrote:
> The HB onboard audio currently makes use of the imx-audio-sgtl5000
> binding. This binding does not support auxiliary audio devices such
> as external amplifiers. The simple-audio-card binding does support
> this property which allows systems incorporating the HB to add an
> auxiliary device that's attached to the HB audio jack with an
> overlay. Convert the HB onboard audio to use simple-audio-card for
> this additional flexibility.
> 
> Signed-off-by: Matt Porter <mporter@konsulko.com>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied, thanks.
