From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2] ARM: dts: imx53-qsb: disable 1.2GHz OPP
Date: Wed, 12 Sep 2018 08:23:01 +0200
Message-ID: <20180912062301.3972-1-s.hauer@pengutronix.de>
References: <20180910125056.30813-1-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180910125056.30813-1-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The maximum CPU frequency for the i.MX53 QSB is 1GHz, so disable the
1.2GHz OPP. This makes the board work again with configs that have
cpufreq enabled like imx_v6_v7_defconfig on which the board stopped
working with the addition of cpufreq-dt support.

Fixes: 791f416608 ("ARM: dts: imx53: add cpufreq-dt support")

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Changes since v1:
- rephrase commit message

arch/arm/boot/dts/imx53-qsb-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-qsb-common.dtsi b/arch/arm/boot/dts/imx53-qsb-common.dtsi
index 7423d462d1e4..50dde84b72ed 100644
--- a/arch/arm/boot/dts/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/imx53-qsb-common.dtsi
@@ -123,6 +123,17 @@
 	};
 };
 
+&cpu0 {
+	/* CPU rated to 1GHz, not 1.2GHz as per the default settings */
+	operating-points = <
+		/* kHz   uV */
+		166666  850000
+		400000  900000
+		800000  1050000
+		1000000 1200000
+	>;
+};
+
 &esdhc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_esdhc1>;
-- 
2.18.0
