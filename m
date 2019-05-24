From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 0/6] crypto - wire up Atmel SHA204A as RNG in DT and ACPI
 mode
Date: Fri, 24 May 2019 18:26:45 +0200
Message-ID: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Tudor Ambarus <tudor.ambarus@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Socionext SynQuacer based 96boards DeveloperBox platform does not
incorporate a random number generator, but it does have a 96boards low
speed connector which supports extension boards such as the Secure96,
which has a TPM and some crypto accelerators, one of which incorporates
a random number generator.

This series implements support for the RNG part, which is one of several
functions of the Atmel SHA204A I2C crypto accelerator, and wires it up so
both DT and ACPI based boot methods can use the device.

v2:
- update DT binding patches so the SHA204A and ECC508A module bindings are
  in trivial-devices.yaml.
- add acks from Linus and Mika

Assuming Rob is ok now with the DT binding patches, can we please take
this through the crypto tree?

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Ard Biesheuvel (6):
  i2c: acpi: permit bus speed to be discovered after enumeration
  crypto: atmel-ecc: add support for ACPI probing on non-AT91 platforms
  crypto: atmel-ecc: factor out code that can be shared
  crypto: atmel-i2c: add support for SHA204A random number generator
  dt-bindings: add Atmel SHA204A I2C crypto processor
  dt-bindings: move Atmel ECC508A I2C crypto processor to
    trivial-devices

 Documentation/devicetree/bindings/crypto/atmel-crypto.txt |  13 -
 Documentation/devicetree/bindings/trivial-devices.yaml    |   4 +
 drivers/crypto/Kconfig                                    |  19 +-
 drivers/crypto/Makefile                                   |   2 +
 drivers/crypto/atmel-ecc.c                                | 403 ++------------------
 drivers/crypto/atmel-ecc.h                                | 116 ------
 drivers/crypto/atmel-i2c.c                                | 364 ++++++++++++++++++
 drivers/crypto/atmel-i2c.h                                | 196 ++++++++++
 drivers/crypto/atmel-sha204a.c                            | 171 +++++++++
 drivers/i2c/i2c-core-acpi.c                               |   6 +-
 10 files changed, 781 insertions(+), 513 deletions(-)
 delete mode 100644 drivers/crypto/atmel-ecc.h
 create mode 100644 drivers/crypto/atmel-i2c.c
 create mode 100644 drivers/crypto/atmel-i2c.h
 create mode 100644 drivers/crypto/atmel-sha204a.c

-- 
2.20.1
