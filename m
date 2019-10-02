From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 0/3] dwc3 role-switch handling for HiKey960
Date: Wed,  2 Oct 2019 23:16:14 +0000
Message-ID: <20191002231617.3670-1-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I'm just trying to pick up parts of a patch previously by
Yu Chen to get HiKey960 dev-board's USB functionality working. 

The current full patchset can be found here:
 https://git.linaro.org/people/john.stultz/android-dev.git/log/?id=12289c95c89e0e3173f8da1ebd3a29e52fd50a44

I don't have any real knowledge of the hardware other then the
code, and what I can intuit from testing, but I tried to
document the previously undocumented bindings as best I could
and fixed up a few minor checkpatch issues.

I'd greatly appreciate feedback or thoughts!

thanks
-john

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org

John Stultz (1):
  dt-bindings: usb: generic: Add role-switch-default-host binding

Yu Chen (2):
  usb: roles: Add usb role switch notifier.
  usb: dwc3: Registering a role switch in the DRD code.

 .../devicetree/bindings/usb/generic.txt       |  5 ++
 drivers/usb/dwc3/Kconfig                      |  1 +
 drivers/usb/dwc3/core.h                       |  6 ++
 drivers/usb/dwc3/drd.c                        | 78 ++++++++++++++++++-
 drivers/usb/roles/class.c                     | 35 ++++++++-
 include/linux/usb/role.h                      | 16 ++++
 6 files changed, 139 insertions(+), 2 deletions(-)

-- 
2.17.1
