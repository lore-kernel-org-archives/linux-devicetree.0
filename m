From: Michael Heimpold <michael.heimpold@i2se.com>
Subject: [PATCH v4 2/9] ARM: dts: imx28: rename mmc2_sck_cfg
Date: Thu,  9 Feb 2017 08:42:42 +0100
Message-ID: <1486626169-20022-3-git-send-email-michael.heimpold@i2se.com>
References: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, Michael Heimpold <michael.heimpold@i2se.com>, fabio.estevam@nxp.com, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch renames mmc2_sck_cfg in order to prepare for an alternative
muxing setup.

Signed-off-by: Michael Heimpold <michael.heimpold@i2se.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/imx28-m28cu3.dts | 2 +-
 arch/arm/boot/dts/imx28.dtsi       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-m28cu3.dts b/arch/arm/boot/dts/imx28-m28cu3.dts
index 2df63be..bb53294 100644
--- a/arch/arm/boot/dts/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/imx28-m28cu3.dts
@@ -57,7 +57,7 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&mmc2_4bit_pins_a
 					     &mmc2_cd_cfg
-					     &mmc2_sck_cfg>;
+					     &mmc2_sck_cfg_a>;
 				bus-width = <4>;
 				vmmc-supply = <&reg_vddio_sd1>;
 				status = "okay";
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index bc5cf41..857ca37 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -604,7 +604,8 @@
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
-				mmc2_sck_cfg: mmc2-sck-cfg {
+				mmc2_sck_cfg_a: mmc2-sck-cfg@0 {
+					reg = <0>;
 					fsl,pinmux-ids = <
 						MX28_PAD_SSP0_DATA7__SSP2_SCK
 					>;
-- 
2.6.1
