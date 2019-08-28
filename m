From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 4/6] ARM: dts: mmp2: add camera interfaces
Date: Wed, 28 Aug 2019 09:26:27 +0200
Message-ID: <20190828072629.285760-5-lkundrak@v3.sk>
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

Supported by the mmp-camera driver.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/mmp2.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 21432cb9143f7..68b5470773232 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -170,6 +170,28 @@
 				interrupts = <54>;
 				status = "disabled";
 			};
+
+			camera0: camera@d420a000 {
+				compatible = "marvell,mmp2-ccic";
+				reg = <0xd420a000 0x800>;
+				interrupts = <42>;
+				clocks = <&soc_clocks MMP2_CLK_CCIC0>;
+				clock-names = "axi";
+				#clock-cells = <0>;
+				clock-output-names = "mclk";
+				status = "disabled";
+			};
+
+			camera1: camera@d420a800 {
+				compatible = "marvell,mmp2-ccic";
+				reg = <0xd420a800 0x800>;
+				interrupts = <30>;
+				clocks = <&soc_clocks MMP2_CLK_CCIC1>;
+				clock-names = "axi";
+				#clock-cells = <0>;
+				clock-output-names = "mclk";
+				status = "disabled";
+			};
 		};
 
 		apb@d4000000 {	/* APB */
-- 
2.21.0
