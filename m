From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/5] ARM: dts: meson8b: add the RMII pins
Date: Sat, 22 Sep 2018 17:10:02 +0200
Message-ID: <20180922151003.4736-5-martin.blumenstingl@googlemail.com>
References: <20180922151003.4736-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180922151003.4736-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, drake@endlessm.com
List-Id: devicetree@vger.kernel.org

Some boards use an RMII Ethernet PHY which requires fewer pins than the
RGMII PHYs. Add a separate eth_rmii_pins node which does not include the
pins which are only required for RGMII (but not for RMII) PHYs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 4bbbbc6bea83..cd1ca9dda126 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -223,6 +223,21 @@
 			};
 		};
 
+		eth_rmii_pins: eth-rmii {
+			mux {
+				groups = "eth_tx_en",
+					 "eth_txd1_0",
+					 "eth_txd0_0",
+					 "eth_rx_clk",
+					 "eth_rx_dv",
+					 "eth_rxd1",
+					 "eth_rxd0",
+					 "eth_mdio_en",
+					 "eth_mdc";
+				function = "ethernet";
+			};
+		};
+
 		i2c_a_pins: i2c-a {
 			mux {
 				groups = "i2c_sda_a", "i2c_sck_a";
-- 
2.19.0
