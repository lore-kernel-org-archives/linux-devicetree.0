Return-Path: <SRS0=/X/n=QG=mellanox.com=kblaiech@kernel.org>
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v3 0/2] i2c: added driver for Mellanox BlueField SoC
Date: Wed, 30 Jan 2019 13:01:30 -0500
Message-Id: <cover.1548866223.git.kblaiech@mellanox.com>
To: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Gross <andy.gross@linaro.org>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Added I2C SMBus driver and device tree bindings documentation.

Changes since v2:

1) Device bindings documentation:

   - Omit shared resources from the controller instance.
   - Update the 'compatible' property and support the second
     generation of the Mellanox BlueField SoC.
   - Fix file format; replace spaces with tabs.

2) Device driver source:

   - Provide common register definition.
   - Update the "compatible" string and add a new entry to
     the mlx_i2c_dt_ids array.
   - Add a new entry to the mlx_i2c_acpi_ids array tosupport
     a new device _HID.
   - Update the device probe routines to derive the device
     type based on the instance property described in either
     devicetree or ACPI.
   - Define new handlers to request and release the shared
     resources. These handlers relies on the device type.

Khalil Blaiech (2):
  i2c: i2c-mlx: I2C SMBus driver for Mellanox BlueField SoC
  dt-bindings: i2c: I2C binding for Mellanox BlueField SoC

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   71 +
 drivers/i2c/busses/Kconfig                         |   13 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-mlx.c                       | 2512 ++++++++++++++++++++
 4 files changed, 2597 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 drivers/i2c/busses/i2c-mlx.c

-- 
2.1.2
