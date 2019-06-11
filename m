From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v1 0/3] iio: afe: rescale: Add INFO_PROCESSED support
Date: Tue, 11 Jun 2019 11:56:56 +0200
Message-ID: <20190611095659.29845-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: peda@axentia.se, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com
List-Id: devicetree@vger.kernel.org

Hello everyone,

You will find a small series that add the support of processed values
for iio-rescale driver.
Thanks to that, it is possible to read processed values in sysfs instead
of getting only raw and scale values.

Here is an example for a 3v3 voltage reading:
# cat /sys/bus/iio/devices/iio\:device1/in_voltage0_scale
3.791015625
# cat /sys/bus/iio/devices/iio\:device1/in_voltage0_raw
879
# cat /sys/bus/iio/devices/iio\:device1/in_voltage0_input
3332

It is also possible to read directly the processed values using iio-hwmon
driver (see example in patch03):

# cat /sys/class/hwmon/hwmon0/in1_input
3328

I seperated my series in 3 patches:
   - Patch01: Move the scale conversion into a function to prepare the
   support of IIO_CHAN_INFO_PROCESSED.
   - Patch02: Add the support of IIO_CHAN_INFO_PROCESSED.
   - Patch03: Add an example of the use of hwmon and voltage-divider nodes
   in device-tree.

If you have any feedbacks on it, I will be pleased to read them!

Best regards,
Mylène

Mylène Josserand (3):
  iio: afe: rescale: Move scale conversion to new function
  iio: afe: rescale: Add support of CHAN_INFO_PROCESSED
  dt-bindings: iio: afe: Add hwmon example

 .../bindings/iio/afe/voltage-divider.txt           | 24 ++++++
 drivers/iio/afe/iio-rescale.c                      | 96 ++++++++++++++++------
 2 files changed, 96 insertions(+), 24 deletions(-)

-- 
2.11.0
