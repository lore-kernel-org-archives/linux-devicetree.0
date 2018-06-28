From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6: RIoTboard Add chosen stdout-path property
Date: Thu, 28 Jun 2018 10:20:06 +0800
Message-ID: <20180628022005.GF22683@dragon>
References: <20180618154257.16919-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618154257.16919-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 05:42:57PM +0200, Emmanuel Vadot wrote:
> The RIoTboard debug uart is connected to serial1.
> Add a chosen property in the DTS so OS knows what serial port to use for
> the console.
> 
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

Applied, thanks.
