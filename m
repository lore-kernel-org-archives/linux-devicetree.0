From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 09/13] ARM: dts: lpc32xx: phy3250: add unit address to memory
 device node
Date: Tue, 29 Jan 2019 21:20:45 +0200
Message-ID: <20190129192049.11223-10-vz@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The change adds a unit address to memory device node, the issue was
reported as a unit_address_vs_reg warning by dtc.

Root device node properties #address-cells and #size-cells were
removed as inherited from lpc32xx.dtsi.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index aff72f14ad83..ebd19258e22b 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -1,6 +1,7 @@
 /*
  * PHYTEC phyCORE-LPC3250 board
  *
+ * Copyright (C) 2015-2019 Vladimir Zapolskiy <vz@mleia.com>
  * Copyright 2012 Roland Stigge <stigge@antcom.de>
  *
  * The code contained herein is licensed under the GNU General Public
@@ -17,10 +18,8 @@
 / {
 	model = "PHYTEC phyCORE-LPC3250 board based on NXP LPC3250";
 	compatible = "phytec,phy3250", "nxp,lpc3250";
-	#address-cells = <1>;
-	#size-cells = <1>;
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x4000000>;
 	};
-- 
2.20.1
