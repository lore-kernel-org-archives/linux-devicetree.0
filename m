From: Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v1 0/2] x86/rtc: Add option to skip using RTC
Date: Thu, 22 Aug 2019 15:44:02 +0800
Message-ID: <cover.1566456205.git.rahul.tanwar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, andriy.shevchenko@intel.com, alan@linux.intel.com, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, cheol.yong.kim@intel.com, rahul.tanwar@intel.com, Rahul Tanwar <rahul.tanwar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Platform init ops get_wallclock()/set_wallclock() are by default setup such
that they use MC146818A RTC/CMOS device to set & read time. However, some
products might not support RTC. One such example is Intel Atom based Lightning
Mountain network processor SOC. 

Patch 1: Use status standard property of motorola,mc146818 compatible DT node
to determine if RTC is supported. Skip read/write from RTC device only when
this node is present and status is disabled.

For non DT machines, do not change anything, proceed same as before.

For DT machines, if this node is not present, proceed same as before.

For DT machines, if this node is present but newly introduced status property
is not defined in DTS, proceed same as before.

For DT machines, if this node is present and status property indicates
"disabled", then skip read/write from RTC/CMOS device. If status property
indicates "okay", proceed same as before.

Patch 2: Update dt bindings document to add status property.

These patches are baselined upon Linux 5.3-rc5 at below Git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core


Rahul Tanwar (2):
  x86/rtc: Add option to skip using RTC
  dt-bindings: rtc: Add optional status property

 Documentation/devicetree/bindings/rtc/rtc-cmos.txt |  4 ++++
 arch/x86/kernel/rtc.c                              | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

-- 
2.11.0
