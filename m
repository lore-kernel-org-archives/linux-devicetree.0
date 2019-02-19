Return-Path: <SRS0=lcGb=Q2=mellanox.com=kblaiech@kernel.org>
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v4 0/2] i2c: added driver for Mellanox BlueField SoC
Date: Tue, 19 Feb 2019 18:45:44 -0500
Message-Id: <cover.1550618900.git.kblaiech@mellanox.com>
To: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Added I2C SMBus driver and device tree bindings documentation.

Changes since v3:

Device bindings documentation:

   - Re-order property descriptions.
   - Remove useless register addresses from the resource
     description.
   - Mention default clock-frequency value.
   - Fix format issues; remove spaces.
   - Omit "aliases" from Example section.
   - Rename device instance node in Example section.

Khalil Blaiech (2):
  i2c: i2c-mlx: I2C SMBus driver for Mellanox BlueField SoC
  dt-bindings: i2c: I2C binding for Mellanox BlueField SoC

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   29 +
 drivers/i2c/busses/Kconfig                         |   13 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-mlx.c                       | 2512 ++++++++++++++++++++
 4 files changed, 2555 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 drivers/i2c/busses/i2c-mlx.c

--
2.1.2
