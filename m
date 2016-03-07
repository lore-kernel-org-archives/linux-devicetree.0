From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v4 6/8] T104xRDB: Add qe node to t104xrdb
Date: Mon, 7 Mar 2016 10:28:06 +0800
Message-ID: <1457317688-20330-6-git-send-email-qiang.zhao@nxp.com>
References: <1457317688-20330-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457317688-20330-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: oss@buserror.net, leoyang.li@nxp.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

add qe node to t104xrdb.dtsi

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
Changes for v2
	- rebase
Changes for v3
	- rebase
Changes for v4
	- rebase

 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
index 830ea48..dd7fc2b 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -186,4 +186,42 @@
 				  0 0x00010000>;
 		};
 	};
+
+	qe: qe@ffe140000 {
+		ranges = <0x0 0xf 0xfe140000 0x40000>;
+		reg = <0xf 0xfe140000 0 0x480>;
+		brg-frequency = <0>;
+		bus-frequency = <0>;
+
+		si1: si@700 {
+			compatible = "fsl,t1040-qe-si";
+			reg = <0x700 0x80>;
+		};
+
+		siram1: siram@1000 {
+			compatible = "fsl,t1040-qe-siram";
+			reg = <0x1000 0x800>;
+		};
+
+		ucc_hdlc: ucc@2000 {
+			compatible = "fsl,ucc-hdlc";
+			rx-clock-name = "clk8";
+			tx-clock-name = "clk9";
+			fsl,rx-sync-clock = "rsync_pin";
+			fsl,tx-sync-clock = "tsync_pin";
+			fsl,tx-timeslot-mask = <0xfffffffe>;
+			fsl,rx-timeslot-mask = <0xfffffffe>;
+			fsl,tdm-framer-type = "e1";
+			fsl,tdm-id = <0>;
+			fsl,siram-entry-id = <0>;
+			fsl,tdm-interface;
+		};
+
+		ucc_serial: ucc@2200 {
+			compatible = "t1040-ucc-uart";
+			port-number = <0>;
+			rx-clock-name = "brg2";
+			tx-clock-name = "brg2";
+		};
+	};
 };
-- 
2.1.0.27.g96db324
