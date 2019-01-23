From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFCv1 1/3] phy: meson8b-usb2: Enable otg phy controller on Meson8b
 SoCs
Date: Wed, 23 Jan 2019 15:12:07 +0000
Message-ID: <20190123151209.2080-2-linux.amoon@gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190123151209.2080-1-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Meson8b support two USB phy controller, one with otg port and
other usb host controller. USB OTG controller ie. otg port can
be used to power on board or host port for usb device.
Changes enable usb otg host controller when dr_mode is set to otg.
Currenly otg port can be used to power on the board.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch in this series.
--TOTO enable OTG port to work as host.
--Currently we can power on the board from this OTG port.

/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 480M
        |__ Port 3: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 9c01b7e19b06..1333c77e9172 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -109,6 +109,7 @@
 
 #define RESET_COMPLETE_TIME				500
 #define ACA_ENABLE_COMPLETE_TIME			50
+#define DCD_ENABLE_COMPLETE_TIME			10
 
 struct phy_meson8b_usb2_priv {
 	void __iomem		*regs;
@@ -188,6 +189,20 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 
 		udelay(ACA_ENABLE_COMPLETE_TIME);
 
+		if (phy_meson8b_usb2_read(priv, REG_ADP_BC) &
+			REG_ADP_BC_ACA_PIN_FLOAT) {
+			dev_warn(&phy->dev, "USB ID detect failed!\n");
+			clk_disable_unprepare(priv->clk_usb);
+			clk_disable_unprepare(priv->clk_usb_general);
+			return -EINVAL;
+		}
+	} else if (priv->dr_mode == USB_DR_MODE_OTG) {
+		phy_meson8b_usb2_mask_bits(priv, REG_ADP_BC,
+					   REG_ADP_BC_DCD_ENABLE,
+					   REG_ADP_BC_DCD_ENABLE);
+
+		udelay(DCD_ENABLE_COMPLETE_TIME);
+
 		if (phy_meson8b_usb2_read(priv, REG_ADP_BC) &
 			REG_ADP_BC_ACA_PIN_FLOAT) {
 			dev_warn(&phy->dev, "USB ID detect failed!\n");
-- 
2.20.1
