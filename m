From: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 0/4] perf: Add APM X-Gene SoC Performance Monitoring Unit driver
Date: Thu, 31 Mar 2016 16:37:48 -0700
Message-ID: <1459467472-31561-1-git-send-email-ttnguyen@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

perf: Add APM X-Gene SoC Performance Monitoring Unit driver

In addition to the X-Gene ARM CPU performance monitoring unit (PMU), there
are PMU for the SoC system devices such as L3 cache(s), I/O bridge(s),
memory controller bridges and memory. These PMU devices are loosely
architected to follow the same model as the PMU for ARM cores.

Signed-off-by: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>

Tai Nguyen (4):
  MAINTAINERS: Add entry for APM X-Gene SoC PMU driver
  Documentation: Add documentation for APM X-Gene SoC PMU DTS binding
  perf: xgene: Add APM X-Gene SoC Performance Monitoring Unit driver
  arm64: dts: apm: Add APM X-Gene SoC PMU DTS entries

 .../devicetree/bindings/perf/apm-xgene-pmu.txt     |  116 ++
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   60 +
 drivers/perf/Kconfig                               |    7 +
 drivers/perf/Makefile                              |    1 +
 drivers/perf/xgene_pmu.c                           | 1447 ++++++++++++++++++++
 6 files changed, 1638 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
 create mode 100644 drivers/perf/xgene_pmu.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
