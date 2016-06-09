From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 3/3] ARM: dts: k2g-evm: Add pinmuxing for UART0
Date: Thu,  9 Jun 2016 10:26:18 -0500
Message-ID: <1465485978-27910-4-git-send-email-fcooper@ti.com>
References: <1465485978-27910-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465485978-27910-1-git-send-email-fcooper@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ssantosh@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Franklin S Cooper Jr <fcooper@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

From: Lokesh Vutla <lokeshvutla@ti.com>

Avoid depending on the bootloader or the ROM for configuring the pinmux by
explicitly setting the pinmux here.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index 5bfd9e7..692fcbb 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -27,6 +27,17 @@
 
 };
 
+&k2g_pinctrl {
+	uart0_pins: pinmux_uart0_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x11cc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* uart0_rxd.uart0_rxd */
+			K2G_CORE_IOPAD(0x11d0) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)	/* uart0_txd.uart0_txd */
+		>;
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
-- 
2.7.0
