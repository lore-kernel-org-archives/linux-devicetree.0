From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 0/2] extcon: Add fsa9480 extcon driver
Date: Fri, 21 Jun 2019 13:13:50 +0200
Message-ID: <20190621111352.22976-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

This small patchset adds support for Fairchild Semiconductor FSA9480
microUSB switch.

It has been tested on Samsung Galaxy S and Samsung Fascinate 4G,
but it can be found also on other Samsung Aries (s5pv210) based devices.

Tomasz Figa (2):
  dt-bindings: extcon: Add support for fsa9480 switch
  extcon: Add fsa9480 extcon driver

Changes from v1:
  - Added newline at end of dt-bindings file
  - Removed interrupt-parent from dt-bindings file
  - Added Acked-by to dt-bindings patch
  - Remove license sentences from driver
  - Remove custom sysfs entries and manual switch code
  - Switch to using regmap api

 .../bindings/extcon/extcon-fsa9480.txt        |  19 +
 drivers/extcon/Kconfig                        |  12 +
 drivers/extcon/Makefile                       |   1 +
 drivers/extcon/extcon-fsa9480.c               | 395 ++++++++++++++++++
 4 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
 create mode 100644 drivers/extcon/extcon-fsa9480.c

-- 
2.17.1
