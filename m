Return-Path: <SRS0=Uozk=SO=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v6 5/6] ARM: dts: imx7s-warp: add fxas21002c gyroscope
Date: Fri, 12 Apr 2019 17:49:00 +0100
Message-Id: <20190412164901.2321-6-rui.silva@linaro.org>
In-Reply-To: <20190412164901.2321-1-rui.silva@linaro.org>
References: <20190412164901.2321-1-rui.silva@linaro.org>
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
index 613f0a9b319f..568f3289b34c 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -242,6 +242,13 @@
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
 
 &mipi_csi {
-- 
2.21.0
