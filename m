From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 06/13] ARM: dts: lpc32xx: remove inclusion of deprecated
 skeleton.dtsi
Date: Tue, 29 Jan 2019 21:20:42 +0200
Message-ID: <20190129192049.11223-7-vz@mleia.com>
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

Inclusion of skeleton.dtsi into DTS files is deprecated since
commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
as deprecated").

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 9ad3df11db0d..d27a0a722ad5 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -1,6 +1,7 @@
 /*
  * NXP LPC32xx SoC
  *
+ * Copyright (C) 2015-2019 Vladimir Zapolskiy <vz@mleia.com>
  * Copyright 2012 Roland Stigge <stigge@antcom.de>
  *
  * The code contained herein is licensed under the GNU General Public
@@ -11,12 +12,13 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
-#include "skeleton.dtsi"
-
 #include <dt-bindings/clock/lpc32xx-clock.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
 	compatible = "nxp,lpc3220";
 	interrupt-parent = <&mic>;
 
-- 
2.20.1
