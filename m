From: =?UTF-8?q?St=C3=A9phan=20Kochen?= <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH 0/3] lm90: device tree and thermal zone support
Date: Thu, 21 Jan 2016 20:34:34 +0100
Message-ID: <1453404877-17897-1-git-send-email-stephan@kochen.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
Cc: =?UTF-8?q?St=C3=A9phan=20Kochen?= <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support to the lm90 driver for initialising sensor
parameters from a device tree, as well as using the sensor in thermal z=
ones
specified in a device tree.

The patchset is extracted from an ongoing personal project to get mainl=
ine
running on the Ouya console. The git repository is available at:

  https://github.com/stephank/linux.git

This particular patchset can also be pulled from the 'lm90-of' branch t=
here.

The Ouya has a single GPIO fan, and an ON NCT1008 temperature sensor. W=
ith this
patchset, the kernel can do active cooling through a thermal zone, and =
set
sensible sensor alert parameters without user-space assistance.

There's still something amiss with alerts, though. When the temperature=
 exceeds
one of the bounds, the machine bogs down and the log is flooded with wa=
rning
messages. (An interrupt flood? I'm not too concerned at this point, act=
ive
cooling should keep us far from the configured sensor alert bounds duri=
ng
normal operation.)

Please note that these are my very first kernel patches. Hoping I get i=
t right
the first time!

St=C3=A9phan Kochen (3):
  lm90: separate register accessors from sysfs
  lm90: initialize parameters from devicetree
  lm90: register with thermal zones

 Documentation/devicetree/bindings/hwmon/lm90.txt |  48 ++
 drivers/hwmon/lm90.c                             | 618 +++++++++++++++=
--------
 2 files changed, 453 insertions(+), 213 deletions(-)

--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
