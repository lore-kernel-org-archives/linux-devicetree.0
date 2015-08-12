From: Dongsheng Wang <dongsheng.wang@freescale.com>
Subject: [PATCH v3 2/2] ARM: dts: ls1021a: add wakeup device ftm0 node for
 ls1021a
Date: Wed, 12 Aug 2015 12:01:01 +0800
Message-ID: <1439352061-14656-2-git-send-email-dongsheng.wang@freescale.com>
References: <1439352061-14656-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1439352061-14656-1-git-send-email-dongsheng.wang@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, Wang Dongsheng <dongsheng.wang@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alison.wang@freescale.com
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang@freescale.com>

Add ftm0 node, cause of ftm0 can be set as a alarm before system going
to deep sleep.

Signed-off-by: Wang Dongsheng <dongsheng.wang@freescale.com>
Signed-off-by: Alison Wang <alison.wang@freescale.com>
---
*V3*
- No changes.

*V2*
- Add my SoB.
- Use "ARM:" as subject prefix.

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 9c5e16b..f14731b 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -75,6 +75,10 @@
 	};
 };
 
+&ftm0 {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index c70bb27..7e9e122 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -332,6 +332,14 @@
 			status = "disabled";
 		};
 
+		ftm0: ftm0@29d0000 {
+			compatible = "fsl,ftm-alarm";
+			reg = <0x0 0x29d0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+			status = "disabled";
+		};
+
 		wdog0: watchdog@2ad0000 {
 			compatible = "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
-- 
2.1.0.27.g96db324
