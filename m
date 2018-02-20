From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v5 5/5] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Tue, 20 Feb 2018 14:19:35 +0200
Message-ID: <a6d59692dc4847e0b1639a26542e28c95ad5240f.1519128054.git.baruch@tkos.co.il>
References: <cover.1519128054.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1519128054.git.baruch@tkos.co.il>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a description of the RPi3 GPIO expander that the VC4 firmware controls.

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v5:
  * Drop the 'firmware' property

v4:
  * Move the gpio node under the firmware node
  * Rename the gpio node to plain 'gpio'
  * Add Stefan's ack

v3:
  * List GPIO names one per line.

v2:
  * Move GPIO expander node out of the soc container
  * Rename compatible string
  * Add gpio-line-names property
---
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index 3e4ed7c5b0b3..0b31d995a066 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -25,6 +25,23 @@
 	};
 };
 
+&firmware {
+	expgpio: gpio {
+		compatible = "raspberrypi,firmware-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "BT_ON",
+				  "WL_ON",
+				  "STATUS_LED",
+				  "LAN_RUN",
+				  "HPD_N",
+				  "CAM_GPIO0",
+				  "CAM_GPIO1",
+				  "PWR_LOW_N";
+		status = "okay";
+	};
+};
+
 /* uart0 communicates with the BT module */
 &uart0 {
 	pinctrl-names = "default";
-- 
2.16.1
