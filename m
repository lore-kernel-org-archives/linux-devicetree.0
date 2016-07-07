From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v4 2/5] ARM: dts: vfxxx: Add On-Chip ROM node for Vybrid
Date: Thu,  7 Jul 2016 12:09:27 +0530
Message-ID: <1f0d02081aaf80c953d81fb63d75040470e06fba.1467872014.git.maitysanchayan@gmail.com>
References: <cover.1467872014.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1467872014.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1467872014.git.maitysanchayan@gmail.com>
References: <cover.1467872014.git.maitysanchayan@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan@agner.ch, Sanchayan Maity <maitysanchayan@gmail.com>, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a device tree node for the On-Chip ROM on Vybrid.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 0e34d44..6c5222e 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -91,6 +91,11 @@
 		interrupt-parent = <&mscm_ir>;
 		ranges;
 
+		ocrom: ocrom@00000000 {
+			compatible = "fsl,vf610-ocrom", "syscon";
+			reg = <0x00000000 0x18000>;
+		};
+
 		aips0: aips-bus@40000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
-- 
2.9.0
