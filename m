From: Philip Avinash <avinashphilip@ti.com>
Subject: [PATCH 0/3] Davinci support for EHRPWM & ECAP
Date: Thu, 14 Mar 2013 16:02:35 +0530
Message-ID: <1363257158-11615-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: thierry.reding@avionic-design.de
Cc: nsekhar@ti.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, prakash.pm@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Philip Avinash <avinashphilip@ti.com>
List-Id: devicetree@vger.kernel.org

This patch series enables EHRPWM & ECAP driver support for da850
platforms.

This patch series based on [1] and is available at [2]. This has been tested
backlight support using EHRPWM in da850-evm.

[1] https://gitorious.org/linux-pwm/linux-pwm/trees/for-next
[2] https://github.com/avinashphilip/am335x_linux/tree/davinci-for-v3.9_soc_pwm

Philip Avinash (3):
  pwm: davinci: Add Kconfig support for ECAP & EHRPWM devices
  pwm: pwm-tiecap: Add device-tree binding support for da850 SOC
  pwm: pwm-tiehrpwm: Add device tree binding support for da850 SOC

 .../devicetree/bindings/pwm/pwm-tiecap.txt         |    2 +-
 .../devicetree/bindings/pwm/pwm-tiehrpwm.txt       |    2 +-
 drivers/pwm/Kconfig                                |    8 +++-----
 drivers/pwm/pwm-tiecap.c                           |    1 +
 drivers/pwm/pwm-tiehrpwm.c                         |    1 +
 drivers/pwm/pwm-tipwmss.h                          |    2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.7.9.5

