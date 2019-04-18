From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: a64: bananapi-m64: Enable PMIC USB
 power supply
Date: Fri, 19 Apr 2019 00:18:04 +0800
Message-ID: <20190418161804.17723-4-wens@kernel.org>
References: <20190418161804.17723-1-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418161804.17723-1-wens@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The Bananapi M64 has a micro-USB connector with USB OTG support (that
is already enabled). VBUS from this connector is wired to the PMIC's
VBUS input.

Enable the PMIC's USB power supply on this board, and also hook it up
to the USB PHY.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 0a56c0c23ba1..855d1044b9a2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -394,8 +394,13 @@
 	status = "okay";
 };
 
+&usb_power_supply {
+	status = "okay";
+};
+
 &usbphy {
 	usb0_id_det-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
 	usb0_vbus-supply = <&reg_drivevbus>;
 	status = "okay";
 };
-- 
2.20.1
