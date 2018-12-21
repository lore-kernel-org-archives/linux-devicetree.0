From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH v2 1/1] arm64: dts: marvell: armada-ap806: reserve PSCI area
Date: Fri, 21 Dec 2018 17:45:03 +0100
Message-ID: <20181221164503.5128-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>, Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

The memory area [0x4000000-0x4200000[ is occupied by the PSCI firmware. Any
attempt to access it from Linux leads to an immediate crash.

So let's make the same memory reservation as the vendor kernel.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
v2
	Move the change from armada-8040-mcbin.dts to armada-ap806.dtsi.
	I only have a MACCHIATObin for testing but
	https://github.com/MarvellEmbeddedProcessors/linux-marvell
	has the reservation in that file.
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 7d94c1fa592a..f8dafef83db0 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -28,6 +28,17 @@
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		psci-area@4000000 {
+			reg = <0x0 0x4000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
 	ap806 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.19.2
