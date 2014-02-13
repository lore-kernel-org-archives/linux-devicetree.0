From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [PATCH 0/2] mfd: da9055: Add DT support & documentation for PMIC
Date: Thu, 13 Feb 2014 10:45:48 +0000
Message-ID: <cover.1392286537.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

This patch set adds DT support for the MFD core of the da9055 PMIC, and adds
the accompanying DT binding documentation for the device.

Adam Thomson (2):
  mfd: da9055: Add DT support for PMIC
  mfd: da9055: Add DT binding documentation for PMIC

 Documentation/devicetree/bindings/mfd/da9055.txt |   73 ++++++++++++++++++++++
 drivers/mfd/da9055-i2c.c                         |    8 +++
 2 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/da9055.txt
