From: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 3/6] QE: Add uqe_serial document to bindings
Date: Fri, 8 Jan 2016 10:18:11 +0800
Message-ID: <1452219494-31947-3-git-send-email-qiang.zhao@nxp.com>
References: <1452219494-31947-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452219494-31947-1-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add uqe_serial document to
Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
---
 .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
new file mode 100644
index 0000000..e677599
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
@@ -0,0 +1,20 @@
+* Serial
+
+Currently defined compatibles:
+- ucc_uart
+
+Properties for ucc_uart:
+device_type : which type the device is
+port-number : port number of UCC-UART
+rx-clock-name : which clock QE use for RX
+tx-clock-name : which clock QE use for TX
+
+Example:
+
+	serial: ucc@2200 {
+		device_type = "serial";
+		compatible = "ucc_uart";
+		port-number = <1>;
+		rx-clock-name = "brg2";
+		tx-clock-name = "brg2";
+	};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
