From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] enable reset_control_reset for shared reset lines
Date: Sat,  1 Oct 2016 17:21:31 +0200
Message-ID: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch allows using reset_control_reset on a shared reset line.
There are some restrictions though (all of these only apply to shared
resets):
- reset_control_reset cannot be used after reset_control_assert
- reset_control_assert cannot be used after reset_control_reset
- only the first call to reset_control_reset will be passed to the
  hardware. The only exception is when all consumers of the
  reset_control are gone (reset_control_put)

The idea came up when discussing the reset logic in the
phy-meson8b-usb2 PHY driver, see [0] and [1]

An example where this is needed is the Amlogic Meson8b and GXBB SoCs
where two USB PHYs share one reset line. The reset controller only
supports reset pulses (and thus only implements .reset).
The only workaround so far is to make the reset optional in the
driver and only add the reset to one of the two PHYs, to mimic the
behavior implemented by patch 1.

I also added the Meson USB2 PHY patch to this series to show that this
new functionality can be used with only minimal changes. These patches
can simply be dropped as they depend on the phy-meson8b-usb2 driver
patch, and the dts patch has a runtime-dependency on patch 1 and 2
(otherwise the phy-meson8b-usb2 driver would try to request the reset
line exclusively, preventing the other PHY from initializing).


[0] http://lists.infradead.org/pipermail/linux-amlogic/2016-September/001233.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2016-September/001197.html


Martin Blumenstingl (3):
  reset: allow using reset_control_reset with shared reset
  phy: meson8b-usb2: request a shared reset line
  ARM64: dts: meson-gxbb: add the USB reset also to the second USB PHY

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  1 +
 drivers/phy/phy-meson8b-usb2.c              |  3 +--
 drivers/reset/core.c                        | 31 +++++++++++++++++++++++------
 3 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
