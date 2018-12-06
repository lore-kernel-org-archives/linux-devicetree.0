From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/9] ARM: dts: imx7d-pico: Do not harcode the memory size
Date: Thu,  6 Dec 2018 08:08:57 -0200
Message-ID: <20181206100905.15053-2-otavio@ossystems.com.br>
References: <20181206100905.15053-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206100905.15053-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Currently the memory size described in dts is 2GB, which is incorrect.

There are 512MB and 1GB versions of imx7d-pico boards, so remove
the hardcoded memory size and let the bootloader pass the correct
value to the kernel.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 arch/arm/boot/dts/imx7d-pico.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
index 934a019f341e..0df68e53e9fa 100644
--- a/arch/arm/boot/dts/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/imx7d-pico.dtsi
@@ -48,9 +48,10 @@
 	model = "Technexion Pico i.MX7D Board";
 	compatible = "technexion,imx7d-pico", "fsl,imx7d";
 
+	/* Will be filled by the bootloader */
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0x80000000 0x80000000>;
+		reg = <0x80000000 0>;
 	};
 
 	reg_ap6212: regulator-ap6212 {
-- 
2.19.2
