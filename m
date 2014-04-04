From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] ARM: zynq: DT update
Date: Fri,  4 Apr 2014 16:14:11 -0700
Message-ID: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

here's the complete series now. One fix for cpufreq from our vendor tre=
e
and migration to pre-processor syntax.

	Thanks,
	S=C3=B6ren

Changes in v2:
 - Send full series (added patches 1, 4, 5)

Soren Brinkmann (5):
  ARM: zynq: DT: Add 'clock-latency' property
  ARM: zynq: dt: Convert to preprocessor includes
  ARM: zynq: dt: Use #defines for interrupt specifiers
  dt-bindings: clock: Add Zynq-7000 header
  ARM: zynq: dt: Use #defines for clock specifiers

 arch/arm/boot/dts/zynq-7000.dtsi      | 64 ++++++++++++++++++++++-----=
--------
 arch/arm/boot/dts/zynq-zc702.dts      |  2 +-
 arch/arm/boot/dts/zynq-zc706.dts      |  2 +-
 arch/arm/boot/dts/zynq-zed.dts        |  2 +-
 include/dt-bindings/clock/zynq-7000.h | 64 +++++++++++++++++++++++++++=
++++++++
 5 files changed, 107 insertions(+), 27 deletions(-)
 create mode 100644 include/dt-bindings/clock/zynq-7000.h

--=20
1.9.1.1.gbb9f595

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
