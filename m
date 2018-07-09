From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 4/8] ARM: dts: imx6qdl-apalis/-colibri: disable read-only
 switch
Date: Mon,  9 Jul 2018 17:48:44 +0200
Message-ID: <20180709154848.5401-4-stefan@agner.ch>
References: <20180709154848.5401-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180709154848.5401-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, maitysanchayan@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use the disable-wp to indicate that Apalis and Colibri iMX6 do not
make use of the native write-protect signal available on the i.MX 6
SoCs. This prevents warnings:
  mmc0: host does not support reading read-only switch, assuming write-enable

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6qdl-apalis.dtsi  | 2 ++
 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 55bcea245df6..f9bacc9ff2b6 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -457,6 +457,7 @@
 	pinctrl-0 = <&pinctrl_usdhc1_4bit &pinctrl_usdhc1_8bit>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
+	disable-wp;
 	no-1-8-v;
 	status = "disabled";
 };
@@ -467,6 +468,7 @@
 	pinctrl-0 = <&pinctrl_usdhc2>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <4>;
+	disable-wp;
 	no-1-8-v;
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index bb44829dacbe..8ae17fdf6cf6 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -387,6 +387,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc1 &pinctrl_mmc_cd>;
 	cd-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>; /* MMCD */
+	disable-wp;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <4>;
 	no-1-8-v;
-- 
2.18.0
