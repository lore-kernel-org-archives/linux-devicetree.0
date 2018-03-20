From: ShuFan Lee <leechu729@gmail.com>
Subject: [PATCH v4 0/2] staging: typec: rt1711h typec driver and dt-bindings
Date: Tue, 20 Mar 2018 17:15:02 +0800
Message-ID: <1521537304-7531-1-git-send-email-leechu729@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: shufan_lee@richtek.com, cy_huang@richtek.com, jun.li@nxp.com, mats.dev.list@gmail.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: ShuFan Lee <shufan_lee@richtek.com>

This patch series add rt1711h typec chip driver and dt-bindings

changelogs between v1 & v2
- use gpiod_* instead of gpio_*

changelogs between v2 & v3
- add dt-bindings for rt1711h typec driver

changelogs between v3 & v4
- add definition of RT1711H_VID and RT1711H_PID
- modify the way of using RT1711H_RTCTRL8_SET in rt1711h_set_vconn

ShuFan Lee (2):
  staging: typec: rt1711h typec chip driver
  dt-bindings: usb: rt1711h device tree binding document

 .../devicetree/bindings/usb/richtek,rt1711h.txt    |  30 ++
 drivers/staging/typec/Kconfig                      |   8 +
 drivers/staging/typec/Makefile                     |   1 +
 drivers/staging/typec/tcpci.h                      |   1 +
 drivers/staging/typec/tcpci_rt1711h.c              | 332 +++++++++++++++++++++
 5 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
 create mode 100644 drivers/staging/typec/tcpci_rt1711h.c

-- 
1.9.1
