From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v3 0/9] staging: iio: ad2s1200: Driver clean up
Date: Mon, 23 Apr 2018 00:02:31 +0200
Message-ID: <cover.1524432236.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

For v1 see [1], for v2 see [2].

A summary of this patch:
1. Clean up of minor code style issues.
2. Replace legacy GPIO ABI with modern ABI and remove usage of.
   platform data.
4. Add scaling factor for angular position and angular velocity to
   match the sysfs IIO ABI.
5. Add documentation for device tree binding, and angle channel
6. Move driver to main line.

Changes in v3:
- Improved documentation about used mutex lock.
- Improved readability of read_raw.
- Remove usage of platform data.
- Add dt binding documentation to
  Documentation/devicetree/bindings/iio/ instead of staging folder.
- Change return type of scale for angle and angular velocity channel.
- Remove axis modifier from documentation of angle channel.
- Add missing references to ad2s1205.

Best regards,
David Veenstra

[1] https://marc.info/?l=linux-iio&m=152137920426820&w=2
[2] https://marc.info/?l=linux-iio&m=152425250915148&w=2

David Veenstra (9):
  staging: iio: ad2s1200: Add kernel docs to driver state
  staging: iio: ad2s1200: Improve readability with be16_to_cpup
  staging: iio: ad2s1200: Replace legacy gpio API with modern API
  staging: iio: ad2s1200: Replace platform data with dt bindings
  staging: iio: ad2s1200: Add documentation for device tree binding
  staging: iio: ad2s1200: Add scaling factor for angular velocity
    channel
  staging: iio: Documentation: Add missing sysfs docs for angle channel
  staging: iio: ad2s1200: Add scaling factor for angle channel
  staging: iio: ad2s1200: Move driver out of staging

 Documentation/ABI/testing/sysfs-bus-iio            |   9 +
 .../devicetree/bindings/iio/resolver/ad2s1200.txt  |  16 ++
 drivers/iio/Kconfig                                |   1 +
 drivers/iio/Makefile                               |   1 +
 drivers/iio/resolver/Kconfig                       |  17 ++
 drivers/iio/resolver/Makefile                      |   5 +
 drivers/iio/resolver/ad2s1200.c                    | 201 +++++++++++++++++++++
 drivers/staging/iio/resolver/Kconfig               |  12 --
 drivers/staging/iio/resolver/Makefile              |   1 -
 drivers/staging/iio/resolver/ad2s1200.c            | 171 ------------------
 10 files changed, 250 insertions(+), 184 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
 create mode 100644 drivers/iio/resolver/Kconfig
 create mode 100644 drivers/iio/resolver/Makefile
 create mode 100644 drivers/iio/resolver/ad2s1200.c
 delete mode 100644 drivers/staging/iio/resolver/ad2s1200.c

-- 
2.16.2
