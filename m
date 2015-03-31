From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH 0/4] extcon: usb-gpio: fixes and improvements
Date: Tue, 31 Mar 2015 09:45:59 +0200
Message-ID: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

Hello,

This patch set modifies extcon-usb-gpio driver fixing bugs, and adds
new features - VBUS pin detection support and 'debounce' property in
devicetree node. It also updates documentation with information about
new features.

More detailed description of changes can be found in commit messages.

Best regards,
Robert Baldyga

Robert Baldyga (4):
  extcon: usb-gpio: register extcon device before IRQ registration
  extcon: usb-gpio: add support for VBUS detection
  extcon: usb-gpio: make debounce value configurable in devicetree
  Documentation: extcon: usb-gpio: update usb-gpio binding description

 .../devicetree/bindings/extcon/extcon-usb-gpio.txt |  23 ++-
 drivers/extcon/extcon-usb-gpio.c                   | 171 +++++++++++++++------
 2 files changed, 147 insertions(+), 47 deletions(-)

-- 
1.9.1
