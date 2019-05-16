Return-Path: <SRS0=LvYT=TQ=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/2] arm: dts: dra71-evm: Disable usb4_tm target module
Date: Thu, 16 May 2019 16:47:19 +0530
Message-ID: <20190516111719.18567-2-j-keerthy@ti.com>
In-Reply-To: <20190516111719.18567-1-j-keerthy@ti.com>
References: <20190516111719.18567-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

usb4_tm is unsed on dra71 and accessing the module
with ti,sysc is causing a boot crash hence disable its target
module.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 113afd91e5d7..2ae1a478fb34 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -277,3 +277,7 @@
 &extcon_usb2 {
 	vbus-gpio = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
 };
+
+&usb4_tm {
+	status = "disabled";
+};
-- 
2.17.1
