From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 02/20] arm64: dts: marvell: Add AP806-dual missing CPU clocks
Date: Tue,  6 Aug 2019 16:54:42 +0200
Message-ID: <20190806145500.24109-3-miquel.raynal@bootlin.com>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CPU clocks have been added to AP806-quad but not to the -dual
variant.

Fixes: e043bbd61e01 ("arm64: dts: marvell: Add cpu clock node on Armada 7K/8K")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
index 9024a2d9db07..62ae016ee6aa 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
@@ -21,6 +21,7 @@
 			reg = <0x000>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			clocks = <&cpu_clk 0>;
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
@@ -28,6 +29,7 @@
 			reg = <0x001>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
+			clocks = <&cpu_clk 0>;
 		};
 	};
 };
-- 
2.20.1
