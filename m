From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/2] add the reset controller to the Meson8b clkc
Date: Wed, 12 Jul 2017 00:49:37 +0200
Message-ID: <20170711224939.26267-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This registers the four CPU (soft) reset lines (one for each CPU core)
provided by the clock controller's HHI_SYS_CPU_CLK_CNTL0 register.

This is the first preparation step for SMP and CPU hotplug support on
Meson8/Meson8b/Meson8m2.

The reset controller part of the meson8b clock controller has to be
registered early (which I did through CLK_OF_DECLARE_DRIVER), because
the secondary cores are started *very* early in the boot process (and
meson8b_clkc_probe is invoked long after we need the reset controller
to be available for booting the secondary CPU cores).

The user of the reset-controller (= the patches which enable SMP and
CPU hotplug support) will follow in the next days. I decided to split
this because the SMP series will probably consist of 6 patches alone
(and may need to go through two separate trees).


Martin Blumenstingl (2):
  clk: meson: meson8b: register the built-in reset controller
  ARM: dts: meson: mark the clock controller also as reset controller

 .../bindings/clock/amlogic,meson8b-clkc.txt        |   7 +-
 arch/arm/boot/dts/meson8.dtsi                      |   1 +
 arch/arm/boot/dts/meson8b.dtsi                     |   1 +
 drivers/clk/meson/Kconfig                          |   1 +
 drivers/clk/meson/meson8b.c                        | 109 ++++++++++++++++++---
 drivers/clk/meson/meson8b.h                        |   1 +
 6 files changed, 107 insertions(+), 13 deletions(-)

-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
