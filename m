From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/5] ARM64: dts: meson-gxbb-odroidc2: add reset for the
 ethernet PHY
Date: Sat,  3 Dec 2016 00:47:36 +0100
Message-ID: <20161202234739.22929-3-martin.blumenstingl@googlemail.com>
References: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This resets the ethernet PHY during boot to get the PHY into a "clean"
state. While here also specify the phy-handle of the ethmac node to
make the PHY configuration similar to the one we have on GXL devices.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 238fbea..cbaf024 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -143,10 +143,25 @@
 	pinctrl-names = "default";
 };
 
+&mdio0 {
+	ethernet_phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
+
+	phy-handle = <&ethernet_phy0>;
+
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+
+	phy-mode = "rgmii";
 };
 
 &ir {
-- 
2.10.2
