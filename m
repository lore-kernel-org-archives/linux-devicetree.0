From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/7] arm/dts: babbage: add device nodes for esdhc
Date: Mon, 14 Mar 2011 22:25:58 +0800
Message-ID: <1300112759-3495-7-git-send-email-shawn.guo@linaro.org>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1300112759-3495-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/babbage.dts |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
index 378cd7d..d1824ab 100644
--- a/arch/arm/boot/dts/babbage.dts
+++ b/arch/arm/boot/dts/babbage.dts
@@ -572,6 +572,20 @@
 		compatible = "simple-bus";
 		ranges = <0x0 0x70000000 0x100000>;
 
+		sdhci@4000 {
+			compatible = "fsl,imx-esdhc", "fsl,esdhc";
+			reg = <0x4000 0x4000>;
+			interrupts = <1>;
+			bus-clock = <&esdhc1_clk>, "esdhc";
+		};
+
+		sdhci@8000 {
+			compatible = "fsl,imx-esdhc", "fsl,esdhc";
+			reg = <0x8000 0x4000>;
+			interrupts = <2>;
+			bus-clock = <&esdhc2_clk>, "esdhc";
+		};
+
 		imx-uart@c000 {
 			compatible = "fsl,imx51-uart";
 			reg = <0xc000 0x1000>;
-- 
1.7.1
