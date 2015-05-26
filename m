From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v4 1/2] ARM: dts: vfxxx: Add OCOTP and OCROM nodes
Date: Tue, 26 May 2015 17:06:46 +0530
Message-ID: <242cf9cea5244a6d783928e1f4783dead2aa32d5.1432637313.git.maitysanchayan@gmail.com>
References: <cover.1432637313.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1432637313.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1432637313.git.maitysanchayan@gmail.com>
References: <cover.1432637313.git.maitysanchayan@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, shawn.guo@linaro.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, Sanchayan Maity <maitysanchayan@gmail.com>, linux-arm-kernel@lists.infradead.org, stefan@agner.ch, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a device tree node for the On-Chip One Time Programmable
Controller (OCOTP) and the On-Chip ROM.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 2f4b04d..ed9b6b8 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -56,6 +56,13 @@
 		compatible = "simple-bus";
 		interrupt-parent = <&mscm_ir>;
 		ranges;
+		ocotp-cfg = <&ocotp 0x410 0x420>;
+		rom-revision = <&ocrom 0x80>;
+
+		ocrom: ocrom {
+			compatible = "fsl,vf610-ocrom", "syscon";
+			reg = <0x00000000 0x18000>;
+		};
 
 		aips0: aips-bus@40000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
@@ -403,6 +410,11 @@
 				status = "disabled";
 			};
 
+			ocotp: ocotp@400a5000 {
+				compatible = "fsl,vf610-ocotp", "syscon";
+				reg = <0x400a5000 0x1000>;
+			};
+
 			snvs0: snvs@400a7000 {
 			    compatible = "fsl,sec-v4.0-mon", "simple-bus";
 				#address-cells = <1>;
-- 
2.4.1
