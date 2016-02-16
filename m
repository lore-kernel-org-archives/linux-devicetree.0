From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] Allow iio_hwmon to accept hypen in node names
Date: Tue, 16 Feb 2016 10:30:52 +0530
Message-ID: <cover.1455597464.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: jdelvare-IBi9RG/b67k@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Initial versions of the patchset intended to introduce the use of
iio_hwmon for Vybrid SoC's. Currently the iio_hwmon driver has two
users and as per the binding documentation, the node names use the
underscore. Use of hypen in device tree node names is acceptable,
however currently the hwmon core code rejects it due to perhaps user
space not liking the hypen and getting confused.

As per Guenter Roeck's suggestion, the first patch looks for a hypen
and replaces it with a underscore in the probe call of iio_hwmon driver
before calling hwmon_device_register_with_groups for registration. Any
users of iio_hwmon driver can now use hypen in the node name.

As per Shawn's suggestion, the existing users have been changed to use
the hypen instead of the underscore and the iio-bindings document
updated. Third patch introduces the usage for Vybrid itself.

Patchset is based on top of shawn's for-next branch.

Feedbacks and comments most welcome. Thank you for feedbacks.

@Guenter
I hope I understood and implemented correctly what you had in mind.

Sample Output from Toradex Colibri VF50 module
root@colibri-vf:/sys/class/hwmon/hwmon0# ls
device       name         of_node      power        subsystem    temp1_input  temp2_input  uevent
root@colibri-vf:/sys/class/hwmon/hwmon0# cat name
iio_hwmon
root@colibri-vf:/sys/class/hwmon/hwmon0# uname -a
Linux colibri-vf 4.5.0-rc1-12868-g88b677c #48 SMP Tue Feb 16 10:05:28 IST 2016 armv7l GNU/Linux

v1:
https://lkml.org/lkml/2015/9/16/932

v2:
https://lkml.org/lkml/2016/2/12/168

Thanks & Regards,
Sanchayan Maity.

Sanchayan Maity (3):
  hwmon: iio_hwmon: Allow the driver to accept hypen in device tree node names
  ARM: dts: Change iio_hwmon nodes to use hypen in node names
  ARM: dts: vfxxx: Add iio_hwmon node for ADC temperature channel

 Documentation/devicetree/bindings/iio/iio-bindings.txt |  2 +-
 arch/arm/boot/dts/imx23.dtsi                           |  2 +-
 arch/arm/boot/dts/imx28.dtsi                           |  2 +-
 arch/arm/boot/dts/vfxxx.dtsi                           |  5 +++++
 drivers/hwmon/iio_hwmon.c                              | 11 ++++++++++-
 5 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
