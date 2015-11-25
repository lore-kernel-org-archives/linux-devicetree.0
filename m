From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v3 0/5] Devicetree support for misc/eeprom/eeprom_93xx46.
Date: Wed, 25 Nov 2015 00:30:47 -0500
Message-ID: <1448429452-26972-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This series of patches adds an initial set of devicetree bindings to the
eeprom_93xx46 driver which mirror the configuration options previously
available as a platform device.  These bindings are then extended to
include support for specific Atmel devices in this family and also to
support GPIO-based selection of the device (e.g. for use with an SPI bus
mux).

Additionally, an address aliasing issue with 16-bit read and write
accesses in the eeprom_93xx46 driver discovered during testing is fixed.

Changes since v2:
  - Changed node name to 'eeprom' in DT bindings example.
  - Simplified several bits of return logic.
  - Removed #ifdef CONFIG_OF.
  - Allow compiler to handle promotion to bool return values.
  - Reworked GPIO handling to use gpiod_* functions throughout (and
    fixed an oversight where GPIO flags were being ignored).

Changes since v1:
  - Consolidated all Documentation/devictree additions into a single patch.
  - Clarified compatible string shall be only one of the supported values.
  - Renamed the 'select-gpio' binding to 'select-gpios'.

Cory Tusar (5):
  misc: eeprom_93xx46: Fix 16-bit read and write accesses.
  Documentation: devicetree: Add DT bindings to eeprom_93xx46 driver.
  misc: eeprom_93xx46: Implement eeprom_93xx46 DT bindings.
  misc: eeprom_93xx46: Add quirks to support Atmel AT93C46D device.
  misc: eeprom_93xx46: Add support for a GPIO 'select' line.

 .../devicetree/bindings/misc/eeprom-93xx46.txt     |  25 +++
 drivers/misc/eeprom/eeprom_93xx46.c                | 212 +++++++++++++++++----
 include/linux/eeprom_93xx46.h                      |   9 +
 3 files changed, 210 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/eeprom-93xx46.txt

-- 
2.4.10
