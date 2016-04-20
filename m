From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 0/3] iio sensor mounting matrix support
Date: Wed, 20 Apr 2016 19:04:23 +0200
Message-ID: <cover.1461170293.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Cristina Opriceana <cristina.opriceana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Leonard Crestez <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series follows up on Rob Herring and Jonathan Cameron comments
about ak8975 magnetometer mounting matrix support. Thread starts here:
http://www.spinics.net/lists/devicetree/msg121646.html

As a recall, we want to expose a rotation matrix to indicate userspace the chip
placement with respect to the overall hardware system. This allows an
application to adjust coordinates sampled from a sensor chip when its position
deviates from the main hardware system.
Rob mentionned that the interface could be appropriate for other sensors such as
gyro, accelero, etc... This would prevent from "ending up with a bunch of
similar yet different interfaces".

Requirements:
1. delegate computation to userspace ;
2. floating point arithmetics support ;
3. per sample type matrix ;
4. remain compliant with legacy interface (mpu6050).

Point 1. above allows application to perform arbitrary transformations in
addition to sensor alignment handling.
Point 2. is required for flexible chip positioning.
Point 3. comes from the fact that chips, such as ADIS16407, may implement
different axis direction references for each measurement space.
See http://www.analog.com/media/en/technical-documentation/data-sheets/ADIS16407.pdf

Implementation relies upon generic extended channel infos, coming with following
additional benefits :
* clearly structure sysfs attributes according to IIO ABI conventions,
* limit proliferation of arbitrary driver sysfs attributes,
* reduce amount of per driver code.

We should end up with something like the following for a magneto + gyro +
accelero + temperature chip :
iio:deviceX/in_anglvel_mount_matrix, applicable to all 3 gyro channels
iio:deviceX/in_accel_mount_matrix, applicable to all 3 accelero channels
iio:deviceX/in_magn_mount_matrix, applicable to all 3 magneto channels
Here mount matrix attribute is channel type specific. It is not applicable to
temperature channel.

Another case such as the ak8975 magneto driver modified in patch 2 would show
a simpler:
iio:deviceX/in_mount_matrix, applicable to all 3 magneto channels.
Here mount matrix attribute is channel direction specific and applicable to all
channels.

Last patch relates to mpu6050 mounting matrix evolutions : legacy attribute was
extracted from platform_data. For sake of simplicity and as platform data
mechanism is becoming more and more "obsolete", New mounting matrix API support
is implemented for device-tree nodes only.

Best regards,
gregor.

Gregor Boirie (3):
  iio:core: mounting matrix support
  iio:ak8975: add mounting matrix support
  iio:imu:mpu6050: enhance mounting matrix support

 Documentation/ABI/testing/sysfs-bus-iio            | 53 ++++++++++++++
 .../devicetree/bindings/iio/imu/inv_mpu6050.txt    | 13 ++++
 .../bindings/iio/magnetometer/ak8975.txt           | 10 +++
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         | 36 +++++++++-
 drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |  4 +-
 drivers/iio/industrialio-core.c                    | 82 ++++++++++++++++++++++
 drivers/iio/magnetometer/ak8975.c                  | 34 +++++++--
 include/linux/iio/iio.h                            | 31 ++++++++
 include/linux/iio/magnetometer/ak8975.h            | 16 +++++
 include/linux/platform_data/invensense_mpu6050.h   |  5 +-
 10 files changed, 275 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/iio/magnetometer/ak8975.h

-- 
2.1.4
