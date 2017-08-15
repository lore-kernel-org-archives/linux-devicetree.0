From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 5/6] ARM: dts: cygnus: add serial0 alias for uart3 on bcm91130_entphn
Date: Tue, 15 Aug 2017 10:26:02 -0700
Message-ID: <1502817964-8221-6-git-send-email-scott.branden@broadcom.com>
References: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Use serial0 alias to select stdout-path on Cygnus bcm911360_entphon
board.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm/boot/dts/bcm911360_entphn.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm911360_entphn.dts b/arch/arm/boot/dts/bcm911360_entphn.dts
index 000f5f1..53f990d 100644
--- a/arch/arm/boot/dts/bcm911360_entphn.dts
+++ b/arch/arm/boot/dts/bcm911360_entphn.dts
@@ -39,9 +39,12 @@
 	model = "Cygnus Enterprise Phone (BCM911360_ENTPHN)";
 	compatible = "brcm,bcm11360", "brcm,cygnus";
 
+	aliases {
+		serial0 = &uart3;
+	};
+
 	chosen {
-		stdout-path = &uart3;
-		bootargs = "console=ttyS0,115200";
+		stdout-path = "serial0:115200n8";
 	};
 
 	gpio_keys {
-- 
2.5.0
