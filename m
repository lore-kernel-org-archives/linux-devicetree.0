Return-Path: <SRS0=8hQX=FV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37169 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752130AbeB0M4d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 27 Feb 2018 07:56:33 -0500
From: jassisinghbrar@gmail.com
Subject: [PATCHv4 0/3] spi: support for Socionext Synquacer platform
Date: Tue, 27 Feb 2018 18:26:22 +0530
Message-Id: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: tpiepho@impinj.com, broonie@kernel.org, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Jassi Brar <jaswinder.singh@linaro.org>

Hello,

 Support for Socionext's FIP controller intended for flash device interfacing.
The controller can operate in 'direct' or 'command' mode. One mode directly
talks and provide a read/write i/f to the flash device. Other works as plain
SPI mode. This driver runs the controller as a SPI controller.

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

Jassi Brar (3):
  dt-bindings: spi: Add DT bindings for Synquacer
  spi: Add spi driver for Socionext Synquacer platform
  MAINTAINERS: Add entry for Synquacer SPI driver

 .../devicetree/bindings/spi/spi-synquacer.txt      |  23 +
 MAINTAINERS                                        |   7 +
 drivers/spi/Kconfig                                |  11 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-synquacer.c                        | 663 +++++++++++++++++++++
 5 files changed, 705 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-synquacer.txt
 create mode 100644 drivers/spi/spi-synquacer.c

-- 
2.7.4

