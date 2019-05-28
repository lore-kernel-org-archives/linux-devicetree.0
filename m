Return-Path: <SRS0=ExU1=T4=linaro.org=masahisa.kojima@kernel.org>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Subject: [PATCH v6 0/3] spi: support for Socionext Synquacer platform
Date: Tue, 28 May 2019 18:27:10 +0900
Message-Id: <20190528092713.10516-1-masahisa.kojima@linaro.org>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: broonie@kernel.org, geert@linux-m68k.org, tpiepho@impinj.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, ard.biesheuvel@linaro.org, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, okamoto.satoru@socionext.com, osaki.yoshitoyo@socionext.com, Masahisa Kojima <masahisa.kojima@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hello,

 Support for Socionext's FIP controller intended for flash device interfacing.
The controller can operate in 'direct' or 'command' mode. One mode directly
talks and provide a read/write i/f to the flash device. Other works as plain
SPI mode. This driver runs the controller as a SPI controller.

Changes since v5:
        # Supported ACPI probing and added ACPI device table(SCX0004)
        # Removed DT dependencies
        # Removed to call _relaxed variants to access the registers
        # Updated irq name to use dev_name()
        # Updated return value for irq handlers
        # Explicitly listed the supported bits_per_word
        # Removed FIFO handling from a set_cs() operation

Changes since v4:
        # Supported interrupt based data handling instead of polling
        # Added prefix "SYNQUACER_HSSPI_"
        # Replaced data read/write access with readsx()/writesx()
        # Updated clock source handling, explicitly specify "iHCLK" or "iPCKL"
          and removed array of clk

Changes since v3:
        # Convert IS_ERR returned from devm_clk_get(iPCLK) to NULL, that way
          we can call clk_xxx(IPCLK) without first checking for it being valid.

Changes since v2:
        # Made iHCLK clock property required in DT, and iPCLK an optional extra.
        # Hardcode max number of slaves to 4, as specified in the manual.

Changes since v1:
        # Changed licence header to C++ style comment.
        # Removed redundant lock and transfer_mode backup member.
        # Fixed divisor to allow upto 254.

Masahisa Kojima (3):
  MAINTAINERS: Add entry for Synquacer SPI driver
  dt-bindings: spi: Add DT bindings for Synquacer
  spi: Add spi driver for Socionext Synquacer platform

 .../devicetree/bindings/spi/spi-synquacer.txt      |  27 +
 MAINTAINERS                                        |   8 +
 drivers/spi/Kconfig                                |  11 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-synquacer.c                        | 826 +++++++++++++++++++++
 5 files changed, 873 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-synquacer.txt
 create mode 100644 drivers/spi/spi-synquacer.c

-- 
2.14.2
