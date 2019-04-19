From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 5/5] ARM: dts: lpc32xx: use SPDX license identifier
Date: Fri, 19 Apr 2019 23:54:47 +0300
Message-ID: <20190419205447.6357-6-vz@mleia.com>
References: <20190419205447.6357-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190419205447.6357-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>
List-Id: devicetree@vger.kernel.org

Replace GPLv2+ header with the SPDX identifier.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index bc32450de423..7b7ec7b1217b 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * NXP LPC32xx SoC
  *
  * Copyright (C) 2015-2019 Vladimir Zapolskiy <vz@mleia.com>
  * Copyright 2012 Roland Stigge <stigge@antcom.de>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 or later at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
  */
 
 #include <dt-bindings/clock/lpc32xx-clock.h>
-- 
2.20.1
