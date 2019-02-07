From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v2 6/6] ARM: dts: clearfog: add comphy settings for
 Ethernet interfaces
Date: Thu, 07 Feb 2019 16:19:31 +0000
Message-ID: <E1grmOh-0000Nt-MV@rmk-PC.armlinux.org.uk>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the comphy settings for the Ethernet interfaces.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index 1b0d0680c8b6..0d81600ca247 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -93,6 +93,7 @@
 	bm,pool-long = <2>;
 	bm,pool-short = <1>;
 	buffer-manager = <&bm>;
+	phys = <&comphy1 1>;
 	phy-mode = "sgmii";
 	status = "okay";
 };
@@ -103,6 +104,7 @@
 	bm,pool-short = <1>;
 	buffer-manager = <&bm>;
 	managed = "in-band-status";
+	phys = <&comphy5 2>;
 	phy-mode = "sgmii";
 	sfp = <&sfp>;
 	status = "okay";
-- 
2.7.4
