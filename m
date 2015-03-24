From: =?UTF-8?q?Vianney=20le=20Cl=C3=A9ment=20de=20Saint-Marcq?=
	<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Subject: [PATCH v2 0/7] iio: mlx90614 enhancements
Date: Tue, 24 Mar 2015 16:54:12 +0100
Message-ID: <1427212459-31585-1-git-send-email-vianney.leclement@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Vianney=20le=20Cl=C3=A9ment=20de=20Saint-Marcq?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>, "Arnout Vandecappelle (Essensium/Mind)" <arnout-agwphqFHkxc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series follows up on the first series sent on February 25.  I have=
 dropped
the filter configuration for now, as I am still trying to figure out ho=
w to do
that properly.

This set of patches adds the following additional features to the
mlx90614 temperature sensor driver.

* Support for the dual IR sensor model (patch 3)
* Emissivity setting (patches 4 and 5)
* Power management (patch 6)
* Handle errors in temperature reading (patch 7)

The changes have been split into 7 patches to ease code review.
Patches 1 and 2 contain mandatory symbol definitions, which have alread=
y
been applied to the togreg branch of iio.git.
Patches 3, 5-7 implement the additional features and are mostly indepen=
dent
from each other.
Patch 4 introduces IIO_CHAN_INFO_EMISSIVITY in iio core and is a prereq=
uisite
of patch 5.

Patch 6 introduces device tree bindings and is the only one sent to the
devicetree list.

Patch set history:
v2: * Drop processed temperature output (v1 patch 3)
    * Drop raw IR values for now (v1 patch 7)
    * Drop iir, fir, and gain attributes for now (v1 patch 5)
    * Introduce standard attribute for emissivity (patches 4 and 5)
    * Add patch 7, fixing wrong readings
    * Return -EINTR when wake-up is interrupted during read (patch 6)
    * Make adding vendor prefix explicit in commit message of patch 6

Vianney le Cl=C3=A9ment de Saint-Marcq (7):
  iio: mlx90614: Refactor register symbols
  iio: mlx90614: Add symbols for accessible registers
  iio: mlx90614: Support devices with dual IR sensor
  iio: core: Introduce IIO_CHAN_INFO_EMISSIVITY
  iio: mlx90614: Add emissivity setting
  iio: mlx90614: Add power management
  iio: mlx90614: Check for errors in read values

 Documentation/ABI/testing/sysfs-bus-iio            |  11 +
 .../bindings/iio/temperature/mlx90614.txt          |  24 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/industrialio-core.c                    |   1 +
 drivers/iio/temperature/mlx90614.c                 | 450 +++++++++++++=
+++++++-
 include/linux/iio/iio.h                            |   1 +
 6 files changed, 472 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/m=
lx90614.txt

--=20
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
