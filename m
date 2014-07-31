From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/7] arm: dts: mt6589: Fix typo in GIC unit address
Date: Thu, 31 Jul 2014 18:42:19 +0200
Message-ID: <1406824943-24052-4-git-send-email-matthias.bgg@gmail.com>
References: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, olof@lixom.net, arnd@arndb.de, jason@lakedaemon.net, thomas.petazzoni@free-electrons.com, swarren@nvidia.com, sebastian.hesselbarth@gmail.com, stefan@agner.ch, maxime.ripard@free-electrons.com, matthias.bgg@gmail.com, anders.berg@lsi.com, linus.walleij@linaro.org, heiko@sntech.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This changes the unit address of the gic node to it's first register area.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt6589.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
index d0297a0..742c9bd 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -81,7 +81,7 @@
 			clock-names = "system-clk", "rtc-clk";
 		};
 
-		gic: interrupt-controller@10212000 {
+		gic: interrupt-controller@10211000 {
 			compatible = "arm,cortex-a15-gic";
 			interrupt-controller;
 			#interrupt-cells = <3>;
-- 
1.7.9.5
