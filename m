From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 00/12] On-demand device registration
Date: Fri, 24 Apr 2015 16:47:16 +0200
Message-ID: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Alexander Holler <holler@ahsoftware.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

Hi,

while reading the thread [0] that Alexander Holler started with his series to make probing order deterministic, it occurred to me that it should be possible to achieve the same by probing devices as they are referenced by other devices.

This basically reuses the information that is already embedded in the probe() implementations, saving us from refactoring existing drivers or adding information to DTBs.

The main issue I see is that the registration code path in some subsystems may not be reentrant, so some refactoring of the locking will be needed. In my testing I have found this problem with regulators, as the supply of a regulator might end up being registered during the registration of the first one.

Something I'm not completely happy with is that I have had to move the population of the device tree after all platform drivers have been registered. Otherwise I don't see how I could register drivers on demand as we don't have yet each driver's compatible strings.

I have done my testing on a Tegra124-based Chromebook, and these patches were enough to eliminate all the deferred probes.

Regards,

Tomeu

[0] https://lkml.org/lkml/2014/5/12/452

Tomeu Vizoso (12):
  ARM: tegra: Register drivers before devices
  ARM: tegra: Add gpio-ranges property
  of/platform: add of_platform_device_ensure()
  gpio: Probe GPIO drivers on demand
  gpio: Probe pinctrl devices on demand
  regulator: core: Probe regulators on demand
  drm: Probe panels on demand
  drm/tegra: Probe dpaux devices on demand
  i2c: core: Probe i2c master devices on demand
  pwm: Probe PWM chip devices on demand
  backlight: Probe backlight devices on demand
  usb: phy: Probe phy devices on demand

 arch/arm/boot/dts/tegra124.dtsi     |  1 +
 arch/arm/mach-tegra/tegra.c         | 21 ++++++++-------------
 drivers/gpio/gpiolib-of.c           |  5 +++++
 drivers/gpu/drm/drm_panel.c         |  3 +++
 drivers/gpu/drm/tegra/dpaux.c       |  3 +++
 drivers/i2c/i2c-core.c              |  3 +++
 drivers/of/platform.c               | 28 ++++++++++++++++++++++++++++
 drivers/pwm/core.c                  |  3 +++
 drivers/regulator/core.c            |  2 ++
 drivers/usb/phy/phy.c               |  3 +++
 drivers/video/backlight/backlight.c |  3 +++
 include/linux/of_platform.h         |  2 ++
 12 files changed, 64 insertions(+), 13 deletions(-)

-- 
2.3.6
