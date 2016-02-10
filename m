From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v6 0/2] Atmel AT93C46D and GPIO 'select' support for eeprom_93xx46.
Date: Wed, 10 Feb 2016 14:32:06 -0500
Message-ID: <1455132728-29265-1-git-send-email-cory.tusar@pid1solutions.com>
References: <20160210012836.GA27026@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160210012836.GA27026@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This series of patches extends recently accepted devicetree bindings in the
eeprom_93xx46 driver to include support for a specific Atmel device in this
family, and also to support GPIO-based selection of the device (e.g. for use
with an SPI bus mux).

Changes since v5:
  - Dropped patches 1-3 which were already accepted.
  - Rebased and re-tested atop the 'char-misc-testing' branch of
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git

Changes since v4:
  - Only forward-declare 'struct gpio_desc' in eeprom_93xx46.h.
  - Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Changes since v3:
  - Tested-by: Chris Healy <chris.healy@zii.aero>
    ...on a separate i.MX51 platform with Microchip 93LC46A EEPROM.

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

Cory Tusar (2):
  misc: eeprom_93xx46: Add quirks to support Atmel AT93C46D device.
  misc: eeprom_93xx46: Add support for a GPIO 'select' line.

 drivers/misc/eeprom/eeprom_93xx46.c | 161 ++++++++++++++++++++++++++++--------
 include/linux/eeprom_93xx46.h       |   9 ++
 2 files changed, 135 insertions(+), 35 deletions(-)

-- 
2.4.10
