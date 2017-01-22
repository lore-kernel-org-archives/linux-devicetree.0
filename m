From: Michael Heimpold <mhei@heimpold.de>
Subject: [PATCH v2 1/9] ARM: dts: imx28: add alternative pinmuxing for mmc2
Date: Sun, 22 Jan 2017 23:22:36 +0100
Message-ID: <1485123764-14754-2-git-send-email-mhei@heimpold.de>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, Michael Heimpold <michael.heimpold@i2se.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Michael Heimpold <michael.heimpold@i2se.com>

Signed-off-by: Michael Heimpold <michael.heimpold@i2se.com>
---
 arch/arm/boot/dts/imx28.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 3aabf65..bc5cf41 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -581,6 +581,22 @@
 					fsl,pull-up = <MXS_PULL_ENABLE>;
 				};
 
+				mmc2_4bit_pins_b: mmc2-4bit@1 {
+					reg = <1>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SSP2_SCK__SSP2_SCK
+						MX28_PAD_SSP2_MOSI__SSP2_CMD
+						MX28_PAD_SSP2_MISO__SSP2_D0
+						MX28_PAD_SSP2_SS0__SSP2_D3
+						MX28_PAD_SSP2_SS1__SSP2_D1
+						MX28_PAD_SSP2_SS2__SSP2_D2
+						MX28_PAD_AUART1_RX__SSP2_CARD_DETECT
+					>;
+					fsl,drive-strength = <MXS_DRIVE_8mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_ENABLE>;
+				};
+
 				mmc2_cd_cfg: mmc2-cd-cfg {
 					fsl,pinmux-ids = <
 						MX28_PAD_AUART1_RX__SSP2_CARD_DETECT
-- 
2.7.4
