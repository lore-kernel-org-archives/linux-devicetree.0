From: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 0/7] arm64: perf: Broadcom Vulcan PMU support
Date: Thu, 21 Apr 2016 05:58:38 -0700
Message-ID: <1461243525-13603-1-git-send-email-ashoks@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cleaned up event naming convention as per ARM ARM.

Added macros for complete ARMv8 recommended implementation defined events.

changed pmu register access to make use of read/write_sys_reg.

Common architectural and micro-architectural events which are exported to /sys
are now filtered using PMCEIDn_EL0

Added support for Broadcom Vulcan PMU.

changes since v5 [5]:
 Incorporated the following review comments from Mark.
 * Folded armv8pmu_probe_num_events and armv8pmu_read_common_events_bitmap.
 * Changed format string in event number print from 0x%02llx to 0x%03llx
 * Added ARM ARM doc number in commit logs wherever referenced.
 * Fixed sysreg.h order in perf_event.c

changes since v4 [4]:
 * Used read/write_sys_reg for pmu register access as per Suzuki's review 
   comment from v2.

changes since v3 [3]:
 * Changed the order of patchset to match devicetree submission guidelines.
 * Rebased on 4.6-rc3

changes since v2 [2]:
 * Changed event filtering mechanism to use is_visible function pointer
   of attribute_group instead of copying to a new events attribute 
   structure as per Mark's review comments.

changes since v1 [1]:
 Incorporated the following review comments from Will.
 * cleaned up event naming convention as per ARM ARM
 * Filtered common events based on PMCEIDn_EL0
 * Removed exposing implementation defined events to /sys.

[1] http://www.spinics.net/lists/arm-kernel/msg490954.html
[2] http://www.spinics.net/lists/arm-kernel/msg492439.html
[3] http://www.spinics.net/lists/arm-kernel/msg492941.html
[4] http://www.spinics.net/lists/arm-kernel/msg496151.html
[5] http://www.spinics.net/lists/arm-kernel/msg498411.html

Ashok Kumar (7):
  Documentation: arm64: pmu: Add Broadcom Vulcan PMU binding
  arm64: dts: Add Broadcom Vulcan PMU in dts
  arm64/perf: Changed events naming as per the ARM ARM
  arm64/perf: Define complete ARMv8 recommended implementation defined
    events
  arm64/perf: Access pmu register using <read/write>_sys_reg
  arm64/perf: Filter common events based on PMCEIDn_EL0
  arm64/perf: Add Broadcom Vulcan PMU support

 Documentation/devicetree/bindings/arm/pmu.txt |   3 +-
 arch/arm64/boot/dts/broadcom/vulcan.dtsi      |   2 +-
 arch/arm64/kernel/perf_event.c                | 550 +++++++++++++++++---------
 include/linux/perf/arm_pmu.h                  |   2 +
 4 files changed, 369 insertions(+), 188 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
