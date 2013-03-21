From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 2/5] arm: mvebu: Select DMA_BOUNCE when LPAE is selected in Kconfig
Date: Thu, 21 Mar 2013 17:26:15 +0100
Message-ID: <1363883179-1361-3-git-send-email-gregory.clement@free-electrons.com>
References: <1363883179-1361-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363883179-1361-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Nicolas Pitre <nico@fluxnic.net>, Lior Amsalem <alior@marvell.com>, Maen Suleiman <maen@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Eran Ben-Avi <benavi@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Ike Pan <ike.pan@canonical.com>, Chris Van Hoof <vanhoof@canonical.com>, Dan Frazier <dann.frazier@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>, Jon Masters <jcm@redhat.com>, David Marlin <dmarlin@redhat.com>, Sebastian
List-Id: devicetree@vger.kernel.org

From: Lior Amsalem <alior@marvell.com>

For mvebu IOs are 32 bits and we have 40 bits memory due to LPAE so
make sure we give 32 bits addresses to the IOs.

Signed-off-by: Lior Amsalem <alior@marvell.com>
Tested-by: Franklin <flin@marvell.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/mach-mvebu/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
index 440b13e..617da94 100644
--- a/arch/arm/mach-mvebu/Kconfig
+++ b/arch/arm/mach-mvebu/Kconfig
@@ -13,6 +13,7 @@ config ARCH_MVEBU
 	select MVEBU_CLK_CORE
 	select MVEBU_CLK_CPU
 	select MVEBU_CLK_GATING
+	select DMABOUNCE if ARM_LPAE
 
 if ARCH_MVEBU
 
-- 
1.7.9.5
