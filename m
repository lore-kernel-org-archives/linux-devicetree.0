From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/2] minor GXL and GXM improvements
Date: Wed, 23 Nov 2016 17:20:38 +0100
Message-ID: <20161123162040.24843-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds SCPI support to GXL and GXM SoCs by moving the nodes
to meson-gx.dtsi. Additionally this updates the compatible string to
match the recent changes, see [0]

Now that we have SCPI support for GXM we can also use it to configure
the CPU cores using the SCPI DVFS clocks.

[0] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001632.html

Martin Blumenstingl (2):
  ARM64: dts: meson-gx: move the SCPI and SRAM nodes to meson-gx
  ARM64: dts: meson-gxm: add SCPI configuration for GXM

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 45 +++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 57 -----------------------------
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi  |  9 +++++
 3 files changed, 54 insertions(+), 57 deletions(-)

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
