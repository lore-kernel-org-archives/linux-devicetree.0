From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/3] ARM: dts: add rk3288 ehci usb devices
Date: Wed, 30 Jul 2014 13:00:11 -0700
Message-ID: <1406750412-15592-3-git-send-email-dianders@chromium.org>
References: <1406750412-15592-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406750412-15592-1-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, sergei.shtylyov@cogentembedded.com, Arnd Bergmann <arnd@arndb.de>, ijc+devicetree@hellion.org.uk, linux-usb@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, galak@codeaurora.org, Sonny Rao <sonnyrao@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Kever Yang <kever.yang@rock-chips.com>

rk3288 has two kind of usb controller; this adds the ehci variant for
host0 and hsic.

At the moment we don't add any phys for these controllers, but the
default settings seem to work OK.

There is a hardware problem in ohci controller which make it
unavailable and host0 controller can only support high-speed devices.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
Changes in v2:
- Kever is now the author
- Node is now named usb

 arch/arm/boot/dts/rk3288.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 3ef8951..e7cb008 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -251,6 +251,26 @@
 		status = "disabled";
 	};
 
+	usb_host0_ehci: usb@ff500000 {
+		compatible = "generic-ehci";
+		reg = <0xff500000 0x100>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_USBHOST0>;
+		clock-names = "usbhost";
+		status = "disabled";
+	};
+
+	/* NOTE: ohci@ff520000 doesn't actually work on hardware */
+
+	usb_hsic: usb@ff5c0000 {
+		compatible = "generic-ehci";
+		reg = <0xff5c0000 0x100>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HSIC>;
+		clock-names = "usbhost";
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@ffc01000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
2.0.0.526.g5318336
