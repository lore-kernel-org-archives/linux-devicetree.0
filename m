From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH 3/8] ARM: dts: artpec: remove 0x prefix from clkctrl unit
 address
Date: Tue, 20 Feb 2018 18:00:44 +0100
Message-ID: <20180220170049.22809-4-niklas.cassel@axis.com>
References: <20180220170049.22809-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180220170049.22809-1-niklas.cassel@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-kernel@axis.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove 0x prefix from clkctrl unit address.

This silences the following dtc warning:
Warning (unit_address_format):
 Node /clkctrl@0xf8000000 unit name should not have leading "0x"

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index d9776a97d8ff..f4b39738f1ac 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -98,7 +98,7 @@
 		clock-frequency = <125000000>;
 	};
 
-	clkctrl: clkctrl@0xf8000000 {
+	clkctrl: clkctrl@f8000000 {
 		#clock-cells = <1>;
 		compatible = "axis,artpec6-clkctrl";
 		reg = <0xf8000000 0x48>;
-- 
2.14.2
