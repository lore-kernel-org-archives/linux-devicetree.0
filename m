From: "Philip, Avinash" <avinashphilip@ti.com>
Subject: [PATCH 0/2] DT binding support for ECAP & EHRPWM driver
Date: Wed, 26 Sep 2012 16:57:41 +0530
Message-ID: <1348658863-29428-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: thierry.reding@avionic-design.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, nsekhar@ti.com, gururaja.hebbar@ti.com, "Philip, Avinash" <avinashphilip@ti.com>
List-Id: devicetree@vger.kernel.org

These patch set adds
1. DT binding support in drivers.
2. Add custom of_xlate function to request set period & polarity of
   pwm device from client drivers DT.

This has been tested on AM335X-EVM for PWM backlight based on tree
[1] merged with [2].
1. linux-next/master
2. linux-omap-dt/for_3.7/dts_part2

Philip, Avinash (2):
  pwm: pwm-tiecap: Add device-tree binding support for APWM driver
  pwm: pwm-tiehrpwm: Add device-tree binding support for EHRPWM driver

 .../devicetree/bindings/pwm/pwm-tiecap.txt         |   26 +++++
 .../devicetree/bindings/pwm/pwm-tiehrpwm.txt       |   26 +++++
 drivers/pwm/pwm-tiecap.c                           |  108 +++++++++++++++++++
 drivers/pwm/pwm-tiehrpwm.c                         |  110 ++++++++++++++++++++
 4 files changed, 270 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt

