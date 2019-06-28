From: Oshri Alkoby <oshrialkoby85@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: tpm: add the TPM I2C PTP device tree binding documentation
Date: Fri, 28 Jun 2019 18:13:26 +0300
Message-ID: <20190628151327.206818-2-oshrialkoby85@gmail.com>
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628151327.206818-1-oshrialkoby85@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, oshrialkoby85@gmail.com, oshri.alkoby@nuvoton.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, dan.morav@nuvoton.com, tomer.maimon@nuvoton.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Oshri Alkoby <oshrialkoby85@gmail.com>
---
 .../bindings/security/tpm/tpm-i2c-ptp.txt     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-i2c-ptp.txt

diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-i2c-ptp.txt b/Documentation/devicetree/bindings/security/tpm/tpm-i2c-ptp.txt
new file mode 100644
index 000000000000..8b0207fdf3e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/tpm-i2c-ptp.txt
@@ -0,0 +1,24 @@
+* Device Tree Bindings for I2C PTP based Trusted Platform Module(TPM)
+
+The TCG defines a hardware protocol, registers and interface (based
+on the TPM Interface Specification) for accessing TPM devices
+implemented with an I2C interface.
+
+Refer to the 'I2C Interface Definition' section in 'TCG PC Client
+PlatformTPMProfile(PTP) Specification' publication for specification.
+
+Required properties:
+
+- compatible     : Should be "tcg,tpm_i2c_ptp"
+- reg            : Address on the bus
+- tpm-pirq       : Input gpio pin, used for host interrupts
+
+Example (for Raspberry Pie 3 Board with Nuvoton's NPCT75X (2.0)
+-------------------------------------------------------------------
+
+tpm_i2c_ptp: tpm_i2c_ptp@2e {
+
+	compatible = "tcg,tpm_i2c_ptp";
+	reg = <0x2e>;
+	tpm-pirq = <&gpio 24 GPIO_ACTIVE_HIGH>;
+};
-- 
2.18.0
