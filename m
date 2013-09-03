From: Fugang Duan <B38611@freescale.com>
Subject: [PATCH v2 2/4] ARM: dts: add fec phy reset for imx6sl evk board
Date: Tue, 3 Sep 2013 12:26:23 +0800
Message-ID: <1378182385-9205-3-git-send-email-B38611@freescale.com>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378182385-9205-1-git-send-email-B38611@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add fec phy gpio reset for imx6sl evk board. imx6sl evk board
use GPIO4_21 to do phy reset, so add phy-reset-gpios and
phy-reset-duration propery initial for fec device node.

Signed-off-by: Fugang Duan  <B38611@freescale.com>
---
 arch/arm/boot/dts/imx6sl-evk.dts |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/imx6sl-evk.dts
index 2886a59..c4d32a5 100644
--- a/arch/arm/boot/dts/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/imx6sl-evk.dts
@@ -23,6 +23,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec_1>;
 	phy-mode = "rmii";
+	phy-reset-gpios = <&gpio4 21 0>; /* GPIO4_21 */
+	phy-reset-duration = <1>;
 	status = "okay";
 };
 
@@ -38,6 +40,7 @@
 				MX6SL_PAD_SD2_DAT7__GPIO5_IO00    0x17059
 				MX6SL_PAD_SD2_DAT6__GPIO4_IO29    0x17059
 				MX6SL_PAD_REF_CLK_32K__GPIO3_IO22 0x17059
+				MX6SL_PAD_FEC_TX_CLK__GPIO4_IO21  0x80000000
 			>;
 		};
 	};
-- 
1.7.1
