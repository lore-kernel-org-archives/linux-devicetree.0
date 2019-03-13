Return-Path: <SRS0=ezLt=RQ=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 5/6] ARM: dts: imx7s-warp: add fxas21002c gyroscope
Date: Wed, 13 Mar 2019 18:40:01 +0000
Message-Id: <20190313184002.2501-6-rui.silva@linaro.org>
In-Reply-To: <20190313184002.2501-1-rui.silva@linaro.org>
References: <20190313184002.2501-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add entry to enable the fxas21002c gyroscope in the warp7 board.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s-warp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index 58d1a89ee3e3..bf853707b104 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -238,6 +238,13 @@
 		compatible = "fsl,mpl3115";
 		reg = <0x60>;
 	};
+
+	gyroscope@20 {
+		compatible = "nxp,fxas21002c";
+		reg = <0x20>;
+		vdd-supply = <&reg_peri_3p15v>;
+		vddio-supply = <&reg_peri_3p15v>;
+	};
 };
 
 &sai1 {
-- 
2.20.1
