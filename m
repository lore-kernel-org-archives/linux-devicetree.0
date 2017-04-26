From: <sean.wang@mediatek.com>
Subject: [PATCH v2 28/30] arm: dts: mt7623: enable the nand device on the
 mt7623n nand rfb
Date: Wed, 26 Apr 2017 17:26:12 +0800
Message-ID: <1493198774-4478-29-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

Enable the nand device and setup pinmux on the mt7632m rfb with nand
support.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623n-rfb-nand.dts | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-rfb-nand.dts b/arch/arm/boot/dts/mt7623n-rfb-nand.dts
index 07b3953..06a76fa 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-nand.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-nand.dts
@@ -19,3 +19,91 @@
 	model = "MediaTek MT7623N NAND reference board";
 	compatible = "mediatek,mt7623n-rfb-nand", "mediatek,mt7623n";
 };
+
+&pio {
+	nand_pins_default: nanddefault {
+		pins_dat {
+			pinmux = <MT7623_PIN_111_MSDC0_DAT7_FUNC_NLD7>,
+				 <MT7623_PIN_112_MSDC0_DAT6_FUNC_NLD6>,
+				 <MT7623_PIN_114_MSDC0_DAT4_FUNC_NLD4>,
+				 <MT7623_PIN_118_MSDC0_DAT3_FUNC_NLD3>,
+				 <MT7623_PIN_121_MSDC0_DAT0_FUNC_NLD0>,
+				 <MT7623_PIN_120_MSDC0_DAT1_FUNC_NLD1>,
+				 <MT7623_PIN_113_MSDC0_DAT5_FUNC_NLD5>,
+				 <MT7623_PIN_115_MSDC0_RSTB_FUNC_NLD8>,
+				 <MT7623_PIN_119_MSDC0_DAT2_FUNC_NLD2>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up;
+		};
+
+		pins_we {
+			pinmux = <MT7623_PIN_117_MSDC0_CLK_FUNC_NWEB>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins_ale {
+			pinmux = <MT7623_PIN_116_MSDC0_CMD_FUNC_NALE>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+};
+
+&nandc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_default>;
+	nand@0 {
+		reg = <0>;
+		spare_per_sector = <64>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <12>;
+		nand-ecc-step-size = <1024>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "preloader";
+				reg = <0x0 0x40000>;
+			};
+
+			partition@40000 {
+				label = "uboot";
+				reg = <0x40000 0x80000>;
+			};
+
+			partition@C0000 {
+				label = "uboot-env";
+				reg = <0xC0000 0x40000>;
+			};
+
+			partition@140000 {
+				label = "bootimg";
+				reg = <0x140000 0x2000000>;
+			};
+
+			partition@2140000 {
+				label = "recovery";
+				reg = <0x2140000 0x2000000>;
+			};
+
+			partition@4140000 {
+				label = "rootfs";
+				reg = <0x4140000 0x1000000>;
+			};
+
+			partition@5140000 {
+				label = "usrdata";
+				reg = <0x5140000 0x1000000>;
+			};
+		};
+	};
+};
+
+&bch {
+	status = "okay";
+};
-- 
1.9.1
