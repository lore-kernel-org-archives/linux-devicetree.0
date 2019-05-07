From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 69/95] arm64: dts: marvell: armada-ap806: reserve PSCI area
Date: Tue,  7 May 2019 01:37:58 -0400
Message-ID: <20190507053826.31622-69-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, Sasha Levin <alexander.levin@microsoft.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

[ Upstream commit 132ac39cffbcfed80ada38ef0fc6d34d95da7be6 ]

The memory area [0x4000000-0x4200000[ is occupied by the PSCI firmware. Any
attempt to access it from Linux leads to an immediate crash.

So let's make the same memory reservation as the vendor kernel.

[gregory: added as comment that this region matches the mainline U-boot]
Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 30d48ecf46e0..27d2bd85d1ae 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -65,6 +65,23 @@
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * This area matches the mapping done with a
+		 * mainline U-Boot, and should be updated by the
+		 * bootloader.
+		 */
+
+		psci-area@4000000 {
+			reg = <0x0 0x4000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
 	ap806 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.20.1
