From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 2/4] iio: resistance: add IIO_RESISTANCE channel type
Date: Sun,  6 Sep 2015 19:39:05 -0700
Message-ID: <1441593547-10896-3-git-send-email-mranostay@gmail.com>
References: <1441593547-10896-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441593547-10896-1-git-send-email-mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/ABI/testing/sysfs-bus-iio | 7 +++++++
 drivers/iio/industrialio-core.c         | 1 +
 include/uapi/linux/iio/types.h          | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 48080b7..0f683ed 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -1466,3 +1466,10 @@ KernelVersion:	4.3
 Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Description:
 		Raw (unscaled no offset etc.) precentage reading of a substance.
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_resistance_raw
+What:		/sys/bus/iio/devices/iio:deviceX/in_resistanceX_raw
+KernelVersion:	4.3
+Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+Description:
+		Raw (unscaled no offset etc.) resistance reading in ohms.
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 58a60a1..d61a363 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -76,6 +76,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_DISTANCE] = "distance",
 	[IIO_VELOCITY] = "velocity",
 	[IIO_CONCENTRATION] = "concentration",
+	[IIO_RESISTANCE] = "resistance",
 };
 
 static const char * const iio_modifier_names[] = {
diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
index c5a0e3f..d58319c 100644
--- a/include/uapi/linux/iio/types.h
+++ b/include/uapi/linux/iio/types.h
@@ -36,6 +36,7 @@ enum iio_chan_type {
 	IIO_DISTANCE,
 	IIO_VELOCITY,
 	IIO_CONCENTRATION,
+	IIO_RESISTANCE,
 };
 
 enum iio_modifier {
-- 
1.9.1
