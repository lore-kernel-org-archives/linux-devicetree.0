From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm: zynq: Add mmc alias for zc702/zc706/zed/zybo
Date: Wed, 17 Jan 2018 15:38:18 +0100
Message-ID: <56003f03e66edecb64298317120d4a37b9944a3f.1516199896.git.michal.simek@xilinx.com>
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
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, monstr@monstr.eu, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Russell King <linux@armlinux.org.uk>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add missing mmc alias.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-zc702.dts | 1 +
 arch/arm/boot/dts/zynq-zc706.dts | 1 +
 arch/arm/boot/dts/zynq-zed.dts   | 1 +
 arch/arm/boot/dts/zynq-zybo.dts  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index dd1a731ae24c..46f14422b2e7 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -23,6 +23,7 @@
 		ethernet0 = &gem0;
 		i2c0 = &i2c0;
 		serial0 = &uart1;
+		mmc0 = &sdhci0;
 	};
 
 	memory@0 {
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 8a0c2ff4c5eb..9224b45f9418 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -23,6 +23,7 @@
 		ethernet0 = &gem0;
 		i2c0 = &i2c0;
 		serial0 = &uart1;
+		mmc0 = &sdhci0;
 	};
 
 	memory@0 {
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
index 1015edd69ff3..c8fad19e07dd 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -22,6 +22,7 @@
 	aliases {
 		ethernet0 = &gem0;
 		serial0 = &uart1;
+		mmc0 = &sdhci0;
 	};
 
 	memory@0 {
diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
index c131dc45e4eb..b0ad94cb9e4a 100644
--- a/arch/arm/boot/dts/zynq-zybo.dts
+++ b/arch/arm/boot/dts/zynq-zybo.dts
@@ -22,6 +22,7 @@
 	aliases {
 		ethernet0 = &gem0;
 		serial0 = &uart1;
+		mmc0 = &sdhci0;
 	};
 
 	memory@0 {
-- 
1.9.1
