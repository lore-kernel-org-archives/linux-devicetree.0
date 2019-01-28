From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v8 0/2] TmFifo platform driver for Mellanox BlueField SoC
Date: Mon, 28 Jan 2019 12:28:05 -0500
Message-ID: <1548696487-8840-1-git-send-email-lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>
Cc: Liming Sun <lsun@mellanox.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series implements the device side platform driver
support for the TmFifo on Mellanox BlueField SoC.

TmFifo is part of the RShim component. It provides FIFOs to
communicate with external host machine via USB or PCIe (SmartNic
case). External host machine has driver to access the RShim
component as well, which is not covered in this patch series.

This patch series was submitted to drivers/soc in previous versions.
This version (v8) re-submit it to drivers/platform according to
the received comments / suggestions.

Patch v8 1/2 has changes according to some comments from Vadim
Pasternak during Mellanox internal review.

Patch v8 2/2 was reviewed by Rob Herring before, but might need
a second look since the location of the driver code is moved.

Liming Sun (2):
  platform/mellanox: Add TmFifo driver for Mellanox BlueField Soc
  dt-bindings: soc: Add TmFifo binding for Mellanox BlueField SoC

 .../devicetree/bindings/soc/mellanox/tmfifo.txt    |   23 +
 drivers/platform/mellanox/Kconfig                  |   13 +-
 drivers/platform/mellanox/Makefile                 |    1 +
 drivers/platform/mellanox/mlxbf-tmfifo-regs.h      |   67 +
 drivers/platform/mellanox/mlxbf-tmfifo.c           | 1289 ++++++++++++++++++++
 5 files changed, 1392 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
 create mode 100644 drivers/platform/mellanox/mlxbf-tmfifo-regs.h
 create mode 100644 drivers/platform/mellanox/mlxbf-tmfifo.c

-- 
1.8.3.1
