From: Loc Ho <lho@apm.com>
Subject: [PATCH v5 2/3] clk: arm64: Add DTS clock entry for APM X-Gene Storm
 SoC
Date: Wed, 26 Jun 2013 11:56:10 -0600
Message-ID: <1372269371-22992-3-git-send-email-lho@apm.com>
References: <1372269371-22992-1-git-send-email-lho@apm.com>
 <1372269371-22992-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1372269371-22992-2-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mark.rutland@arm.com
Cc: fkan@apm.com, mturquette@linaro.org, Catalin.Marinas@arm.com, devicetree-discuss@lists.ozlabs.org, Loc Ho <lho@apm.com>, ksankaran@apm.com, vkale@apm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

clk: arm64: Add DTS clock entry for APM X-Gene Storm SoC with reference to
reference, PCP PLL, SoC PLL, and Ethernet clocks.

Signed-off-by: Loc Ho <lho@apm.com>
Signed-off-by: Kumar Sankaran <ksankaran@apm.com>
Signed-off-by: Vinayak Kale <vkale@apm.com>
Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi |   75 ++++++++++++++++++++++++++++++++++++
 1 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index bfdc578..d37d736 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -103,6 +103,81 @@
 		#size-cells = <2>;
 		ranges;
 
+		clocks {
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			refclk: refclk {
+				compatible = "fixed-clock";
+				#clock-cells = <1>;
+				clock-frequency = <100000000>;
+				clock-output-names = "refclk";
+			};
+
+			pcppll: pcppll@17000100 {
+				compatible = "apm,xgene-pcppll-clock";
+				#clock-cells = <1>;
+				clocks = <&refclk 0>;
+				clock-names = "pcppll";
+				reg = <0x0 0x17000100 0x0 0x1000>;
+				clock-output-names = "pcppll";
+				type = <0>;
+			};
+
+			socpll: socpll@17000120 {
+				compatible = "apm,xgene-socpll-clock";
+				#clock-cells = <1>;
+				clocks = <&refclk 0>;
+				clock-names = "socpll";
+				reg = <0x0 0x17000120 0x0 0x1000>;
+				clock-output-names = "socpll";
+				type = <1>;
+			};
+
+			socplldiv2: socplldiv2  {
+				compatible = "fixed-factor-clock";
+				#clock-cells = <1>;
+				clocks = <&socpll 0>;
+				clock-names = "socplldiv2";
+				clock-mult = <1>;
+				clock-div = <2>;
+				clock-output-names = "socplldiv2";
+			};
+
+			qmlclk: qmlclk {
+				compatible = "apm,xgene-device-clock";
+				#clock-cells = <1>;
+				clocks = <&socplldiv2 0>;
+				clock-names = "qmlclk";
+				reg = <0x0 0x1703C000 0x0 0x1000>;
+				reg-names = "csr-reg";
+				clock-output-names = "qmlclk";
+			};
+
+			ethclk: ethclk {
+				compatible = "apm,xgene-device-clock";
+				#clock-cells = <1>;
+				clocks = <&socplldiv2 0>;
+				clock-names = "ethclk";
+				reg = <0x0 0x17000000 0x0 0x1000>;
+				reg-names = "div-reg";
+				divider-offset = <0x238>;
+				divider-width = <0x9>;
+				divider-shift = <0x0>;
+				clock-output-names = "ethclk";
+			};
+
+			eth8clk: eth8clk {
+				compatible = "apm,xgene-device-clock";
+				#clock-cells = <1>;
+				clocks = <&ethclk 0>;
+				clock-names = "eth8clk";
+				reg = <0x0 0x1702C000 0x0 0x1000>;
+				reg-names = "csr-reg";
+				clock-output-names = "eth8clk";
+			};
+		};
+
 		serial0: serial@1c020000 {
 			device_type = "serial";
 			compatible = "ns16550";
-- 
1.5.5
