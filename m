Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db8lp0185.outbound.messaging.microsoft.com ([213.199.154.185]:32746
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754792Ab3HEV6c (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 17:58:32 -0400
From: <dinguyen@altera.com>
Subject: [RESEND PATCH 4/4] arm: socfpga: Add support for SD/MMC and ethernet to defconfig
Date: Mon, 5 Aug 2013 16:58:45 -0500
Message-ID: <1375739925-9110-5-git-send-email-dinguyen@altera.com>
In-Reply-To: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: dinh.linux@gmail.com
Cc: Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Pavel Machek <pavel@denx.de>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Dinh Nguyen <dinguyen@altera.com>

Update the socfpga_defconfig to include dw_mmc driver and Micrel PHY.
Also enable EXT3 and NFS FS support.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
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
---
 arch/arm/configs/socfpga_defconfig |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 4e1ce21..dcca3a1 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -52,6 +52,7 @@ CONFIG_BLK_DEV_SD=y
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
 CONFIG_STMMAC_ETH=y
+CONFIG_MICREL_PHY=y
 # CONFIG_STMMAC_PHY_ID_ZERO_WORKAROUND is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_SERIO_SERPORT is not set
@@ -66,6 +67,9 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT3_FS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 CONFIG_VFAT_FS=y
@@ -82,3 +86,7 @@ CONFIG_DEBUG_INFO=y
 CONFIG_ENABLE_DEFAULT_TRACERS=y
 CONFIG_DEBUG_USER=y
 CONFIG_XZ_DEC=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_PLTFM=y
+CONFIG_MMC_DW_SOCFPGA=y
-- 
1.7.9.5


