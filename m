From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 2/3] T1040RDB: add tdm riser card node to t1040rdb
Date: Fri, 8 Jan 2016 10:46:54 +0800
Message-ID: <1452221215-12681-2-git-send-email-qiang.zhao@nxp.com>
References: <1452221215-12681-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452221215-12681-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: robh+dt@kernel.org, Priyanka.Jain@freescale.com, scottwood@freescale.com, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

add tdm riser card node to t1040rdb.dts

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1040rdb.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index cf19415..d52b011 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -43,6 +43,16 @@
 			compatible = "fsl,t1040rdb-cpld";
 		};
 	};
+
+	soc: soc@ffe000000 {
+		spi@110000 {
+			slic@3 {
+				compatible = "maxim,ds26522";
+				reg = <3>;
+				spi-max-frequency = <2000000>; /* input clock */
+			};
+		};
+	};
 };
 
 #include "t1040si-post.dtsi"
-- 
2.1.0.27.g96db324
