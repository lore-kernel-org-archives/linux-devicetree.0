From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] arm64: dts: marvell: Change core numbering in AP806
 thermal-node
Date: Fri,  8 Mar 2019 23:28:09 +0100
Message-ID: <20190308222810.5926-2-miquel.raynal@bootlin.com>
References: <20190308222810.5926-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190308222810.5926-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

When adding thermal nodes, the CPUs have been named from 1 to 4 while
usually everywhere else they are referred as 0-3. Let's change this to
be consistent with later changes when we will use CPUfreq and CPU
phandles as cooling devices to avoid inconsistencies in the nodes
numbering.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 2d12b3ca1853..1029ff7d7c49 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -307,7 +307,7 @@
 			cooling-maps { };
 		};
 
-		ap_thermal_cpu1: ap-thermal-cpu1 {
+		ap_thermal_cpu0: ap-thermal-cpu0 {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
@@ -317,7 +317,7 @@
 			cooling-maps { };
 		};
 
-		ap_thermal_cpu2: ap-thermal-cpu2 {
+		ap_thermal_cpu1: ap-thermal-cpu1 {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
@@ -327,7 +327,7 @@
 			cooling-maps { };
 		};
 
-		ap_thermal_cpu3: ap-thermal-cpu3 {
+		ap_thermal_cpu2: ap-thermal-cpu2 {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
@@ -337,7 +337,7 @@
 			cooling-maps { };
 		};
 
-		ap_thermal_cpu4: ap-thermal-cpu4 {
+		ap_thermal_cpu3: ap-thermal-cpu3 {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
-- 
2.19.1
