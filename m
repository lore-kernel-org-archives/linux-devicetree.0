From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 0/3] Overlay manager for predefined DT overlay fragments
Date: Mon,  9 Oct 2017 22:34:17 -0700
Message-ID: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Dmitry Shmidt <dimitrysh@google.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In working with the HiKey and HiKey960 as targets for AOSP,
Dmitry developed the following overlay manager driver, which
allows a number of pre-determined DT overlay configurations to
be defined, and the configurations to be enabled at boot time
via a kernel boot argument.

This has been submitted before, but while the earlier discussion
didn't really resolve to any sort of actionable direction, this
issue cropped up again and was a major discussion topic at the
Linux Plumbers Conference Android Microconference, so I suspect
it is worth revisiting this solution again.

The overall use case is being able to configure devboards that
support a number of different mezzanine peripherals which
unfortunately cannot be probed. Some example mezzanines are
LCD panels or sensor hubs, as well as other options.

The new functionality this driver provides is a mechanism to
specify multiple pre-determined dt overlay fragments in a
dtb file, and providing a way to select which dt fragments
should be applied via the kernel boot argument.

The desire to use a kernel boot-argument as the selection
mechanism, comes from the Android Boot Image format not handling
dtbs independently. Usually with Android, the dtb is appended
to the kernel image, and modifying that is much more difficult
then changing the boot argugments. There is also a usability
argument that using a kernel command option to select
pre-defined entries is simpler for users to navigate.

Also, since the mezzanines are unable to be probed, we cannot
use other solutions, like having the bootloader specify
additional dtb overlays to the kernel.

Obviously the earlier objections to this approach likely still
apply, but we wanted to resubmit it for feedback in order to
restart the discussion to find an actionable direction as to
what sort of usable and more general approach could be found.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Dmitry Shmidt <dimitrysh@google.com>
Cc: devicetree@vger.kernel.org

Dmitry Shmidt (3):
  of: overlay_mgr: Add overlay manager driver
  of: overlay_mgr: Add ability to apply through sysfs entry
  of: overlay_mgr: Add ability to apply several hardware configurations

 .../devicetree/bindings/of/overlay_mgr.txt         |  32 +++++
 drivers/of/Kconfig                                 |  10 ++
 drivers/of/Makefile                                |   1 +
 drivers/of/overlay_mgr.c                           | 152 +++++++++++++++++++++
 4 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/of/overlay_mgr.txt
 create mode 100644 drivers/of/overlay_mgr.c

-- 
2.7.4
