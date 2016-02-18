From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v2 7/7] T104xQDS: Add qe node to t104xqds
Date: Thu, 18 Feb 2016 09:06:12 +0800
Message-ID: <1455757572-44955-7-git-send-email-qiang.zhao@nxp.com>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: oss@buserror.net, leoyang.li@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

add qe node to t104xqds.dtsi

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
Changes for v2
	- rebase

 arch/powerpc/boot/dts/fsl/t104xqds.dtsi | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
index 1498d1e..1a8e60d 100644
--- a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
@@ -190,4 +190,44 @@
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
+			compatible = "fsl,qe-si";
+			reg = <0x700 0x80>;
+		};
+
+		siram1: siram@1000 {
+			compatible = "fsl,qe-siram";
+			reg = <0x1000 0x800>;
+		};
+
+		ucc_hdlc: ucc@2000 {
+			compatible = "fsl,ucc-hdlc";
+			rx-clock-name = "clk8";
+			tx-clock-name = "clk9";
+			fsl,rx-sync-clock = "rsync_pin";
+			fsl,tx-sync-clock = "tsync_pin";
+			fsl,tx-timeslot = <0xfffffffe>;
+			fsl,rx-timeslot = <0xfffffffe>;
+			fsl,tdm-framer-type = "e1";
+			fsl,tdm-mode = "normal";
+			fsl,tdm-id = <0>;
+			fsl,siram-entry-id = <0>;
+			fsl,tdm-interface;
+		};
+
+		ucc_serial: ucc@2200 {
+			device_type = "serial";
+			compatible = "ucc_uart";
+			port-number = <1>;
+			rx-clock-name = "brg2";
+			tx-clock-name = "brg2";
+		};
+	};
 };
-- 
2.1.0.27.g96db324
