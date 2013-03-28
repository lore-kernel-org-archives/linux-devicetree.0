From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] bcm2835: Add Broadcom BCM2835 RNG to the device tree
Date: Thu, 28 Mar 2013 07:12:04 +0100
Message-ID: <1364451124-5039-1-git-send-email-lkundrak@v3.sk>
References: <1364135511-26970-1-git-send-email-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364135511-26970-1-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Lubomir Rintel <lkundrak@v3.sk>, Stephen Warren <swarren@wwwdotorg.org>, linux-rpi-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds a device tree binding for random number generator present on Broadcom
BCM2835 SoC, used in Raspberry Pi and Roku 2 devices.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Tested-by: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-rpi-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
Changes for v2:
    - Split out from the driver changeset
    - Added documentation

Changes for v3:
    - Moved documentation away to the driver commit

 arch/arm/boot/dts/bcm2835.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 7e0481e..dc22336 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -34,6 +34,11 @@
 			reg = <0x7e100000 0x28>;
 		};
 
+		rng {
+			compatible = "brcm,bcm2835-rng";
+			reg = <0x7e104000 0x10>;
+		};
+
 		uart@20201000 {
 			compatible = "brcm,bcm2835-pl011", "arm,pl011", "arm,primecell";
 			reg = <0x7e201000 0x1000>;
-- 
1.7.1
