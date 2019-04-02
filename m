From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH 1/2] ftpm: dt-binding: add dts documentation for fTPM driver
Date: Tue,  2 Apr 2019 15:33:15 -0400
Message-ID: <20190402193316.15144-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca
Cc: linux-kernel@microsoft.com, bryankel@microsoft.com, thiruan@microsoft.com, suredd@microsoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, Sasha Levin <sashal@kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../bindings/security/tpm/tpm_ftpm_tee.txt          | 13 +++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt

diff --git a/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt b/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
new file mode 100644
index 000000000000..20fca67a56c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/tpm_ftpm_tee.txt
@@ -0,0 +1,13 @@
+Required properties:
+- compatible: should be "microsoft,ftpm"
+- linux,sml-base: 64-bit base address of the reserved memory allocated
+		  for the firmware event log
+- linux,sml-size: size of the memory allocated for the firmware event log
+
+Example:
+
+tpm@0 {
+	compatible = "microsoft,ftpm";
+	linux,sml-base = <0x0 0xC0000000>;
+	linux,sml-size = <0x10000>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8162b0eb4b50..902798bcb9a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -249,6 +249,7 @@ micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
 microcrystal	Micro Crystal AG
 micron	Micron Technology Inc.
+microsoft	Microsoft Corporation
 mikroe		MikroElektronika d.o.o.
 minix	MINIX Technology Ltd.
 miramems	MiraMEMS Sensing Technology Co., Ltd.
-- 
2.19.1
