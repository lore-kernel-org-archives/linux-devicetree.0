From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v4 0/5] GICv3 Save and Restore
Date: Fri,  2 Feb 2018 17:24:45 -0800
Message-ID: <20180203012450.18378-1-dbasehore@chromium.org>
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

Derek Basehore (5):
  cpu_pm: add syscore_suspend error handling
  irqchip/gic-v3-its: add ability to save/restore ITS state
  DT/arm,gic-v3-its: add reset-on-suspend property
  irqchip/gic-v3-its: add ability to resend MAPC on resume
  DT/arm,gic-v3: add collections-reset-on-suspend property

 .../bindings/interrupt-controller/arm,gic-v3.txt   |   7 +
 arch/arm64/Kconfig                                 |  10 +
 drivers/irqchip/irq-gic-v3-its.c                   | 202 +++++++++++++++++----
 kernel/cpu_pm.c                                    |   3 +
 4 files changed, 184 insertions(+), 38 deletions(-)

-- 
2.16.0.rc1.238.g530d649a79-goog
