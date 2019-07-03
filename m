From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 02/39] ARM: dts: meson8b: fix the operating voltage of the Mali GPU
Date: Tue,  2 Jul 2019 22:14:37 -0400
Message-ID: <20190703021514.17727-2-sashal@kernel.org>
References: <20190703021514.17727-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703021514.17727-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 26d65140e92a626e39c73c9abf769fd174bf5076 ]

Amlogic's vendor kernel defines an OPP for the GPU on Meson8b boards
with a voltage of 1.15V. It turns out that the vendor kernel relies on
the bootloader to set up the voltage. The bootloader however sets a
fixed voltage of 1.10V.

Amlogic's patched u-boot sources (uboot-2015-01-15-23a3562521) confirm
this:
$ grep -oiE "VDD(EE|AO)_VOLTAGE[ ]+[0-9]+" board/amlogic/configs/m8b_*
  board/amlogic/configs/m8b_m100_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m101_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m102_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m200_v1.h:VDDAO_VOLTAGE            1100
  board/amlogic/configs/m8b_m201_v1.h:VDDEE_VOLTAGE            1100
  board/amlogic/configs/m8b_m201_v1.h:VDDEE_VOLTAGE            1100
  board/amlogic/configs/m8b_m202_v1.h:VDDEE_VOLTAGE            1100

Another hint at this is the VDDEE voltage on the EC-100 and Odroid-C1
boards. The VDDEE regulator supplies the Mali GPU. It's basically a copy
of the VCCK (CPU supply) which means it's limited to 0.86V to 1.14V.

Update the operating voltage of the Mali GPU on Meson8b to 1.10V so it
matches with what the vendor u-boot sets.

Fixes: c3ea80b6138cae ("ARM: dts: meson8b: add the Mali-450 MP2 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8b.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fe84a8c3ce81..6b80aff32fc2 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -163,23 +163,23 @@
 
 		opp-255000000 {
 			opp-hz = /bits/ 64 <255000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-364300000 {
 			opp-hz = /bits/ 64 <364300000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-425000000 {
 			opp-hz = /bits/ 64 <425000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-510000000 {
 			opp-hz = /bits/ 64 <510000000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 		};
 		opp-637500000 {
 			opp-hz = /bits/ 64 <637500000>;
-			opp-microvolt = <1150000>;
+			opp-microvolt = <1100000>;
 			turbo-mode;
 		};
 	};
-- 
2.20.1
