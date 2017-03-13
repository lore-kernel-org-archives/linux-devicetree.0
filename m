From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] iio: accel: adxl345: Add support for buffered readings
Date: Mon, 13 Mar 2017 19:11:33 +0800
Message-ID: <1489403497-27849-1-git-send-email-eraretuya@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce the DATA_READY trigger and enable triggered buffering. Additional
changes include introduction of functions set_mode, drdy and get_triple,
allow either INT1/INT2 pin be used by specifying interrupt-names.

Triggered buffer was tested on both DATA_READY trigger and the hrtimer software
trigger.

~ # ls /sys/bus/iio/devices/
iio:device0  trigger0     trigger1
~ # ls /config/iio/triggers/hrtimer/
t1
~ # cat /sys/bus/iio/devices/trigger0/name
t1
~ # cat /sys/bus/iio/devices/trigger1/name
adxl345-dev0
~ # iio_generic_buffer -n adxl345 -t t1 -c 10 -l 20 -a
iio device number being used is 0
iio trigger number being used is 0
Enabling all channels
Enabling: in_accel_y_en
Enabling: in_accel_x_en
Enabling: in_timestamp_en
Enabling: in_accel_z_en
/sys/bus/iio/devices/iio:device0 t1
0.421300 1.034100 9.613300 1489394979215985178 
0.421300 0.995800 9.230300 1489394979226027141 
0.421300 1.034100 9.575000 1489394979236031983 
0.383000 1.072400 9.575000 1489394979245992337 
0.421300 1.072400 9.575000 1489394979256031062 
0.383000 1.110700 9.498400 1489394979266012473 
0.421300 1.072400 9.460100 1489394979276021743 
0.421300 1.034100 9.575000 1489394979286025189 
0.383000 1.072400 9.536700 1489394979295988380 
0.421300 1.072400 9.613300 1489394979306036861 
Disabling: in_accel_y_en
Disabling: in_accel_x_en
Disabling: in_timestamp_en
Disabling: in_accel_z_en
~ # iio_generic_buffer -n adxl345 -t adxl345-dev0 -c 10 -l 20 -a
iio device number being used is 0
iio trigger number being used is 1
Enabling all channels
Enabling: in_accel_y_en
Enabling: in_accel_x_en
Enabling: in_timestamp_en
Enabling: in_accel_z_en
/sys/bus/iio/devices/iio:device0 adxl345-dev0
0.383000 1.072400 9.575000 1489395043824672808 
0.459600 1.072400 9.575000 1489395043864264458 
0.421300 0.995800 9.575000 1489395043883851974 
0.383000 1.072400 9.536700 1489395043905000622 
0.459600 1.034100 9.575000 1489395043929645868 
0.421300 1.072400 9.498400 1489395043946881648 
0.459600 1.034100 9.613300 1489395043967234777 
0.459600 1.034100 9.575000 1489395043987596905 
0.383000 1.034100 9.613300 1489395044005969376 
0.383000 1.110700 9.575000 1489395044026535007 
Disabling: in_accel_y_en
Disabling: in_accel_x_en
Disabling: in_timestamp_en
Disabling: in_accel_z_en
~ # 

Eva Rachel Retuya (4):
  dt-bindings: iio: accel: adxl345: Add optional interrupt-names support
  iio: accel: adxl345_core: Introduce set_mode, drdy & get_triple
    functions
  iio: accel: adxl345: Setup DATA_READY trigger
  iio: accel: adxl345: Add support for triggered buffer

 .../devicetree/bindings/iio/accel/adxl345.txt      |   4 +
 drivers/iio/accel/Kconfig                          |   2 +
 drivers/iio/accel/adxl345.h                        |   4 +-
 drivers/iio/accel/adxl345_core.c                   | 313 +++++++++++++++++++--
 drivers/iio/accel/adxl345_i2c.c                    |  14 +-
 drivers/iio/accel/adxl345_spi.c                    |  10 +-
 6 files changed, 321 insertions(+), 26 deletions(-)

-- 
2.7.4
