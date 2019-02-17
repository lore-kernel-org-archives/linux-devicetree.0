From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH 3/3] ARM: dts: rk3288 Tinker Board (S) add bluetooth
Date: Sun, 17 Feb 2019 12:15:13 +0000
Message-ID: <20190217121513.22965-4-beagleboard@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, David Summers <beagleboard@davidjohnsummers.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch is to add Bluetooth to the ASUS Tinker Board (S) device
tree.

This patch is more contraversal - so probably view it as a request for
comments.

The reason behind this, is this patch does not currently set Bluetooth
working on the these boards. The problem is that the
bluetooth/hci_h5.c driver, that is used for Realtek serial devices,
depends on ACPI. Unfortantly ACPI can not be enabled on armv7 machines
such as the TB(S). And so the kernel module for the RTL8723BS
Bluetooth can not be loaded.

However this patch is believed to be an accurate description of the
Tinker Board (S) wiring. It is strongly based on the ASUS patch:

https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678

As the Bluetooth is connected via a UART and this is wired into uart0,
this has been described as a SerDev.

The ASUS patch mentions the UART_CTS, but not the _RTS. Now as the
RTL8723BS has both CTS and RTS on the uart, it has been assumed both
are wired into uart0 on the cpu.

The Bluetooth connection has several wake up pins both device and host
and a reset pin. The wiring of these has been described; however how
the kernel driver will use these isn't clear. E.g. should HOST_WAKE be
an interupt?

The main reason for asking for comments, is that when it comes time to
make the changes to the bluetooth uart code, and add compatible flags,
robh has indicated that this will only be accepted with a valid
example. So the code below is that example. So I would like comments
that this approach is valid, which can be used when the later
submission comes. 

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index e1796f340eef..931b4c652fdc 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -481,6 +481,17 @@
 
 &uart0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>, <&uart0_rts>;
+
+	bluetooth {
+		clocks = <&rk808 RK808_CLKOUT1>;
+		reset-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_LOW>;
+		device-wake-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
+		vcc-18-supply = <&vcc_18>;
+		vcc-io-supply = <&vcc_io>;
+	};
 };
 
 &uart1 {
-- 
beagleboard@davidjohnsummers.uk
