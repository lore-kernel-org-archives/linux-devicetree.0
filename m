From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH/RFT] arm64: dts: meson: odroid-c2: add missing mmc modes
Date: Mon, 13 May 2019 15:26:27 +0200
Message-ID: <20190513132627.25149-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add sdcard uhs modes up to DDR50 and push eMMC up to 200Mhz
With the new tuning method, these modes appear to be stable

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This particular board has always been painful when it comes to
 its eMMC modules. While testing the new tuning method introduced
 in the last cycle, I have not seen any issue with HS200@200Mhz.
 That being said, I only have the 16GB module.

 In the past, problems have been reported with other modules while
 it was fine on the one I have. Clearly, I don't have the full
 picture.

 Kevin, I don't know how you prefer to proceed. I am personally in
 no rush to see this applied. I'm sending this mainly to make sure
 it is shared and give people a chance to report issues.

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 1cc9dc68ef00..5a139e7b1c60 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -255,6 +255,10 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
 	max-frequency = <100000000>;
 	disable-wp;
 
@@ -272,7 +276,7 @@
 	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	max-frequency = <100000000>;
+	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 	cap-mmc-highspeed;
-- 
2.20.1
