Return-Path: <SRS0=1fni=QL=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 5/5] ARM: dts: imx7s-warp: add fxas2100x gyroscope
Date: Mon,  4 Feb 2019 17:00:12 +0000
Message-Id: <20190204170012.13617-6-rui.silva@linaro.org>
In-Reply-To: <20190204170012.13617-1-rui.silva@linaro.org>
References: <20190204170012.13617-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add entry to enable the fxas2100x in the warp7 board

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s-warp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index 58d1a89ee3e3..47ff43cd229e 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -238,6 +238,11 @@
 		compatible = "fsl,mpl3115";
 		reg = <0x60>;
 	};
+
+	fxas2100x@20 {
+		compatible = "nxp,fxas2100x";
+		reg = <0x20>;
+	};
 };
 
 &sai1 {
-- 
2.20.1
