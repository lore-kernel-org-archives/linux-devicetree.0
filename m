Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db8lp0189.outbound.messaging.microsoft.com ([213.199.154.189]:11779
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754786Ab3HEV6c (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 17:58:32 -0400
From: <dinguyen@altera.com>
Subject: [RESEND PATCH 0/4] Enable ethernet support for SOCFPGA
Date: Mon, 5 Aug 2013 16:58:41 -0500
Message-ID: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: dinh.linux@gmail.com
Cc: Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Pavel Machek <pavel@denx.de>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Dinh Nguyen <dinguyen@altera.com>

Hello,

These 4 patches are meant to enable ethernet and SD/MMC for the SOCFPGA
platform.

patch (1/4): Adds select ARM_TWD for the platform
patch (2/4): Add platform specific initialization for the ethernet controller.
patch (3/4): Commit 25c83b5c2 added "snps,phy-addr" for getting the PHY addr.
        Set the ethernet clocks to be emac_0_clk and emac_1_clk so it be gated.
patch (4/4): Update defconfig to support SD/MMC, ethernet, EXT3 and NFS.

Thanks,

Dinh Nguyen (4):
  arm: socfpga: Enable ARM_TWD for socfpga
  arm: socfpga: Add platform initialization for ethernet
  ARM: socfpga: dts: Fix entries for the ethernet entries.
  arm: socfpga: Add support for SD/MMC and ethernet to defconfig

 arch/arm/boot/dts/socfpga.dtsi         |    4 +-
 arch/arm/boot/dts/socfpga_cyclone5.dts |    2 +-
 arch/arm/configs/socfpga_defconfig     |    8 +++
 arch/arm/mach-socfpga/Kconfig          |    1 +
 arch/arm/mach-socfpga/core.h           |    8 +++
 arch/arm/mach-socfpga/socfpga.c        |   85 +++++++++++++++++++++++++++++++-
 6 files changed, 104 insertions(+), 4 deletions(-)

CC: Arnd Bergmann <arnd@arndb.de>
CC: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Pavel Machek <pavel@denx.de>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

-- 
1.7.9.5


