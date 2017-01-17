From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v4 0/4] arm64: dts: juno: CoreSight support updates
Date: Tue, 17 Jan 2017 12:15:09 +0000
Message-ID: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Suzuki K . Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Juno r1/r2 boards have different CoreSight infrastructure outside the
CPU clusters. This patchset adds the additional coreSight components to
separate .dtsi files to support these differences.

v1->v2:
	- moved the addition of the STM component into a separate patch

v2->v3:
	- moved the back the common coreSight components back into
	  juno-base.dtsi

v3->v4:
	- removed dtsi nesting in the existing Juno dts file to avoid
	  further addition of such nesting
	- renamed some of the funnel and etf node names(which were
	  previously named confusing them to the labels

Mike Leach (2):
  arm64: dts: juno: add CoreSight support for Juno r1/r2 variants
  arm64: dts: juno: add missing CoreSight STM component

Sudeep Holla (2):
  arm64: dts: juno: remove dtsi nesting inside tree structure
  arm64: dts: juno: refactor CoreSight support on Juno r0

 arch/arm64/boot/dts/arm/juno-base.dtsi    |  41 ++++++++----
 arch/arm64/boot/dts/arm/juno-clocks.dtsi  |   3 +-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 100 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-r1.dts       |  16 ++++-
 arch/arm64/boot/dts/arm/juno-r2.dts       |  16 ++++-
 arch/arm64/boot/dts/arm/juno.dts          |  27 +++++++-
 6 files changed, 184 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
