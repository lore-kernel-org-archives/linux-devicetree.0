From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH v1 0/3] NI Ettus Research USRP E3x0 soft-poweroff.
Date: Wed, 18 Feb 2015 10:18:13 -0800
Message-ID: <1424283496-4479-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the NI Ettus Research USRP E3x0 SDR's poweroff
functionality.

v1:
 - Using syscon regmap instead of directly exposing registers.
 - Separate commit for dt bindings.
 - Fixed typo in Kconfig

Moritz Fischer (3):
  power: reset: Add support for NI Ettus Research USRP E3x0
    soft-poweroff.
  dt: power: Add documentation for NI USRP E3x0 soft-poweroff.
  MAINTAINERS: add info for e3x0-poweroff driver.

 .../bindings/power/reset/e3x0-poweroff.txt         | 16 +++++
 MAINTAINERS                                        |  8 +++
 drivers/power/reset/Kconfig                        | 10 +++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/e3x0-poweroff.c                | 79 ++++++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
 create mode 100644 drivers/power/reset/e3x0-poweroff.c

-- 
1.9.3
