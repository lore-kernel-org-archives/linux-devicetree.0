Return-Path: <SRS0=lJrw=MP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:55919 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbeJCOMq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 3 Oct 2018 10:12:46 -0400
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v8 2/2] arm64: dts: marvell: add CP110 ICU SEI subnode
Date: Wed,  3 Oct 2018 09:25:15 +0200
Message-Id: <20181003072515.20121-2-miquel.raynal@bootlin.com>
In-Reply-To: <20181003072515.20121-1-miquel.raynal@bootlin.com>
References: <20181003072515.20121-1-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The ICU handles several interrupt groups, each of them being a subpart
of the ICU node.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This patch is one of the two patches remaining from the series:
"Add System Error Interrupt support to Armada SoCs".

Changes since v7:
-----------------
* Rebased on top of mvebu/dt64


 arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
index b1e688e0ce22..b9d9f31e3ba1 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
@@ -193,6 +193,14 @@
 				interrupt-controller;
 				msi-parent = <&gicp>;
 			};
+
+			CP110_LABEL(icu_sei): interrupt-controller@50 {
+				compatible = "marvell,cp110-icu-sei";
+				reg = <0x50 0x10>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				msi-parent = <&sei>;
+			};
 		};
 
 		CP110_LABEL(rtc): rtc@284000 {
-- 
2.17.1
