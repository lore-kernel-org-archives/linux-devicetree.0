From: Sourav Poddar <sourav.poddar@ti.com>
Subject: [PATCH 0/3] Add more device nodes for am43x gp evm.
Date: Wed, 27 Nov 2013 13:01:16 +0530
Message-ID: <1385537479-6959-1-git-send-email-sourav.poddar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: rob.herring@calxeda.com, mark.rutland@arm.com, swarren@wwwdotorg.org, devicetree@vger.kernel.org, tony@atomide.com, bcousson@baylibre.com
Cc: balbi@ti.com, linux-omap@vger.kernel.org, nsekhar@ti.com, Sourav Poddar <sourav.poddar@ti.com>
List-Id: devicetree@vger.kernel.org

The patch series adds support for enabling gpio, pwm backlight and
matrix gpio keys on am43x-gp-evm.

Done on top of 3.13-rc1 + tero clock series(1) + Afzal's basic gp support(2).

[1]: https://patchwork.kernel.org/patch/3009541/
[2]: https://patchwork.kernel.org/patch/3171761/

Tested on am43x-gp-evm.

There is a some bug while using regulators through backlight
driver on 3.13-rc1. So, tested pwm part with this patch[3].

[3]: http://www.spinics.net/lists/arm-kernel/msg288215.html

Sourav Poddar (3):
  arm: dts: am437x-gp-evm: Enable gpio.
  ARM: dts: am43x-gp-evm: Add matrix gpio keys.
  ARM: dts: am437x-gp-evm: Add pwm backlight support.

 arch/arm/boot/dts/am437x-gp-evm.dts |   53 +++++++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

