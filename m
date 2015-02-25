From: =?UTF-8?q?Vianney=20le=20Cl=C3=A9ment=20de=20Saint-Marcq?=
	<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Subject: [PATCH 0/7] iio: mlx90614 enhancements
Date: Wed, 25 Feb 2015 16:55:05 +0100
Message-ID: <1424879712-28304-1-git-send-email-vianney.leclement@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Vianney=20le=20Cl=C3=A9ment=20de=20Saint-Marcq?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>, "Arnout Vandecappelle (Essensium/Mind)" <arnout-agwphqFHkxc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This set of patches adds the following additional features to the
mlx90614 temperature sensor driver.

* Processed temperature output (patch 3)
* Support for the dual IR sensor model (patch 4)
* EEPROM configuration tuning (patch 5)
* Power management (patch 6)
* Raw IR value access (RFC, patch 7)

The changes have been split into 7 patches to ease code review.
Patches 1 and 2 contain mandatory symbol definitions.
Patches 3-7 implement the additional features and are mostly independen=
t
from each other.  If some features are not desired, the corresponding
patches can be left out.

Perhaps the most tricky part is the power management implemented by
patch 6, as it involves an extra GPIO messing with the SDA line in orde=
r
to wake up the sensor.  See the commit message for details.

Patch 6 introduces device tree bindings and is the only one sent to the
devicetree list.

Vianney le Cl=C3=A9ment de Saint-Marcq (7):
  iio: mlx90614: Refactor register symbols
  iio: mlx90614: Add symbols for accessible registers
  iio: mlx90614: Add processed temperature output
  iio: mlx90614: Support devices with dual IR sensor
  iio: mlx90614: Allow tuning EEPROM configuration
  iio: mlx90614: Add power management
  iio: mlx90614: Provide raw IR value for object channels

 .../bindings/iio/temperature/mlx90614.txt          |  24 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/temperature/mlx90614.c                 | 574 +++++++++++++=
+++++++-
 3 files changed, 580 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/m=
lx90614.txt

--=20
2.3.0
