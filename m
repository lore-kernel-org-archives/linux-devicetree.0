From: Ryan Grachek <ryan@edited.us>
Subject: [PATCH] arm64: dts: hikey: Enable SDIO high-speed mode on WL1835 module
Date: Fri, 30 Mar 2018 11:11:18 -0500
Message-ID: <20180330161118.5751-1-ryan@edited.us>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Ryan Grachek <ryan@edited.us>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

According to hardware documentation, the WL1835MOD WiFi chip
supports SDIO high-speed mode, which increases the clock to
50 MHz. This results in a modest increase in throughput.

Signed-off-by: Ryan Grachek <ryan@edited.us>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 5d5aa4f4a235..a5e0cc4370e1 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -322,6 +322,7 @@
 
 		dwmmc_2: dwmmc2@f723f000 {
 			bus-width = <0x4>;
+			cap-sd-highspeed;
 			non-removable;
 			vmmc-supply = <&reg_vdd_3v3>;
 			mmc-pwrseq = <&wl1835_pwrseq>;
-- 
2.11.0
