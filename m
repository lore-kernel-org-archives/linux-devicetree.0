From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/6] ARM: dts: Fix typo in armada-xp-98dx4251
Date: Wed,  8 Feb 2017 09:28:10 +1300
Message-ID: <20170207202815.20226-2-chris.packham@alliedtelesis.co.nz>
References: <20170207202815.20226-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170207202815.20226-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The compatible should be 98dx4251 not 98dx4521.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2
    - new

 arch/arm/boot/dts/armada-xp-98dx4251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
index 4b0533a4ccb7..b9d9b269efb4 100644
--- a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
@@ -49,7 +49,7 @@
 
 / {
 	model = "Marvell 98DX4251 SoC";
-	compatible = "marvell,armadaxp-98dx4521", "marvell,armadaxp-98dx3236", "marvell,armadaxp", "marvell,armada-370-xp";
+	compatible = "marvell,armadaxp-98dx4251", "marvell,armadaxp-98dx3236", "marvell,armadaxp", "marvell,armada-370-xp";
 
 	cpus {
 		cpu@1 {
-- 
2.11.0.24.ge6920cf
