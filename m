Return-Path: <SRS0=jXKD=JN=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 0/5] leds: add devicetree functionality to lltc,lt3593 driver
Date: Wed, 27 Jun 2018 20:52:32 +0200
Message-Id: <20180627185237.24830-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This is v5 of the series that brings devicetree support for the
lltc,lt3593 LED driver.

Before this series, the driver supported controlling multiple LEDs
through an array in the platform data. IOW, a single instance of the
driver was able to control multiple hardware chips.

This series changes that, and requires a distinct platform device to
be set up for each of them, if a board has multiple of these hardware
chips. The reason is that in DT, nodes should represent hardware, and
it's much cleaner this way.

As stated earlier in the thread for v1, the driver currently only has
one user in mainline (the Raumfeld platform) which is soon to be
replaced by a devicetree file. This user only uses one LED via pdata, so
the change mentioned above does not cause a regression.

Once the platform is fully ported to DT, I'll send another patch that
removes pdata handling from this driver completely, but it's kept around
as legacy bridge for now.


Changelog:

v4 → v5:
* Moved GPIO property from LED subnode to device node, as requested
  by Rob Herring.
* Squashed the patch titled "sync module license information with
  header" in 5/5.

v3 → v4:

* Fixed a mishap that slipped in during rebase which caused a compile
  error
* Removed empty line at end of the DT documentation file
* Switched to SPDX license header in the driver

v2 → v3:

* Fixed a typo in the commit log of 1/5
* Rebased onto 4.18-rc1

v1 → v2:

* Moved LED-specific properties into a sub-node in DT, as requested by
  Jacek Anaszewski.


Daniel Mack (5):
  dt-bindings: leds: Add bindings for lltc,lt3593
  leds: lt3593: merge functions and clean up code
  leds: lt3593: switch to gpiod interface
  leds: lt3593: Add device tree probing glue
  leds: lt3593: update email address and switch to SPDX license header

 .../devicetree/bindings/leds/leds-lt3593.txt  |  32 +++
 drivers/leds/leds-lt3593.c                    | 190 ++++++++++--------
 2 files changed, 137 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt

-- 
2.17.1
