From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v13 0/3] ARM: rk3288: Add PM Domain support
Date: Sun, 19 Apr 2015 18:15:49 +0800
Message-ID: <1429438552-17733-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@kernel.org>, Caesar Wang <wxt@rock-chips.com>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Russell King <linux@arm.linux.org.uk>
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
 arch/arm/mach-rockchip/pm_domains.c                | 509 +++++++++++++++++++++
 include/dt-bindings/power-domain/rk3288.h          |  11 +
 6 files changed, 629 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/power_domain.txt
 create mode 100644 arch/arm/mach-rockchip/pm_domains.c
 create mode 100644 include/dt-bindings/power-domain/rk3288.h

-- 
1.9.1

