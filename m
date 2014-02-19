From: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Subject: [PATCH v7 0/4] DT support for kirkwood based Synology NAS boxes
Date: Thu, 20 Feb 2014 06:02:33 +1000
Message-ID: <1392840157-31072-1-git-send-email-klightspeed@killerwolves.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for around 30 kirkwood bases Synology NAS
boxes. Patch #1 documents vendor prefixes. Patch #2 generalizes the qnap
power off driver so that it can also be used for Synology devices.
Patch #3 adds sii,s35390a to i2c trivial devices. Patch #4 adds the 
synology DT files.

v2:
Typo fix in qnap-poweroff.c
Use ricoy stock ticker instead of ricoh
Describe the lego structure of the hardware

v3:
Merge synology dtsi files into a single dtsi file

v4:
Various minor fixes to synology dtsi file

v5:
Fix typos in commit messages
Remove unnecessary casts in qnap-poweroff.c

v6:
Revert qnap vendor prefix change from v5

v7:
Revert ricoh vendor prefix change from v2

Andrew Lunn (3):
  DT: Vendor prefixes: Add ricoh, qnap, sii and synology
  Power: Reset: Generalize qnap-poweroff to with on Synology devices.
  DT: i2c: Trivial: Add sii,s35390a

Ben Peddell (1):
  ARM: Kirkwood: Add support for many Synology NAS devices

 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 .../bindings/power_supply/qnap-poweroff.txt        |   5 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   4 +
 arch/arm/boot/dts/Makefile                         |  15 +
 arch/arm/boot/dts/kirkwood-ds109.dts               |  41 +
 arch/arm/boot/dts/kirkwood-ds110jv10.dts           |  41 +
 arch/arm/boot/dts/kirkwood-ds111.dts               |  44 ++
 arch/arm/boot/dts/kirkwood-ds112.dts               |  48 ++
 arch/arm/boot/dts/kirkwood-ds209.dts               |  44 ++
 arch/arm/boot/dts/kirkwood-ds210.dts               |  46 ++
 arch/arm/boot/dts/kirkwood-ds212.dts               |  47 ++
 arch/arm/boot/dts/kirkwood-ds212j.dts              |  41 +
 arch/arm/boot/dts/kirkwood-ds409.dts               |  48 ++
 arch/arm/boot/dts/kirkwood-ds409slim.dts           |  40 +
 arch/arm/boot/dts/kirkwood-ds411.dts               |  52 ++
 arch/arm/boot/dts/kirkwood-ds411j.dts              |  48 ++
 arch/arm/boot/dts/kirkwood-ds411slim.dts           |  48 ++
 arch/arm/boot/dts/kirkwood-rs212.dts               |  48 ++
 arch/arm/boot/dts/kirkwood-rs409.dts               |  44 ++
 arch/arm/boot/dts/kirkwood-rs411.dts               |  44 ++
 arch/arm/boot/dts/kirkwood-synology.dtsi           | 871 +++++++++++++++++++++
 drivers/power/reset/qnap-poweroff.c                |  49 +-
 22 files changed, 1656 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-ds109.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds110jv10.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds111.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds112.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds209.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds210.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds212.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds212j.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds409.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds409slim.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds411.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds411j.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-ds411slim.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-rs212.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-rs409.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-rs411.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-synology.dtsi

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
