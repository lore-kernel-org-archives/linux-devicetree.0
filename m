From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [RESEND][PATCH 0/4] firmware: of: populate /firmware/ node during init
Date: Thu, 28 Sep 2017 11:45:58 +0100
Message-ID: <1506595562-10592-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Arnd,

There's a push to place all firmware related device node under
/firmware/ node. However all the associated drivers are dealing with
device creation in their own ways. For example, qcom_scm, optee and
meson-sm drivers deal with the node in their own way. The SCMI drivers
I am about to add also needs to do the same. This small series is to
make it generic so that all the users of /firmware/ node need not
repeat the same.

There was concern that /firmware in DT is fit for /sys/firmware in sysfs.
IMO anything exposed to userspace from such firmware interface must
be in "/sys/firmware", but I don't see any issue with kernel handling
them as platform device/driver internally.

Sudeep Holla (4):
  of: platform: populate /firmware/ node from
    of_platform_default_populate_init()
  firmware: qcom_scm: drop redandant of_platform_populate
  drivers: tee: rework optee_driver_{init,exit} to use platform device
  firmware: meson-sm: rework meson_sm_init to use
    module_platform_driver_probe

 drivers/firmware/meson/meson_sm.c | 21 ++++++-----
 drivers/firmware/qcom_scm.c       | 24 -------------
 drivers/of/platform.c             |  4 +++
 drivers/tee/optee/core.c          | 74 +++++++++++++--------------------------
 4 files changed, 41 insertions(+), 82 deletions(-)

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
