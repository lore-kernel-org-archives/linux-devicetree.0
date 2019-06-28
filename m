From: Oshri Alkoby <oshrialkoby85@gmail.com>
Subject: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Date: Fri, 28 Jun 2019 18:13:25 +0300
Message-ID: <20190628151327.206818-1-oshrialkoby85@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, oshrialkoby85@gmail.com, oshri.alkoby@nuvoton.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, dan.morav@nuvoton.com, tomer.maimon@nuvoton.com
List-Id: devicetree@vger.kernel.org

This patch set adds support for TPM devices that implement the I2C
interface defined by TCG PTP specification:
https://trustedcomputinggroup.org/wp-content/uploads/TCG_PC_Client_Platform_TPM_Profile_PTP_2.0_r1.03_v22.pdf

The driver was tested on Raspberry-Pie 3, using Nuvoton NPCT75X TPM.

changes
-------

v2:
- Extended device tree binding description

v1:
- Initial version

Oshri Alkoby (2):
  dt-bindings: tpm: add the TPM I2C PTP device tree binding
    documentation
  char: tpm: add new driver for tpm i2c ptp

 .../bindings/security/tpm/tpm-i2c-ptp.txt     |   24 +
 drivers/char/tpm/Kconfig                      |   22 +
 drivers/char/tpm/Makefile                     |    1 +
 drivers/char/tpm/tpm_i2c_ptp.c                | 1099 +++++++++++++++++
 4 files changed, 1146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-i2c-ptp.txt
 create mode 100644 drivers/char/tpm/tpm_i2c_ptp.c

-- 
2.18.0
