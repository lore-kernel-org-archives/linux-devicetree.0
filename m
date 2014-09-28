From: "jinkun.hong" <jinkun.hong@rock-chips.com>
Subject: [PATCH v2 0/3] ARM: rk3288 : Add PM Domain support
Date: Sun, 28 Sep 2014 03:22:51 -0700
Message-ID: <1411899774-8484-1-git-send-email-jinkun.hong@rock-chips.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: "jinkun.hong" <jinkun.hong@rock-chips.com>

Use PM Domain framework to manage the clock.

Changes in v2:
- remove the "pd->pd.of_node = np"
Adviced by Doug
- move clocks to "optional"
Adviced by Daniel
- make pd_vio clocks all one entry per line and alphabetize.
Adviced by Heiko
- power: power-controller move back to pinctrl: pinctrl.

jinkun.hong (3):
  power-domain: add power domain drivers for Rockchip platform
  dt-bindings: add document of Rockchip power domain
  ARM: dts: add rk3288 power-domain node

 .../bindings/arm/rockchip/power_domain.txt         |   48 +++
 arch/arm/boot/dts/rk3288.dtsi                      |   67 ++++
 arch/arm/mach-rockchip/Kconfig                     |    1 +
 arch/arm/mach-rockchip/Makefile                    |    1 +
 arch/arm/mach-rockchip/pm_domains.c                |  371 ++++++++++++++++++++
 include/dt-bindings/power-domain/rk3288.h          |   11 +
 6 files changed, 499 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/power_domain.txt
 create mode 100644 arch/arm/mach-rockchip/pm_domains.c
 create mode 100644 include/dt-bindings/power-domain/rk3288.h

-- 
1.7.9.5

