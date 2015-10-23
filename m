From: Jaedon Shin <jaedon.shin@gmail.com>
Subject: [PATCH 05/10] phy: phy_brcmstb_sata: remove unused definitions
Date: Fri, 23 Oct 2015 10:44:18 +0900
Message-ID: <1445564663-66824-6-git-send-email-jaedon.shin@gmail.com>
References: <1445564663-66824-1-git-send-email-jaedon.shin@gmail.com>
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <1445564663-66824-1-git-send-email-jaedon.shin@gmail.com>
Sender: linux-ide-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, Jaedon Shin <jaedon.shin@gmail.com>
List-Id: devicetree@vger.kernel.org

Remove unused definitions.

Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
---
 drivers/phy/phy-brcmstb-sata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/phy-brcmstb-sata.c b/drivers/phy/phy-brcmstb-sata.c
index 8a2cb16a1937..0be55dafe9ea 100644
--- a/drivers/phy/phy-brcmstb-sata.c
+++ b/drivers/phy/phy-brcmstb-sata.c
@@ -26,8 +26,6 @@
 
 #define SATA_MDIO_BANK_OFFSET				0x23c
 #define SATA_MDIO_REG_OFFSET(ofs)			((ofs) * 4)
-#define SATA_MDIO_REG_SPACE_SIZE			0x1000
-#define SATA_MDIO_REG_LENGTH				0x1f00
 
 #define MAX_PORTS					2
 
-- 
2.6.2

