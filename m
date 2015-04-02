From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH v3 0/4] extcon: usb-gpio: fixes and improvements
Date: Thu, 02 Apr 2015 15:13:01 +0200
Message-ID: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

Hello,

This patch set modifies extcon-usb-gpio driver fixing bugs, and adds
new features - VBUS pin detection support and 'debounce' property in
devicetree node. It also updates documentation with information about
new features.

More detailed description of changes can be found in commit messages.

Best regards,
Robert Baldyga

Changelog:
v3:
- reduced number of redundant calls of extcon_set_cable_state() function

v2: https://lkml.org/lkml/2015/4/1/84
- addressed Roger's comments

v1: https://lkml.org/lkml/2015/3/31/96

Robert Baldyga (4):
  extcon: usb-gpio: register extcon device before IRQ registration
  extcon: usb-gpio: add support for VBUS detection
  extcon: usb-gpio: make debounce value configurable in devicetree
  Documentation: extcon: usb-gpio: update usb-gpio binding description

 .../devicetree/bindings/extcon/extcon-usb-gpio.txt |  28 +++-
 drivers/extcon/extcon-usb-gpio.c                   | 181 +++++++++++++++------
 2 files changed, 153 insertions(+), 56 deletions(-)

-- 
1.9.1
