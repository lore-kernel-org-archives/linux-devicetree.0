Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db8lp0185.outbound.messaging.microsoft.com ([213.199.154.185]:3270
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754717Ab3HEV6b (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 17:58:31 -0400
From: <dinguyen@altera.com>
Subject: [RESEND PATCH 1/4] arm: socfpga: Enable ARM_TWD for socfpga
Date: Mon, 5 Aug 2013 16:58:42 -0500
Message-ID: <1375739925-9110-2-git-send-email-dinguyen@altera.com>
In-Reply-To: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: dinh.linux@gmail.com
Cc: Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Pavel Machek <pavel@denx.de>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Dinh Nguyen <dinguyen@altera.com>

Update Kconfig to enable TWD.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Reviewed-by: Pavel Machek <pavel@denx.de>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org
Cc: Pavel Machek <pavel@denx.de>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 arch/arm/mach-socfpga/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index dd86db4..efad818 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -11,6 +11,7 @@ config ARCH_SOCFPGA
 	select GENERIC_CLOCKEVENTS
 	select GPIO_PL061 if GPIOLIB
 	select HAVE_ARM_SCU
+	select HAVE_ARM_TWD if LOCAL_TIMERS
 	select HAVE_SMP
 	select MFD_SYSCON
 	select SPARSE_IRQ
-- 
1.7.9.5


