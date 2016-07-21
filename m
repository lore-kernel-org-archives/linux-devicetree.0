From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 03/18] ARM: mvebu: enable E1000E in mvebu_v7_defconfig
Date: Thu, 21 Jul 2016 13:44:09 +0100
Message-ID: <20160721124408.GO1041@n2100.armlinux.org.uk>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
 <1469105055-25181-4-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469105055-25181-4-git-send-email-jaz@semihalf.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2016 at 02:43:59PM +0200, Grzegorz Jaszczyk wrote:
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>

Why?  It's not like this is an on-soc device, but most likely a PCIe card.
Should we build-in all PCIe drivers?

I think it makes more sense to have this as a module rather than built-in.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
