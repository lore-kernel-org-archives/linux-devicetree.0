From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v3 1/4] iio: chemical: Add IIO_CONCENTRATION channel type
Date: Tue,  8 Sep 2015 23:13:37 -0700
Message-ID: <1441779220-8834-2-git-send-email-mranostay@gmail.com>
References: <1441779220-8834-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441779220-8834-1-git-send-email-mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are air quality sensors that report data back in parts per million
of VOC (Volatile Organic Compounds) which are usually indexed from CO2
or another common pollutant.

This patchset adds an IIO_CONCENTRATION type that returns a percentage
of substance because no other channels types fit this use case.

Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/ABI/testing/sysfs-bus-iio | 7 +++++++
 drivers/iio/industrialio-core.c         | 1 +
 include/uapi/linux/iio/types.h          | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 42d360f..48080b7 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -1459,3 +1459,10 @@ Description:
 		measurements and return the average value as output data. Each
 		value resulted from <type>[_name]_oversampling_ratio measurements
 		is considered as one sample for <type>[_name]_sampling_frequency.
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_concentration_raw
+What:		/sys/bus/iio/devices/iio:deviceX/in_concentrationX_raw
+KernelVersion:	4.3
+Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+Description:
+		Raw (unscaled no offset etc.) precentage reading of a substance.
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index b3fcc2c..58a60a1 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -75,6 +75,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_ENERGY] = "energy",
 	[IIO_DISTANCE] = "distance",
 	[IIO_VELOCITY] = "velocity",
+	[IIO_CONCENTRATION] = "concentration",
 };
 
 static const char * const iio_modifier_names[] = {
diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
index 2f8b117..c5a0e3f 100644
--- a/include/uapi/linux/iio/types.h
+++ b/include/uapi/linux/iio/types.h
@@ -35,6 +35,7 @@ enum iio_chan_type {
 	IIO_ENERGY,
 	IIO_DISTANCE,
 	IIO_VELOCITY,
+	IIO_CONCENTRATION,
 };
 
 enum iio_modifier {
-- 
1.9.1
