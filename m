Return-Path: <SRS0=mAAg=SA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:53359 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729652AbfC2Tkl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Mar 2019 15:40:41 -0400
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v5 0/2] i2c: added driver for Mellanox BlueField SoC
Date: Fri, 29 Mar 2019 15:40:27 -0400
Message-Id: <cover.1553887255.git.kblaiech@mellanox.com>
Sender: devicetree-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Added I2C SMBus driver and device tree bindings documentation.

Changes since v3:

* Driver source code:

	- bug fix for the mlx_slave_enable routine.

Khalil Blaiech (2):
  i2c: i2c-mlx: I2C SMBus driver for Mellanox BlueField SoC
  dt-bindings: i2c: I2C binding for Mellanox BlueField SoC

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   29 +
 drivers/i2c/busses/Kconfig                         |   13 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-mlx.c                       | 2513 ++++++++++++++++++++
 4 files changed, 2556 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 drivers/i2c/busses/i2c-mlx.c

-- 
2.1.2
