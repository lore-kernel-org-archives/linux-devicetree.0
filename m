From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 5/5] ARM: dts: da850-lcdk: Enable the analog mic input
Date: Wed, 19 Dec 2018 13:47:27 +0200
Message-ID: <20181219114727.6865-6-peter.ujfalusi@ti.com>
References: <20181219114727.6865-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181219114727.6865-1-peter.ujfalusi@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nsekhar@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The LCDK board have additional analog mic jack.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850-lcdk.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index 3a2fa6e035a3..26f453dc8370 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -74,12 +74,16 @@
 		simple-audio-card,name = "DA850-OMAPL138 LCDK";
 		simple-audio-card,widgets =
 			"Line", "Line In",
-			"Line", "Line Out";
+			"Line", "Line Out",
+			"Microphone", "Mic Jack";
 		simple-audio-card,routing =
 			"LINE1L", "Line In",
 			"LINE1R", "Line In",
 			"Line Out", "LLOUT",
-			"Line Out", "RLOUT";
+			"Line Out", "RLOUT",
+			"MIC3L", "Mic Jack",
+			"MIC3R", "Mic Jack",
+			"Mic Jack", "Mic Bias";
 		simple-audio-card,format = "dsp_b";
 		simple-audio-card,bitclock-master = <&link0_codec>;
 		simple-audio-card,frame-master = <&link0_codec>;
@@ -250,6 +254,8 @@
 		#sound-dai-cells = <0>;
 		compatible = "ti,tlv320aic3106";
 		reg = <0x18>;
+		adc-settle-ms = <40>;
+		ai3x-micbias-vg = <1>;		/* 2.0V */
 		status = "okay";
 
 		/* Regulators */
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
