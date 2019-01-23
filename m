From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH reset-next 1/2] reset: brcmstb: Make it tristate
Date: Tue, 22 Jan 2019 16:33:44 -0800
Message-ID: <20190123003345.13750-2-f.fainelli@gmail.com>
References: <20190123003345.13750-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123003345.13750-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, rdunlap@infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, paul.gortmaker@windriver.com
List-Id: devicetree@vger.kernel.org

The driver can be built as a module just fine, so let's make it
selectable as such.

Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/reset/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 1ca03c57e049..d9a02b7f90cf 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -41,7 +41,8 @@ config RESET_BERLIN
 	  This enables the reset controller driver for Marvell Berlin SoCs.
 
 config RESET_BRCMSTB
-	bool "Broadcom STB reset controller" if COMPILE_TEST
+	tristate "Broadcom STB reset controller"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
 	default ARCH_BRCMSTB
 	help
 	  This enables the reset controller driver for Broadcom STB SoCs using
-- 
2.17.1
