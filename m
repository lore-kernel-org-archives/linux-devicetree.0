From: <tthayer@opensource.altera.com>
Subject: [PATCH 4/4] dts, altera: Arria10 SDRAM EDAC DTS additions.
Date: Wed, 13 May 2015 16:49:47 -0500
Message-ID: <1431553787-27741-5-git-send-email-tthayer@opensource.altera.com>
References: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Support for the Arria10 SDRAM EDAC is added to the device tree.
Update the bindings document for the new match string.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 .../bindings/arm/altera/socfpga-sdram-edac.txt     |    2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
index d0ce01d..f5ad0ff 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
@@ -2,7 +2,7 @@ Altera SOCFPGA SDRAM Error Detection & Correction [EDAC]
 The EDAC accesses a range of registers in the SDRAM controller.
 
 Required properties:
-- compatible : should contain "altr,sdram-edac";
+- compatible : should contain "altr,sdram-edac" or "altr,sdram-edac-a10"
 - altr,sdr-syscon : phandle of the sdr module
 - interrupts : Should contain the SDRAM ECC IRQ in the
 	appropriate format for the IRQ controller.
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index e121661..70da147 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -524,6 +524,17 @@
 			status = "disabled";
 		};
 
+		sdr: sdr@ffc25000 {
+			compatible = "syscon";
+			reg = <0xffcfb100 0x80>;
+		};
+
+		sdramedac {
+			compatible = "altr,sdram-edac-a10";
+			altr,sdr-syscon = <&sdr>;
+			interrupts = <0 2 4>, <0 0 4>;
+		};
+
 		L2: l2-cache@fffff000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xfffff000 0x1000>;
-- 
1.7.9.5
