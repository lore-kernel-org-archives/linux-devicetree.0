From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 03/18] ARM: mvebu: enable E1000E in mvebu_v7_defconfig
Date: Thu, 21 Jul 2016 14:46:47 +0200
Message-ID: <20160721144647.78fce4a8@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-4-git-send-email-jaz@semihalf.com>
	<20160721124408.GO1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160721124408.GO1041@n2100.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Grzegorz Jaszczyk <jaz@semihalf.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, gregory.clement@free-electrons.com, mw@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, 21 Jul 2016 13:44:09 +0100, Russell King - ARM Linux wrote:
> On Thu, Jul 21, 2016 at 02:43:59PM +0200, Grzegorz Jaszczyk wrote:
> > Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>  
> 
> Why?  It's not like this is an on-soc device, but most likely a PCIe card.
> Should we build-in all PCIe drivers?

I agree.

> I think it makes more sense to have this as a module rather than built-in.

I would prefer to not have it all in the defconfig. I'd hate to have
a defconfig that builds tons of random modules "just because".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
