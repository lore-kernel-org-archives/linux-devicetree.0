From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 1/3] ARM: dts: k2g: Add pinctrl support
Date: Thu,  9 Jun 2016 10:26:16 -0500
Message-ID: <1465485978-27910-2-git-send-email-fcooper@ti.com>
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
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Franklin S Cooper Jr <fcooper@ti.com>, Vitaly Andrianov <vitalya@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

From: Vitaly Andrianov <vitalya@ti.com>

Add pinctrl support.

Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 7ff2796..b99e879 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -75,6 +75,13 @@
 		ranges = <0x0 0x0 0x0 0xc0000000>;
 		dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;
 
+		k2g_pinctrl: pinmux@02621000 {
+			compatible = "pinctrl-single";
+			reg = <0x02621000 0x410>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0x001b0007>;
+		};
+
 		uart0: serial@02530c00 {
 			compatible = "ns16550a";
 			current-speed = <115200>;
-- 
2.7.0
