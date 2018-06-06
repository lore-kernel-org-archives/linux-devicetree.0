From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] ARM: dts: cygnus: Add HWRNG node
Date: Wed,  6 Jun 2018 11:34:41 +0200
Message-ID: <20180606093441.16483-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

From: Clément Peron <clement.peron@devialet.com>

There is a HWRNG in Broadcom Cygnus SoC, so enable it.

Signed-off-by: Clément Peron <clement.peron@devialet.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 1cee40ac4613..b7178e84d56d 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -452,6 +452,11 @@
 			status = "disabled";
 		};
 
+		hwrng: hwrng@18032000 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0x18032000 0x28>;
+		};
+
 		sdhci0: sdhci@18041000 {
 			compatible = "brcm,sdhci-iproc-cygnus";
 			reg = <0x18041000 0x100>;
-- 
2.17.1
