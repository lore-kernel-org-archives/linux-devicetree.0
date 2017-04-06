From: Jagan Teki <jagan@openedev.com>
Subject: [PATCH v3 5/9] ARM: dts: imx6qdl-icore-rqs: Replace to use
 simple-audio-card
Date: Thu,  6 Apr 2017 23:32:11 +0530
Message-ID: <1491501735-1649-6-git-send-email-jagan@openedev.com>
References: <1491501735-1649-1-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1491501735-1649-1-git-send-email-jagan@openedev.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@amarulasolutions.com>

This patch replace fsl,imx-audio-sgtl5000 and use simple-audio-card
for Engicam i.CoreM6 RQS QDL platform boards.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- Newly added patch

 arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
index d24e531..0e79a5b 100644
--- a/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
@@ -120,16 +120,28 @@
 	};
 
 	sound {
-		compatible = "fsl,imx-audio-sgtl5000";
-		model = "imx-audio-sgtl5000";
-		ssi-controller = <&ssi1>;
-		audio-codec = <&sgtl5000>;
-		audio-routing =
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx6qdl-icore-sgtl5000";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Line", "Line In",
+			"Line", "Line Out",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
 			"MIC_IN", "Mic Jack",
 			"Mic Jack", "Mic Bias",
 			"Headphone Jack", "HP_OUT";
-		mux-int-port = <1>;
-		mux-ext-port = <4>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&ssi1>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&sgtl5000>;
+		};
 	};
 };
 
-- 
1.9.1
