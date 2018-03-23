Return-Path: <SRS0=8UYE=GN=nxp.com=jun.li@kernel.org>
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 0/5] usb: typec: remove max_snk_mv/ma/mw
Date: Fri, 23 Mar 2018 22:58:42 +0800
Message-Id: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch set is to remove max_snk_mv/ma/mw configs, as we should
define the sink capability by sink PDOs, the first patch update
the source PDO match policy by compare the voltage range between
source and sink PDOs no matter what type they are, the following
patchs remove those 3 variables from 2 existing users by adding
a variable PDO, then finial patch remove the max_snk_* from tcpm.

Changes for v2:
- rebase the 1st patch to be based on commit 6f566af34628
  ("Revert "typec: tcpm: Only request matching pdos"").
- Convert the device properties passing max_snk_* to be a
  variable sink pdo for fusb302.
 
Li Jun (5):
  usb: typec: tcpm: pdo matching optimization
  usb: typec: fusb302:  remove max_snk_* for sink config
  dt-bindings: usb: fusb302: remove max-sink-* properties
  usb: typec: wcove: remove max_snk_* for sink config
  usb: typec: tcpm: remove max_snk_mv/ma/mw

 .../devicetree/bindings/usb/fcs,fusb302.txt        |   6 -
 drivers/usb/typec/fusb302/fusb302.c                |  51 +++++---
 drivers/usb/typec/tcpm.c                           | 139 +++++++++++++--------
 drivers/usb/typec/typec_wcove.c                    |   4 +-
 include/linux/usb/tcpm.h                           |   9 --
 5 files changed, 128 insertions(+), 81 deletions(-)

-- 
2.7.4
