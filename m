From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 2/3] ARM: dts: rockchip: rock2: Setup usb vbus-supply
Date: Wed,  5 Apr 2017 16:06:11 +0200
Message-ID: <20170405140613.4444-3-sjoerd.simons@collabora.co.uk>
References: <20170405140613.4444-1-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170405140613.4444-1-sjoerd.simons@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Youn <johnyoun@synopsys.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that the rockchip usb phy has a vbus-supply property use that to
control the vbus regulator on rock2.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---

 arch/arm/boot/dts/rk3288-rock2-square.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts b/arch/arm/boot/dts/rk3288-rock2-square.dts
index a23a94811be8..8ed25e9f60bc 100644
--- a/arch/arm/boot/dts/rk3288-rock2-square.dts
+++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
@@ -125,10 +125,6 @@
 		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
-		/* Always on as the rockchip usb phy doesn't have a vbus-supply
-		 * property
-		 */
-		regulator-always-on;
 		regulator-name = "vcc_host";
 	};
 
@@ -279,6 +275,10 @@
 	status = "okay";
 };
 
+&usbphy1 {
+	vbus-supply = <&vcc_usb_host>;
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
-- 
2.11.0
