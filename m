From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/2] arm64: dts: marvell: mcbin: Adding SPI-NOR Flash
 Config
Date: Mon, 11 Feb 2019 17:19:15 +0000
Message-ID: <20190211171914.3leychqcdgfg4xlm@shell.armlinux.org.uk>
References: <20190211171401.434-1-alex@asyring.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190211171401.434-1-alex@asyring.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Syring <alex@asyring.de>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 06:14:01PM +0100, Alexander Syring wrote:
> According to U-Boot dts file enabling the SPI-NOR flash for use in
> Linux

Some of us already use u-boot on Macchiatobin, and have u-boot in SPI
NOR flash.  The u-boot environment is stored at 0x3f0000 currently.

Merging this will break existing setups, especially when we use
u-boot-tools to access the environment from within Linux.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
