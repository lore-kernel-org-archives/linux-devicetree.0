From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 0/6] add USB Type-B GPIO based role switch driver
Date: Fri, 15 Mar 2019 15:38:27 +0800
Message-ID: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Because the USB Connector is introduced and the requirement of
usb-connector.txt binding, the old way using extcon to support
USB Dual-Role switch is now deprecated, meanwhile there is no
available common driver when use Type-B connector.
This patch series introduce a Type-B connector driver and try
to replace the function provided by extcon-usb-gpio driver.
The main purpose of the patches is also to solve the Type-B
connector problem encountered in [1].

[1]: https://patchwork.kernel.org/patch/10819377/

v2 changes:
 1. make binding clear, and add a extra compatible suggested by Hans

Chunfeng Yun (6):
  dt-bindings: connector: add optional properties for Type-B
  dt-bindings: usb: add binding for Type-B dual role switch by GPIO
  dt-bindings: usb: mtu3: add properties about USB Role Switch
  usb: roles: add API to get usb_role_switch by node
  usb: roles: add driver of USB Type-B role switch by GPIO
  usb: mtu3: register a USB Role Switch for dual role mode

 .../bindings/connector/usb-connector.txt      |   9 +
 .../devicetree/bindings/usb/mediatek,mtu3.txt |  10 +-
 .../bindings/usb/typeb-switch-gpio.txt        |  26 ++
 drivers/usb/mtu3/mtu3.h                       |   5 +
 drivers/usb/mtu3/mtu3_dr.c                    |  50 ++-
 drivers/usb/mtu3/mtu3_plat.c                  |   3 +-
 drivers/usb/roles/Kconfig                     |  14 +
 drivers/usb/roles/Makefile                    |   1 +
 drivers/usb/roles/class.c                     |  30 ++
 drivers/usb/roles/typeb-switch-gpio.c         | 285 ++++++++++++++++++
 include/linux/usb/role.h                      |   1 +
 11 files changed, 428 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typeb-switch-gpio.txt
 create mode 100644 drivers/usb/roles/typeb-switch-gpio.c

-- 
2.20.1
