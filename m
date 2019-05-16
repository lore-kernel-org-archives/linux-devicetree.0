Return-Path: <SRS0=LvYT=TQ=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/2] arm: dts: dra71-evm: Disable rtc target module
Date: Thu, 16 May 2019 16:47:18 +0530
Message-ID: <20190516111719.18567-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

rtc is fused out on dra71 and accessing target module
register is causing a boot crash hence disable it.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 82cc7ec37af0..113afd91e5d7 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -243,6 +243,10 @@
 	status = "disabled";
 };
 
+&rtctarget {
+	status = "disabled";
+};
+
 /* No RTC on this device */
 &rtc {
 	status = "disabled";
-- 
2.17.1
