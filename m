From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: vf610-bk4: Fix qspi node description
Date: Sat, 3 Aug 2019 17:53:42 +0200
Message-ID: <20190803155341.GT8870@X250.getinternet.no>
References: <20190731141151.7196-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190731141151.7196-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 04:11:51PM +0200, Lukasz Majewski wrote:
> Before this change the device tree description of qspi node for
> second memory on BK4 board was wrong (applicable to old, removed
> fsl-quadspi.c driver).
> 
> As a result this memory was not recognized correctly when used
> with the new spi-fsl-qspi.c driver.
> 
> From the dt-bindings:
> 
> "Required SPI slave node properties:
>   - reg: There are two buses (A and B) with two chip selects each.
> This encodes to which bus and CS the flash is connected:
> <0>: Bus A, CS 0
> <1>: Bus A, CS 1
> <2>: Bus B, CS 0
> <3>: Bus B, CS 1"
> 
> According to above with new driver the second SPI-NOR memory shall
> have reg=<2> as it is connected to Bus B, CS 0.
> 
> Fixes: a67d2c52a82f ("ARM: dts: Add support for Liebherr's BK4 device (vf610 based)")
> Suggested-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.
