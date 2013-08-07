Return-Path: <devicetree-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57470 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757164Ab3HGS57 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 14:57:59 -0400
Date: Wed, 7 Aug 2013 20:57:57 +0200
From: Pavel Machek <pavel@denx.de>
Subject: Re: [RESEND PATCH 2/4] arm: socfpga: Add platform initialization
 for ethernet
Message-ID: <20130807185757.GA12555@amd.pavel.ucw.cz>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
 <1375739925-9110-3-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375739925-9110-3-git-send-email-dinguyen@altera.com>
Sender: devicetree-owner@vger.kernel.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

Hi!

> From: Dinh Nguyen <dinguyen@altera.com>
> 
> Use the PHYLIB to set the correct clock and skew values to the Micrel PHY. Add
> platform specific intilization to put the STMMAC ethernet controller into the
> correct PHY mode.
> 
...
>  arch/arm/mach-socfpga/core.h    |    8 ++++
>  arch/arm/mach-socfpga/socfpga.c |   85 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 92 insertions(+), 1 deletion(-)

When I tried to apply it on today's mainline, I got:

  LD      init/built-in.o
arch/arm/mach-socfpga/socfpga.c: In function 'ksz9021rlrn_phy_fixup':
arch/arm/mach-socfpga/socfpga.c:85:21: error:
'MICREL_KSZ9021_EXTREG_CTRL' undeclared (first use in this function)
arch/arm/mach-socfpga/socfpga.c:85:21: note: each undeclared
identifier is reported only once for each function it appears in
arch/arm/mach-socfpga/socfpga.c:86:4: error:
'MICREL_KSZ9021_RGMII_RX_DATA_PAD_SCEW' undeclared (first use in this
function)
arch/arm/mach-socfpga/socfpga.c:87:21: error:
'MICREL_KSZ9021_EXTREG_DATA_WRITE' undeclared (first use in this
function)
arch/arm/mach-socfpga/socfpga.c:91:4: error:
'MICREL_KSZ9021_RGMII_CLK_CTRL_PAD_SCEW' undeclared (first use in this
function)
arch/arm/mach-socfpga/socfpga.c: In function 'socfpga_cyclone5_init':
arch/arm/mach-socfpga/socfpga.c:193:30: error: 'PHY_ID_KSZ9021RLRN'
undeclared (first use in this function)

I tried adding
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git to my
branch, but that did not help.
 
It compiles ok when I apply

Date: Mon, 15 Jul 2013 18:08:50 -0500
From: dinguyen@altera.com
To: dinh.linux@gmail.com, netdev@vger.kernel.org
Cc: Pavel Machek <pavel@denx.de>, Nicolas Ferre
<nicolas.ferre@atmel.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawn.guo@linaro.org>,
        Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
        Andrew Victor <linux@maxim.org.za>,
        Dinh Nguyen <dinguyen@altera.com>
Subject: [PATCH] phy: micrel: Add definitions for common Micrel PHY
registers
X-Mailer: git-send-email 1.7.9.5

From: Dinh Nguyen <dinguyen@altera.com>

Add defines for common Micrel PHY setups so that other platforms
can use them. Update imx61 and sama5 hardware to use the micrel_phy.h
PHY defines.

Also add support for the KSZ9021RLRN PHY.

. Perhaps it should be added to the series (or at least pushed
again?).

Thanks,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
