From: ahaslam@baylibre.com
Subject: [PATCH/RFT v2 05/17] ARM: DTS: da850: Add usb phy node
Date: Mon, 24 Oct 2016 18:46:22 +0200
Message-ID: <20161024164634.4330-6-ahaslam@baylibre.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161024164634.4330-1-ahaslam@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregkh@linuxfoundation.org, johan@kernel.org, robh+dt@kernel.org, nsekhar@ti.com, stern@rowland.harvard.edu, khilman@baylibre.com, sshtylyov@ru.mvista.com, david@lechnology.com, manjunath.goudar@linaro.org, broonie@kernel.org, abailon@baylibre.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: David Lechner <david@lechnology.com>

Add a node for the new usb phy driver.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/da850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 6bbf20d..33fcdce 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -376,6 +376,11 @@
 					>;
 			status = "disabled";
 		};
+		usb_phy: usb-phy {
+			compatible = "ti,da830-usb-phy";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
 		gpio: gpio@226000 {
 			compatible = "ti,dm6441-gpio";
 			gpio-controller;
-- 
1.9.1
