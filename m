From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 0/8] tpm: Add driver for cr50
Date: Thu, 13 Jun 2019 11:09:23 -0700
Message-ID: <20190613180931.65445-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, Andrey Pronin <apronin@chromium.org>, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for the the H1 secure microcontroller
running cr50 firmware found on various recent Chromebooks. This driver
is necessary to boot into a ChromeOS userspace environment. It
implements support for several functions, including TPM-like
functionality, and supports SPI and I2C interfaces.

The last time this was series sent looks to be [1]. I've looked over the
patches and review comments and tried to address any feedback that
Andrey didn't address (really minor things like newlines). The first
three patches add a couple pre-requisite core changes so that the
drivers can be merged. The last two patches add some sysfs attributes
and make symlinks so that ChromeOS userspace works.

[1] https://lkml.kernel.org/r/1469757314-116169-1-git-send-email-apronin@chromium.org

Andrey Pronin (7):
  tpm: block messages while suspended
  tpm_tis_core: add optional max xfer size check
  tpm_tis_spi: add max xfer size
  dt-bindings: tpm: document properties for cr50
  tpm: add driver for cr50 on SPI
  tpm: add sysfs attributes for tpm2
  tpm: add legacy sysfs attributes for tpm2

Duncan Laurie (1):
  tpm: Add driver for cr50 on I2C

 .../bindings/security/tpm/cr50_spi.txt        |  19 +
 drivers/char/tpm/Kconfig                      |  26 +
 drivers/char/tpm/Makefile                     |   3 +
 drivers/char/tpm/cr50.c                       |  39 +
 drivers/char/tpm/cr50.h                       |  30 +
 drivers/char/tpm/cr50_i2c.c                   | 704 ++++++++++++++++++
 drivers/char/tpm/cr50_spi.c                   | 450 +++++++++++
 drivers/char/tpm/tpm-chip.c                   |   4 +-
 drivers/char/tpm/tpm-interface.c              |  16 +-
 drivers/char/tpm/tpm-sysfs.c                  | 138 +++-
 drivers/char/tpm/tpm.h                        |  29 +-
 drivers/char/tpm/tpm_tis_core.c               |   9 +-
 drivers/char/tpm/tpm_tis_core.h               |   1 +
 drivers/char/tpm/tpm_tis_spi.c                |   1 +
 include/linux/tpm.h                           |   2 +
 15 files changed, 1455 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/cr50_spi.txt
 create mode 100644 drivers/char/tpm/cr50.c
 create mode 100644 drivers/char/tpm/cr50.h
 create mode 100644 drivers/char/tpm/cr50_i2c.c
 create mode 100644 drivers/char/tpm/cr50_spi.c


base-commit: f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
-- 
Sent by a computer through tubes
