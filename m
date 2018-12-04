Return-Path: <SRS0=K2Zf=ON=mellanox.com=kblaiech@kernel.org>
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v2 0/2] i2c: added driver for Mellanox BlueField SoC
Date: Tue,  4 Dec 2018 12:40:56 -0500
Message-Id: <cover.1543941145.git.kblaiech@mellanox.com>
To: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Added I2C SMBus driver and device tree bindings documentation.
This patch set depends on ARCH_MLNX_BLUEFIELD. There is separate
effort that aims to add support for the Mellanox BlueField SoC
to the kernel tree.

Changes since v1:

1) Device bindings documentation:

   - Enumerate the device resources.
   - Edit the 'compatible' property to make it less generic.
   - Remove the 'bus' index property and replace i with a
     standard approach to read the bus identifier.
   - Get rid of the 'profile' property.
   - Use 'clock-frequency' property instead of 'bus-freq'.
   - Convert the clock frequency from KHz to Hz.
   - Remove useless examples.

2) Device driver source:

   - Update the '.compatible' field of of_device_id.
   - Update mlx_i2c_of_probe() call to extract the bus id
     from the pre-defined aliases.
   - Don't check the profile property.
   - Read the 'clock-frequency' property to get the timing
     parameters. 
   - Convert the timing configuration from KHz to Hz.

Khalil Blaiech (2):
  i2c: i2c-mlx: I2C SMBus driver for Mellanox BlueField SoC
  dt-bindings: i2c: I2C binding for Mellanox BlueField SoC

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |   67 +
 drivers/i2c/busses/Kconfig                         |   13 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-mlx.c                       | 2341 ++++++++++++++++++++
 4 files changed, 2422 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 drivers/i2c/busses/i2c-mlx.c

-- 
2.1.2
