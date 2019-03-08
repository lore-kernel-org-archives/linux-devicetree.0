From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 0/5] add USB Type-B connector driver
Date: Fri, 8 Mar 2019 14:13:37 +0800
Message-ID: <1552025622-15582-1-git-send-email-chunfeng.yun@mediatek.com>
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

Chunfeng Yun (5):
  dt-bindings: connector: add optional properties for Type-B
  dt-bindings: usb: mtu3: add properties about USB Role Switch
  usb: roles: add API to get usb_role_switch by node
  usb: roles: add USB Type-B connector driver
  usb: mtu3: register a USB Role Switch for Dual-Role mode

 .../bindings/connector/usb-connector.txt      |  10 +
 .../devicetree/bindings/usb/mediatek,mtu3.txt |  10 +-
 drivers/usb/mtu3/mtu3.h                       |   5 +
 drivers/usb/mtu3/mtu3_dr.c                    |  50 ++-
 drivers/usb/mtu3/mtu3_plat.c                  |   3 +-
 drivers/usb/roles/Kconfig                     |  14 +
 drivers/usb/roles/Makefile                    |   1 +
 drivers/usb/roles/class.c                     |  30 ++
 drivers/usb/roles/usb-b-connector.c           | 285 ++++++++++++++++++
 include/linux/usb/role.h                      |   1 +
 10 files changed, 403 insertions(+), 6 deletions(-)
 create mode 100644 drivers/usb/roles/usb-b-connector.c

-- 
2.20.1
