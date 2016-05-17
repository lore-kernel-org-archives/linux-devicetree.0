From: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v6 3/7] QE: Add uqe_serial document to bindings
Date: Tue, 17 May 2016 10:38:59 +0800
Message-ID: <1463452743-21462-3-git-send-email-qiang.zhao@nxp.com>
References: <1463452743-21462-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463452743-21462-1-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, xiaobo.xie-3arQi8VN3Tc@public.gmane.org, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add uqe_serial document to
Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2
	- modify tx/rx-clock-name specification
Changes for v3
	- NA 
Changes for v4
	- drop device_type
	- modify to SoC specific compatible 
Changes for v5
	- add fsl to compatible as prefix 
Changes for v6
	- modify property to "fsl,<chip>-ucc-uart"

 .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
new file mode 100644
index 0000000..8823c86
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
@@ -0,0 +1,17 @@
+* Serial
+
+Required Properties:
+compatible : must be "fsl,<chip>-ucc-uart". For t1040, must be
+"fsl,t1040-ucc-uart".
+port-number : port number of UCC-UART
+tx/rx-clock-name : should be "brg1"-"brg16" for internal clock source,
+		   should be "clk1"-"clk28" for external clock source.
+
+Example:
+
+	ucc_serial: ucc@2200 {
+		compatible = "fsl,t1040-ucc-uart";
+		port-number = <0>;
+		rx-clock-name = "brg2";
+		tx-clock-name = "brg2";
+	};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
