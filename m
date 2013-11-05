From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v3 03/11] usb: doc: phy-mxs: update binding for adding anatop
 phandle
Date: Tue, 5 Nov 2013 09:49:35 +0800
Message-ID: <1383616183-10511-4-git-send-email-peter.chen@freescale.com>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, peter.chen@freescale.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add anatop phandle which is used to access anatop registers to
control PHY's power and other USB operations.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 Documentation/devicetree/bindings/usb/mxs-phy.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
index 5835b27..e2d5211 100644
--- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
+++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
@@ -4,10 +4,12 @@ Required properties:
 - compatible: Should be "fsl,imx23-usbphy"
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
+- fsl,anatop: phandle for anatop register, it is only for mx6 SoC serial
 
 Example:
 usbphy1: usbphy@020c9000 {
 	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 	reg = <0x020c9000 0x1000>;
 	interrupts = <0 44 0x04>;
+	fsl,anatop = <&anatop>;
 };
-- 
1.7.1
