From: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Subject: [PATCH v3 3/3] arm: dts: rk3288-tinker.dtsi: Add outline Bluetooth
 support
Date: Sat,  9 Mar 2019 15:39:23 +0000
Message-ID: <20190309153923.22806-3-beagleboard@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190309153923.22806-1-beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch is an outline for bluetooth on the ASUS Tinker Board (S).

Bluetooth is provided my RTL8723BS on these machine, and this is wired
into UART0.

Here this is performed as a SerDev device.

Now as presented, this does not give functioning bluetooth. The
updates needed to the device driver:

https://www.spinics.net/lists/linux-bluetooth/msg78661.html

Haven't yet been accepted. So this device tree hook doesn't yet have
"realtek,rtl8723bs-bt" compatible flag.

It is however still submitted as a patch, as it sets the UART up
correctly. And so basic communciation can be had with the device. This
has been confirmed by Tony McKahan @ Armbian, in particular that the
CTS/RTS is needed.

When Vasily patch is accepted, this will be added as a minor patch on
top of this patch; as this patch gives the pins needed.

The one oddity, is the RESET pin, it is labeled this way on the
schematic. However the hci_h5.c driver calls this ENABLE. Here we have
stuck with the schematic name.

Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index 0ffab1b7c940..d29f5b34d7e6 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -486,6 +486,17 @@
 
 &uart0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>, <&uart0_rts>;
+
+	bluetooth {
+		clocks = <&rk808 RK808_CLKOUT1>;
+		reset-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		device-wake-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
+		vcc-18-supply = <&vcc_18>;
+		vcc-io-supply = <&vcc_io>;
+	};
 };
 
 &uart1 {
-- 
beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
