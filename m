From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 2/3] ls1043ardb: add ds26522 node to dts
Date: Wed, 28 Sep 2016 11:40:37 +0800
Message-ID: <1475034038-7217-2-git-send-email-qiang.zhao@nxp.com>
References: <1475034038-7217-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475034038-7217-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

add ds26522 node to fsl-ls1043a-rdb.dts

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 4fc60e7..206a8f5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -122,6 +122,22 @@
 		reg = <0>;
 		spi-max-frequency = <1000000>; /* input clock */
 	};
+
+	slic@2 {
+		compatible = "maxim,ds26522";
+		reg = <2>;
+		spi-max-frequency = <2000000>;
+		fsl,spi-cs-sck-delay = <100>;
+		fsl,spi-sck-cs-delay = <50>;
+	};
+
+	slic@3 {
+		compatible = "maxim,ds26522";
+		reg = <3>;
+		spi-max-frequency = <2000000>;
+		fsl,spi-cs-sck-delay = <100>;
+		fsl,spi-sck-cs-delay = <50>;
+	};
 };
 
 &uqe {
-- 
2.1.0.27.g96db324
