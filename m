From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v14 0/3] ARM: rk3288: Add PM Domain support
Date: Fri, 24 Apr 2015 16:07:45 +0800
Message-ID: <1429862868-14218-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, khilman@linaro.org, linux-arm-kernel@lists.infradead.org
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, grant.likely@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, ulf.hansson@linaro.org, dmitry.torokhov@gmail.com, broonie@kernel.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

    Add power domain drivers based on generic power domain for
Rockchip platform, and support RK3288.

    Verified on url =
    https://chromium.googlesource.com/chromiumos/third_party/kernel.

    At the moment,there are mass of products are using the driver.
I believe the driver can happy work for next kernel.



Caesar Wang (3):
  dt-bindings: add document of Rockchip power domain
  power-domain: rockchip: add power domain driver
  ARM: dts: add RK3288 power-domain node

 .../bindings/arm/rockchip/power_domain.txt         |  48 ++
 arch/arm/boot/dts/rk3288.dtsi                      |  59 +++
 arch/arm/mach-rockchip/Kconfig                     |   1 +
 arch/arm/mach-rockchip/Makefile                    |   1 +
 arch/arm/mach-rockchip/pm_domains.c                | 506 +++++++++++++++++++++
 include/dt-bindings/power-domain/rk3288.h          |  11 +
 6 files changed, 626 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/power_domain.txt
 create mode 100644 arch/arm/mach-rockchip/pm_domains.c
 create mode 100644 include/dt-bindings/power-domain/rk3288.h

-- 
1.9.1
