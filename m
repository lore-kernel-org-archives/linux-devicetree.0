From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH 07/15] ARM: dts: kirkwood: consolidate common pinctrl
 settings
Date: Wed, 30 Apr 2014 10:42:36 -0600
Message-ID: <20140430164236.GC12944@obsidianresearch.com>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1398862602-29595-8-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398862602-29595-8-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 30, 2014 at 02:56:34PM +0200, Sebastian Hesselbarth wrote:
> All SoCs have the same pinctrl setting for NAND, UART0/1, SPI, TWSI0,
> and GBE1. Move it to the common pinctrl node that we now have.

There are two possible choices for UART0, UART1, and SPI on kirkwood..

For instance I use this on my board:

                                pmx_spi0: pmx-spi0 {
                                        marvell,pins = "mpp7", "mpp10", "mpp11", "mpp12";
                                        marvell,function = "spi";
                                };

vs

> +
> +			pmx_spi: pmx-spi {
> +				marvell,pins = "mpp0", "mpp1", "mpp2", "mpp3";
> +				marvell,function = "spi";
> +			};

It looks like all the boards in the kernel use the same choice, so it
makes some sense to consolidate, but I assume a board file can
override the marvell,pins?

Otherwise the rest of your patchset looked sane to me.

Regards,
Jason
