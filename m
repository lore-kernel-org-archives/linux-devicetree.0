From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 3/3] T1040D4RDB: add tdm riser card node to t1040d4rdb
Date: Fri, 8 Jan 2016 10:46:55 +0800
Message-ID: <1452221215-12681-3-git-send-email-qiang.zhao@nxp.com>
References: <1452221215-12681-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452221215-12681-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: robh+dt@kernel.org, Priyanka.Jain@freescale.com, scottwood@freescale.com, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

add tdm riser card node to t1040d4rdb.dts

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1040d4rdb.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts b/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
index fb6bc02..ee3d1ec 100644
--- a/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040d4rdb.dts
@@ -41,6 +41,22 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&mpic>;
+
+	soc: soc@ffe000000 {
+		spi@110000 {
+			slic@1 {
+				compatible = "maxim,ds26522";
+				reg = <1>;
+				spi-max-frequency = <2000000>;
+			};
+
+			slic@2 {
+				compatible = "maxim,ds26522";
+				reg = <2>;
+				spi-max-frequency = <2000000>;
+			};
+		};
+	};
 };
 
 #include "t1040si-post.dtsi"
-- 
2.1.0.27.g96db324
