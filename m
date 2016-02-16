From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 4/5] dt-bindings: ata: add compatible string for iProc AHCI controller
Date: Tue, 16 Feb 2016 12:03:39 +0530
Message-ID: <1455604420-11300-5-git-send-email-anup.patel@broadcom.com>
References: <1455604420-11300-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455604420-11300-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

The Broadcom iProc SoCs have AHCI compliant SATA controller. This
patch adds common compatible string for AHCI SATA controller on
iProc SoCs.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
---
 Documentation/devicetree/bindings/ata/ahci-platform.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.txt b/Documentation/devicetree/bindings/ata/ahci-platform.txt
index c2340ee..caee721 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.txt
@@ -10,6 +10,7 @@ PHYs.
 Required properties:
 - compatible        : compatible string, one of:
   - "allwinner,sun4i-a10-ahci"
+  - "brcm,iproc-ahci"
   - "hisilicon,hisi-ahci"
   - "ibm,476gtr-ahci"
   - "marvell,armada-380-ahci"
-- 
1.9.1
