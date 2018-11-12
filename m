From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [RFC PATCH 6/6] ARM: dts: clearfog: add comphy settings for Ethernet
 interfaces
Date: Mon, 12 Nov 2018 12:31:12 +0000
Message-ID: <E1gMBN2-0008AQ-Nk@rmk-PC.armlinux.org.uk>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181112122933.GD30658@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
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
