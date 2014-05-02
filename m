From: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Subject: [PATCH] IBM Akebono: Remove obsolete config select
Date: Fri,  2 May 2014 18:06:45 +1000
Message-ID: <1399018005-23136-1-git-send-email-alistair@popple.id.au>
References: <1398998002.2925.15.camel@pasglop>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398998002.2925.15.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The original implementation of MMC support for Akebono introduced a
new configuration symbol (MMC_SDHCI_OF_476GTR). This symbol has been
dropped in favour of using the generic platform driver however the
select for this symbol was mistakenly left in the platform
configuration.

This patch removes the obsolete symbol selection.

Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
---
 arch/powerpc/platforms/44x/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 8beec7d..908bf11 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -220,7 +220,6 @@ config AKEBONO
 	select USB_EHCI_HCD_PLATFORM
 	select MMC_SDHCI
 	select MMC_SDHCI_PLTFM
-	select MMC_SDHCI_OF_476GTR
 	select ATA
 	select SATA_AHCI_PLATFORM
 	help
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
