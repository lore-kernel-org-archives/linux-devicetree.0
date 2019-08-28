From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 5/6] ARM: dts: mmp2: specify reg-shift for the UARTs
Date: Wed, 28 Aug 2019 09:26:28 +0200
Message-ID: <20190828072629.285760-6-lkundrak@v3.sk>
References: <20190828072629.285760-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828072629.285760-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This makes the 8250_of driver happy. There are two more drivers in the
tree that bind to mrvl,mmp-uart compatibles: pxa and 8250_pxa and
neither of them requires the reg-shift property, assuming it's always 2.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/mmp2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 68b5470773232..6a2f072c1d0a8 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -214,6 +214,7 @@
 				interrupts = <27>;
 				clocks = <&soc_clocks MMP2_CLK_UART0>;
 				resets = <&soc_clocks MMP2_CLK_UART0>;
+				reg-shift = <2>;
 				status = "disabled";
 			};
 
@@ -223,6 +224,7 @@
 				interrupts = <28>;
 				clocks = <&soc_clocks MMP2_CLK_UART1>;
 				resets = <&soc_clocks MMP2_CLK_UART1>;
+				reg-shift = <2>;
 				status = "disabled";
 			};
 
@@ -232,6 +234,7 @@
 				interrupts = <24>;
 				clocks = <&soc_clocks MMP2_CLK_UART2>;
 				resets = <&soc_clocks MMP2_CLK_UART2>;
+				reg-shift = <2>;
 				status = "disabled";
 			};
 
@@ -241,6 +244,7 @@
 				interrupts = <46>;
 				clocks = <&soc_clocks MMP2_CLK_UART3>;
 				resets = <&soc_clocks MMP2_CLK_UART3>;
+				reg-shift = <2>;
 				status = "disabled";
 			};
 
-- 
2.21.0
