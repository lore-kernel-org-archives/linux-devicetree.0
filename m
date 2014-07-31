From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 5/6] ARM: DTS: da850-evm: Add node for tlv320aic3106 codec
Date: Thu, 31 Jul 2014 13:18:53 +0300
Message-ID: <1406801934-23334-6-git-send-email-peter.ujfalusi@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nsekhar@ti.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, linux@arm.linux.org.uk, pawel.moll@arm.com, khilman@deeprootsystems.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The board uses aic3106 for audio.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850-evm.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 09118c72e83f..b9ef2be0b145 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -51,6 +51,20 @@
 			tps: tps@48 {
 				reg = <0x48>;
 			};
+			tlv320aic3106: tlv320aic3106@1b {
+				#sound-dai-cells = <0>;
+				compatible = "ti,tlv320aic3106";
+				reg = <0x18>;
+				status = "okay";
+
+				/* Regulators */
+				IOVDD-supply = <&vdcdc2_reg>;
+				/* Derived from VBAT: Baseboard 3.3V / 1.8V */
+				AVDD-supply = <&vbat>;
+				DRVDD-supply = <&vbat>;
+				DVDD-supply = <&vbat>;
+			};
+
 		};
 		wdt: wdt@1c21000 {
 			status = "okay";
-- 
2.0.2
