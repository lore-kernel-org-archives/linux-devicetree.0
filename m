From: Hans Ole Hatzel <hohatzel@jusst.de>
Subject: [PATCH 1/4] ARM: dts: imx7d: cl-som-imx7: fix pinctrl for i2c2
Date: Tue,  4 Dec 2018 12:07:38 +0100
Message-ID: <20181204110741.6943-2-hohatzel@jusst.de>
References: <20181204110741.6943-1-hohatzel@jusst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204110741.6943-1-hohatzel@jusst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, ilya@compulab.co.il, devicetree@vger.kernel.org, linux-imx@nxp.com, fabio.estevam@nxp.com, shawnguo@kernel.org
Cc: Julian Scheel <jscheel@jusst.de>, Hans Ole Hatzel <hohatzel@jusst.de>
List-Id: devicetree@vger.kernel.org

On cl-som-imx7 the I2C2 port is wired to GPIO1 6/7 pads, change the
pinctrl to reflect this. Also disable the internal pull-up, as the
board has appropriate external pull ups in place.
This fixes initialization of all peripherals on the i2c2 bus,
particularly pmic and gpio expander.

Signed-off-by: Hans Ole Hatzel <hohatzel@jusst.de>
Signed-off-by: Julian Scheel <jscheel@jusst.de>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 8bf365d28cac..11bd713b540f 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -249,8 +249,8 @@
 
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
-			MX7D_PAD_I2C2_SDA__I2C2_SDA		0x4000007f
-			MX7D_PAD_I2C2_SCL__I2C2_SCL		0x4000007f
+			MX7D_PAD_LPSR_GPIO1_IO07__I2C2_SDA	0x4000000f
+			MX7D_PAD_LPSR_GPIO1_IO06__I2C2_SCL	0x4000000f
 		>;
 	};
 
-- 
2.19.2
