Return-Path: <SRS0=LvYT=TQ=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/2] arm: dts: dra76-evm: Disable usb4_tm target module
Date: Thu, 16 May 2019 14:36:56 +0530
Message-ID: <20190516090657.25211-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

usb4_tm is unsed on dra76 and accessing the module
with ti,sysc is causing a boot crash hence disable its target
module.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra76-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 8a57895fd8f3..6607fbe3c67c 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -431,6 +431,10 @@
 	phy-names = "pcie-phy0", "pcie-phy1";
 };
 
+&usb4_tm {
+	status = "disabled";
+};
+
 &pcie1_ep {
 	num-lanes = <2>;
 	phys = <&pcie1_phy>, <&pcie2_phy>;
-- 
2.17.1
