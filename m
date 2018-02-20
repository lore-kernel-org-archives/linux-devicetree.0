From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH 1/8] ARM: dts: artpec: disable Accelerator Coherency Port
Date: Tue, 20 Feb 2018 18:00:42 +0100
Message-ID: <20180220170049.22809-2-niklas.cassel@axis.com>
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

Accesses via 0x80000000 go through the ACP instead of using the DDR
directly.

Unfortunately the ACP has proven to be the cause of complete system
hangs. Disabling the ACP makes these problems go away.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 2ed11773048d..d9776a97d8ff 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -185,8 +185,7 @@
 		#address-cells = <0x1>;
 		#size-cells = <0x1>;
 		ranges;
-		dma-ranges = <0x80000000 0x00000000 0x40000000>;
-		dma-coherent;
+		dma-ranges;
 
 		ethernet: ethernet@f8010000 {
 			clock-names = "phy_ref_clk", "apb_pclk";
-- 
2.14.2
