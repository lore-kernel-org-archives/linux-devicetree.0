From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v6 0/3] GICv3 Save and Restore
Date: Wed,  7 Feb 2018 18:36:45 -0800
Message-ID: <20180208023648.89124-1-dbasehore@chromium.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Soby.Mathew@arm.com, sudeep.holla@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com, tglx@linutronix.de, briannorris@chromium.org, marc.zyngier@arm.com, Derek Basehore <dbasehore@chromium.org>
List-Id: devicetree@vger.kernel.org

A lot of changes in v2. The distributor and redistributor saving and
restoring is left to the PSCI/firmware implementation after
discussions with ARM. This reduces the line changes by a lot and
removes now unneeded patches.

Patches are verified on an RK3399 platform with pending patches in the
ARM-Trusted-Firmware project.

Just a couple minor changes in v3 to formatting.

Fixed a false ITS wedged detection due to the cmd_write and creadr
offsets not matching up on reset in v4. Also minor formatting changes.

Got rid of additional device tree property with detecting if there are
collections stored in the ITS in v5. Made other minor changes.

v6: Fixed reinitialized collections to only happen when the collection
is stored in the ITS. Changed error handling to avoid undefined
behavior of the ITS.
 
Derek Basehore (3):
  irqchip/gic-v3-its: add ability to save/restore ITS state
  DT/arm,gic-v3-its: add reset-on-suspend property
  irqchip/gic-v3-its: add ability to resend MAPC on resume

 .../bindings/interrupt-controller/arm,gic-v3.txt   |   3 +
 drivers/irqchip/irq-gic-v3-its.c                   | 189 ++++++++++++++++-----
 include/linux/irqchip/arm-gic-v3.h                 |   1 +
 3 files changed, 155 insertions(+), 38 deletions(-)

-- 
2.16.0.rc1.238.g530d649a79-goog
